package com.example.bbm.dao;

import com.example.bbm.dto.RecipientDTO;
import com.example.bbm.entity.Recipient;
import com.example.bbm.util.JpaUtil;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class RecipientDAO {
    private final EntityManager em = JpaUtil.getEntityManager();

    private RecipientDTO toDTO(Recipient recipient) {
        return new RecipientDTO(
                recipient.getId(),
                recipient.getFirstName(),
                recipient.getLastName(),
                recipient.getEmail(),
                recipient.getPhoneNumber(),
                recipient.getDateOfBirth(),
                recipient.getGender(),
                recipient.getBloodType(),
                recipient.getRegistrationDate(),
                recipient.getMedicalCondition(),
                recipient.getState(),
                recipient.getRequiredBloodBags(),
                recipient.getCurrentBloodBags(),
                recipient.getHospital(),
                recipient.getDoctorName(),
                recipient.getMedicalCase(),
                recipient.getSatisfiedDate()
        );
    }

    private Recipient toEntity(RecipientDTO dto) {
        Recipient recipient = new Recipient();

        recipient.setId(dto.getId());
        recipient.setFirstName(dto.getFirstName());
        recipient.setLastName(dto.getLastName());
        recipient.setEmail(dto.getEmail());
        recipient.setPhoneNumber(dto.getPhoneNumber());
        recipient.setDateOfBirth(dto.getDateOfBirth());
        recipient.setGender(dto.getGender());
        recipient.setBloodType(dto.getBloodType());
        recipient.setRegistrationDate(dto.getRegistrationDate());

        recipient.setMedicalCondition(dto.getMedicalCondition());
        recipient.setState(dto.getState());
        recipient.setRequiredBloodBags(dto.getRequiredBloodBags());
        recipient.setCurrentBloodBags(dto.getCurrentBloodBags());
        recipient.setHospital(dto.getHospital());
        recipient.setDoctorName(dto.getDoctorName());
        recipient.setMedicalCase(dto.getMedicalCase());
        recipient.setSatisfiedDate(dto.getSatisfiedDate());

        return recipient;
    }

    public RecipientDTO create(RecipientDTO dto) {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Recipient recipient = toEntity(dto);
            em.persist(recipient);
            tx.commit();
            return toDTO(recipient);
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Failed to create recipient: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    public RecipientDTO findById(UUID id) {
        try {
            Recipient recipient = em.find(Recipient.class, id);
            return toDTO(recipient);
        } finally {
            em.close();
        }
    }

    public RecipientDTO findByEmail(String email) {
        try {
            Recipient recipient = em.createQuery("SELECT r FROM Recipient r WHERE r.email = :email", Recipient.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return toDTO(recipient);
        } finally {
            em.close();
        }
    }

    public RecipientDTO findByPhoneNumber(String phoneNumber) {
        try {
            Recipient recipient = em.createQuery("SELECT r FROM Recipient r WHERE r.phoneNumber = :phoneNumber", Recipient.class)
                    .setParameter("phoneNumber", phoneNumber)
                    .getSingleResult();
            return toDTO(recipient);
        } finally {
            em.close();
        }
    }

    public RecipientDTO findByBloodType(String bloodType) {
        try {
            Recipient recipient = em.createQuery("SELECT r FROM Recipient r WHERE r.bloodType = :bloodType", Recipient.class)
                    .setParameter("bloodType", bloodType)
                    .getSingleResult();
            return toDTO(recipient);
        } finally {
            em.close();
        }
    }
    public  List<RecipientDTO> findAll() {
        try {
            List<Recipient> recipients = em.createQuery("FROM Recipient r", Recipient.class).getResultList();
            return recipients.stream().map(this::toDTO).collect(Collectors.toList());
        }finally {
            em.close();
        }
    }
    public List<RecipientDTO> findAllOrderedByMedicalCondition() {
        try {
            String jpql = " SELECT r FROM Recipient r ORDER BY CASE WHEN r.medicalCondition = com.example.bbm.enums.MedicalCondition.CRITICAL THEN 1 WHEN r.medicalCondition = com.example.bbm.enums.MedicalCondition.URGENT THEN 2 WHEN r.medicalCondition = com.example.bbm.enums.MedicalCondition.NORMAL THEN 3 ELSE 4 END";
            List<Recipient> recipient =  em.createQuery(jpql, Recipient.class).getResultList();
            return recipient.stream().map(this::toDTO).collect(java.util.stream.Collectors.toList());
        } finally {
            em.close();
        }
    }
    public List<RecipientDTO> findAllOrderedByState() {
        try {
            String jpql = " SELECT r FROM Recipient r ORDER BY CASE WHEN r.state = com.example.bbm.enums.RecipientState.ACCEPTED THEN 1 WHEN r.state = com.example.bbm.enums.RecipientState.PENDING THEN 2 ELSE 3 END";
            List<Recipient> recipient =  em.createQuery(jpql, Recipient.class).getResultList();
            return recipient.stream().map(this::toDTO).collect(java.util.stream.Collectors.toList());
        } finally {
            em.close();
        }
    }
    public RecipientDTO update(RecipientDTO dto) {
        EntityManager em = JpaUtil.getEntityManager();
        EntityTransaction tx = em.getTransaction();
        try {
            tx.begin();
            Recipient existing = em.find(Recipient.class, dto.getId());
            if (existing == null)
                throw new RuntimeException("Recipient not found with ID " + dto.getId());

            Recipient updated = toEntity(dto);
            Recipient merged = em.merge(updated);
            tx.commit();
            return toDTO(merged);
        } catch (Exception e) {
            if (tx.isActive()) tx.rollback();
            throw new RuntimeException("Failed to update recipient: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }
}
