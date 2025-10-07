package com.example.bbm.dao;

import com.example.bbm.dto.RecipientDTO;
import com.example.bbm.entity.Recipient;
import com.example.bbm.util.JpaUtil;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.UUID;

public class RecippientDAO {
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
        try {
            Recipient recipient = toEntity(dto);
            em.persist(recipient);
            return toDTO(recipient);
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
    public List<RecipientDTO> findAllOrderedByMedicalCondition() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            String jpql = " SELECT r FROM Recipient r ORDER BY CASE WHEN r.medicalCondition = com.example.bbm.enums.MedicalCondition.CRITICAL THEN 1 WHEN r.medicalCondition = com.example.bbm.enums.MedicalCondition.URGENT THEN 2 WHEN r.medicalCondition = com.example.bbm.enums.MedicalCondition.NORMAL THEN 3 ELSE 4E ND";
            List<Recipient> recipient =  em.createQuery(jpql, Recipient.class).getResultList();
            return recipient.stream().map(this::toDTO).collect(java.util.stream.Collectors.toList());
        } finally {
            em.close();
        }
    }
    public List<RecipientDTO> findAllOrderedByState() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            String jpql = " SELECT r FROM Recipient r ORDER BY CASE WHEN r.state = com.example.bbm.enums.State.ACTIVE THEN 1 WHEN r.state = com.example.bbm.enums.State.INACTIVE THEN 2 ELSE 3E ND";
            List<Recipient> recipient =  em.createQuery(jpql, Recipient.class).getResultList();
            return recipient.stream().map(this::toDTO).collect(java.util.stream.Collectors.toList());
        } finally {
            em.close();
        }
    }
}
