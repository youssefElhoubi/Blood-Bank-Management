package com.example.bbm.dao;

import com.example.bbm.dto.DonationAssociationDTO;
import com.example.bbm.dto.DonorDTO;
import com.example.bbm.dto.RecipientDTO;
import com.example.bbm.entity.DonationAssociation;
import com.example.bbm.entity.Donor;
import com.example.bbm.entity.Recipient;
import com.example.bbm.util.JpaUtil;

import javax.persistence.EntityManager;
import java.util.Arrays;
import java.util.List;
import java.util.UUID;
import java.util.stream.Collectors;

public class DonationAssociationDAO {


    private DonationAssociation toEntity(DonationAssociationDTO dto) {
        if (dto == null) return null;

        DonationAssociation entity = new DonationAssociation();
        entity.setId(dto.getId());
        entity.setDonationDate(dto.getDonationDate());
        entity.setBloodBagNumber(dto.getBloodBagNumber());
        entity.setQuantity(dto.getQuantity());
        entity.setDonationLocation(dto.getDonationLocation());

        // Convert donors
        if (dto.getDonaiters() != null) {
            List<Donor> donors = dto.getDonaiters().stream()
                    .map(donorDTO -> {
                        Donor donor = new Donor();
                        donor.setId(donorDTO.getId());
                        donor.setFirstName(donorDTO.getFirstName());
                        donor.setLastName(donorDTO.getLastName());
                        donor.setEmail(donorDTO.getEmail());
                        donor.setPhoneNumber(donorDTO.getPhoneNumber());
                        donor.setDateOfBirth(donorDTO.getDateOfBirth());
                        donor.setGender(donorDTO.getGender());
                        donor.setBloodType(donorDTO.getBloodType());
                        donor.setRegistrationDate(donorDTO.getRegistrationDate());
                        donor.setWeight(donorDTO.getWeight());
                        donor.setDonorStatus(donorDTO.getDonorStatus());
                        donor.setLastDonationDate(donorDTO.getLastDonationDate());
                        donor.setPregnant(donorDTO.getIsPregnant());
                        donor.setBreastfeeding(donorDTO.getIsBreastfeeding());
                        donor.setMedicalNotes(donorDTO.getMedicalNotes());
                        donor.setDesize(donorDTO.getDesize());
                        return donor;
                    })
                    .collect(Collectors.toList());
            entity.setDonaiters(donors);
        }

        // Convert recipient
        if (dto.getRecipient() != null) {
            Recipient recipient = new Recipient();
            recipient.setId(dto.getRecipient().getId());
            recipient.setFirstName(dto.getRecipient().getFirstName());
            recipient.setLastName(dto.getRecipient().getLastName());
            recipient.setEmail(dto.getRecipient().getEmail());
            recipient.setPhoneNumber(dto.getRecipient().getPhoneNumber());
            recipient.setDateOfBirth(dto.getRecipient().getDateOfBirth());
            recipient.setGender(dto.getRecipient().getGender());
            recipient.setBloodType(dto.getRecipient().getBloodType());
            recipient.setRegistrationDate(dto.getRecipient().getRegistrationDate());
            recipient.setMedicalCondition(dto.getRecipient().getMedicalCondition());
            recipient.setState(dto.getRecipient().getState());
            recipient.setRequiredBloodBags(dto.getRecipient().getRequiredBloodBags());
            recipient.setCurrentBloodBags(dto.getRecipient().getCurrentBloodBags());
            recipient.setHospital(dto.getRecipient().getHospital());
            recipient.setDoctorName(dto.getRecipient().getDoctorName());
            recipient.setMedicalCase(dto.getRecipient().getMedicalCase());
            recipient.setSatisfiedDate(dto.getRecipient().getSatisfiedDate());
            entity.setRecipient(recipient);
        }

        return entity;
    }

    private DonationAssociationDTO toDTO(DonationAssociation donationAssociation) {
        if (donationAssociation == null) return null;

        // Map donors to DonorDTOs
        List<DonorDTO> donorDTOs = donationAssociation.getDonaiters() != null
                ? donationAssociation.getDonaiters().stream()
                .map(donor -> new DonorDTO(
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
                ))
                .collect(Collectors.toList())
                : null;

        // Map recipient to RecipientDTO
        Recipient recipient = donationAssociation.getRecipient();
        RecipientDTO recipientDTO = null;
        if (recipient != null) {
            recipientDTO = new RecipientDTO(
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
        // Build DTO
        return new DonationAssociationDTO(
                donationAssociation.getId(),
                donationAssociation.getDonationDate(),
                donationAssociation.getBloodBagNumber(),
                donationAssociation.getQuantity(),
                donationAssociation.getDonationLocation(),
                donorDTOs,
                recipientDTO
        );
    }
    public DonationAssociationDTO create(DonationAssociationDTO dto) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            DonationAssociation donationAssociation = toEntity(dto);
            em.persist(donationAssociation);
            return toDTO(donationAssociation);
        } finally {
            em.close();
        }
    }
    public List<DonationAssociationDTO> findAll() {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            List<DonationAssociation> donationAssociations = em.createQuery("SELECT da FROM DonationAssociation da", DonationAssociation.class).getResultList();
            return donationAssociations.stream().map(this::toDTO).collect(Collectors.toList());
        } finally {
            em.close();
        }
    }
    public DonationAssociationDTO update(DonationAssociationDTO dto) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            DonationAssociation existing = em.find(DonationAssociation.class, dto.getId());
            if (existing == null) throw new RuntimeException("DonationAssociation not found");
            DonationAssociation updated = toEntity(dto);
            DonationAssociation merged = em.merge(updated);
            return toDTO(merged);
        } finally {
            em.close();
        }
    }
    public DonationAssociationDTO findById(Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            DonationAssociation donationAssociation = em.find(DonationAssociation.class, id);
            return toDTO(donationAssociation);
        } finally {
            em.close();
        }
    }
    public List<DonationAssociationDTO> findByDonationDate(String donationDate) {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            List<DonationAssociation> donationAssociations = em.createQuery("SELECT da FROM DonationAssociation da WHERE da.donationDate = :donationDate", DonationAssociation.class)
                    .setParameter("donationDate", donationDate)
                    .getResultList();
            return donationAssociations.stream().map(this::toDTO).collect(Collectors.toList());
        } finally {
            em.close();
        }
    }
    public void makeDonationAssociation(Long[] ids,Long id) {
        EntityManager em = JpaUtil.getEntityManager();
        DonorDAO donorDAO = new DonorDAO();
        try {
            List<DonorDTO> donorDTOs = Arrays.stream(ids).map(donorDAO::findById).collect(Collectors.toList());
            RecipientDTO recipient = new RecipientDAO().findById(id);
            for(DonorDTO d : donorDTOs) {

            }
        } finally {
            em.close();
        }
    }


}
