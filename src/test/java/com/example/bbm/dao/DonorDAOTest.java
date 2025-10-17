package com.example.bbm.dao;

import com.example.bbm.dto.DonorDTO;
import com.example.bbm.entity.Donor;
import com.example.bbm.enums.BloodType;
import com.example.bbm.util.JpaUtil;
import org.junit.jupiter.api.AfterEach;
import org.junit.jupiter.api.BeforeEach;
import org.junit.jupiter.api.Test;
import org.mockito.MockedStatic;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;
import java.util.List;

import static org.junit.jupiter.api.Assertions.*;
import static org.mockito.Mockito.*;

public class DonorDAOTest {

    private DonorDAO donorDAO;
    private EntityManager em;
    private EntityTransaction transaction;
    private MockedStatic<JpaUtil> jpaUtilMock;

    @BeforeEach
    void setUp() {
        // Mock EntityManager and Transaction
        em = mock(EntityManager.class);
        transaction = mock(EntityTransaction.class);

        // Mock static method JpaUtil.getEntityManager()
        jpaUtilMock = mockStatic(JpaUtil.class);
        jpaUtilMock.when(JpaUtil::getEntityManager).thenReturn(em);

        when(em.getTransaction()).thenReturn(transaction);

        donorDAO = new DonorDAO();
    }

    @Test
    void testCreateDonor_Success() throws Exception {
        // Arrange
        DonorDTO dto = new DonorDTO();
        dto.setId(1L);
        dto.setFirstName("Youssef");
        dto.setLastName("Elhoubi");
        dto.setEmail("youssef@example.com");

        // Act
        DonorDTO result = donorDAO.create(dto);

        // Assert
        verify(em).persist(any(Donor.class));
        verify(transaction).begin();
        verify(transaction).commit();
        assertEquals("Youssef", result.getFirstName());
    }

    @Test
    void testFindByBloodType_ReturnsList() {
        // Arrange
        TypedQuery<Donor> query = mock(TypedQuery.class);
        when(em.createQuery(anyString(), eq(Donor.class))).thenReturn(query);
        when(query.setParameter(eq("bloodType"), any())).thenReturn(query);
//        when(query.getResultList()).thenReturn(List.of(new Donor()));

        // Act
        List<DonorDTO> result = donorDAO.findByBloodType(BloodType.A_POSITIVE);

        // Assert
        verify(em).createQuery(contains("FROM Donor WHERE bloodType"), eq(Donor.class));
        assertEquals(1, result.size());
    }

    @Test
    void testFindById_ReturnsDonor() {
        // Arrange
        Donor donor = new Donor();
        donor.setId(1L);
        donor.setFirstName("Ali");
        when(em.find(Donor.class, 1L)).thenReturn(donor);

        // Act
        DonorDTO result = donorDAO.findById(1L);

        // Assert
        verify(em).find(Donor.class, 1L);
        assertEquals("Ali", result.getFirstName());
    }

    @Test
    void testUpdateDonor_NotFound_ThrowsException() {
        // Arrange
        DonorDTO dto = new DonorDTO();
        dto.setId(999L);
        when(em.find(Donor.class, 999L)).thenReturn(null);

        // Act & Assert
        RuntimeException ex = assertThrows(RuntimeException.class, () -> donorDAO.update(dto));
        assertTrue(ex.getMessage().contains("Donor not found"));
        verify(transaction).rollback();
    }

    @AfterEach
    void tearDown() {
        // Release static mock
        jpaUtilMock.close();
    }
}
