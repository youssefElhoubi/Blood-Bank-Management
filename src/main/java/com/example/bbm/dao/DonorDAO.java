package com.example.bbm.dao;

import com.example.bbm.dto.DonorDTO;
import com.example.bbm.entity.Donor;
import com.example.bbm.util.JpaUtil;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class DonorDAO {
    private final EntityManager em = JpaUtil.getEntityManager();

    private DonorDTO toDTO(Donor donor) {
        if (donor == null) return null;
        return new DonorDTO(
                donor.getId(),
                donor.getFirstName(),
                donor.getLastName(),
                donor.getEmail(),
                donor.getPhoneNumber(),
                donor.getDateOfBirth(),
                donor.getGender(),
                donor.getBloodType(),
                donor.getRegistrationDate(),
                donor.getWeight(),
                donor.getDonorStatus(),
                donor.getLastDonationDate(),
                donor.getPregnant(),
                donor.getBreastfeeding(),
                donor.getMedicalNotes(),
                donor.getDesize()
        );
    }

    private Donor toEntity(DonorDTO dto) {
        Donor donor = new Donor();
        donor.setId(dto.getId());
        donor.setFirstName(dto.getFirstName());
        donor.setLastName(dto.getLastName());
        donor.setEmail(dto.getEmail());
        donor.setPhoneNumber(dto.getPhoneNumber());
        donor.setDateOfBirth(dto.getDateOfBirth());
        donor.setGender(dto.getGender());
        donor.setBloodType(dto.getBloodType());
        donor.setRegistrationDate(dto.getRegistrationDate());
        donor.setWeight(dto.getWeight());
        donor.setDonorStatus(dto.getDonorStatus());
        donor.setLastDonationDate(dto.getLastDonationDate());
        donor.setPregnant(dto.getIsPregnant());
        donor.setBreastfeeding(dto.getIsBreastfeeding());
        donor.setMedicalNotes(dto.getMedicalNotes());
        donor.setDesize(dto.getDesize());
        return donor;
    }

    public DonorDTO create(DonorDTO dto) throws Exception {
        try {
            em.getTransaction().begin(); // ✅ Start transaction

            Donor donor = toEntity(dto);
            em.persist(donor);

            em.getTransaction().commit(); // ✅ Commit the transaction
            return toDTO(donor);
        } catch (Exception e) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback(); // 🔁 Rollback on error
            }
            throw new RuntimeException(e.getMessage());
        } finally {
            em.close();
        }
    }

    public List<DonorDTO> findAll() throws Exception {

        EntityManager emg = JpaUtil.getEntityManager();
        try {
            List<Donor> donors = em.createQuery("FROM Donor", Donor.class).getResultList();

            return donors.stream()
                    .map(this::toDTO)
                    .collect(Collectors.toList());

        } finally {
            emg.close();
        }
    }

    public DonorDTO update(DonorDTO dto) {
        try {
            Donor existing = em.find(Donor.class, dto.getId());
            if (existing == null) throw new RuntimeException("Donor not found");
            Donor updated = toEntity(dto);
            Donor merged = em.merge(updated);
            return toDTO(merged);
        } finally {
            em.close();
        }
    }

    public DonorDTO findById(UUID id) {
        try {
            Donor donor = em.find(Donor.class, id);
            return toDTO(donor);
        } finally {
            em.close();
        }
    }
    public DonorDTO findByEmail(String email) {
        try {
            Donor donor = em.createQuery("SELECT d FROM Donor d WHERE d.email = :email", Donor.class)
                    .setParameter("email", email)
                    .getSingleResult();
            return toDTO(donor);
        }finally {
            em.close();
        }
    }
    public DonorDTO findByPhoneNumber(String phoneNumber) {
        try {
            Donor donor = em.createQuery("SELECT d FROM Donor d WHERE d.phoneNumber = :phoneNumber", Donor.class)
                    .setParameter("phoneNumber", phoneNumber)
                    .getSingleResult();
            return toDTO(donor);
        }finally {
            em.close();
        }
    }
    public List<DonorDTO> findByBloodType(String bloodType) {
        try {
            List<Donor> donors = em.createQuery("SELECT d FROM Donor d WHERE d.bloodType = :bloodType", Donor.class)
                    .setParameter("bloodType", bloodType)
                    .getResultList();
            return donors.stream().map(this::toDTO).collect(Collectors.toList());
        }finally {
            em.close();
        }
    }
    public List<DonorDTO> findAvailableDonors() {
        try {
            List<Donor> donors = em.createQuery("SELECT d FROM Donor d WHERE d.donorStatus = 'AVAILABLE'", Donor.class)
                    .getResultList();
            return donors.stream().map(this::toDTO).collect(Collectors.toList());
        }finally {
            em.close();
        }
    }
    public List<DonorDTO> findDonorsByDonorStatus(String donorStatus) {
        try {
            List<Donor> donors = em.createQuery("SELECT d FROM Donor d WHERE d.donorStatus = :donorStatus", Donor.class)
                    .setParameter("donorStatus", donorStatus)
                    .getResultList();
            return donors.stream().map(this::toDTO).collect(Collectors.toList());
        }finally {
            em.close();
        }
    }
}
