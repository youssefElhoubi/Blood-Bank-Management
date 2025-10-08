package com.example.bbm.dto;

import com.example.bbm.enums.BloodType;
import com.example.bbm.enums.Desize;
import com.example.bbm.enums.DonorStatus;
import com.example.bbm.enums.Gender;
import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.*;
import java.time.LocalDateTime;
import java.util.UUID;

public class DonorDTO extends PersonDTO {

    @NotNull(message = "Weight is required")
    @Positive(message = "Weight must be a positive number")
    @DecimalMin(value = "30.0", message = "Weight must be at least 30 kg")
    @DecimalMax(value = "300.0", message = "Weight must not exceed 300 kg")
    private Double weight;

    private DonorStatus donorStatus;

    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime lastDonationDate;

    private Boolean isPregnant;

    private Boolean isBreastfeeding;

    @Size(max = 500, message = "Medical notes must not exceed 500 characters")
    private String medicalNotes;

    private Desize desize;

    // Constructors
    public DonorDTO() {
        super();
    }

    public DonorDTO(Long id, String firstName, String lastName, String email,
                    String phoneNumber, LocalDateTime dateOfBirth, Gender gender,
                    BloodType bloodType, LocalDateTime registrationDate,
                    Double weight, DonorStatus donorStatus, LocalDateTime lastDonationDate,
                    Boolean isPregnant, Boolean isBreastfeeding, String medicalNotes, Desize desize) {
        super(id, firstName, lastName, email, phoneNumber, dateOfBirth, gender, bloodType, registrationDate);
        this.weight = weight;
        this.donorStatus = donorStatus;
        this.lastDonationDate = lastDonationDate;
        this.isPregnant = isPregnant;
        this.isBreastfeeding = isBreastfeeding;
        this.medicalNotes = medicalNotes;
        this.desize = desize;
    }



    // Getters and Setters
    public Double getWeight() {
        return weight;
    }

    public void setWeight(Double weight) {
        this.weight = weight;
    }

    public DonorStatus getDonorStatus() {
        return donorStatus;
    }

    public void setDonorStatus(DonorStatus donorStatus) {
        this.donorStatus = donorStatus;
    }

    public LocalDateTime getLastDonationDate() {
        return lastDonationDate;
    }

    public void setLastDonationDate(LocalDateTime lastDonationDate) {
        this.lastDonationDate = lastDonationDate;
    }

    public Boolean getIsPregnant() {
        return isPregnant;
    }

    public void setIsPregnant(Boolean isPregnant) {
        this.isPregnant = isPregnant;
    }

    public Boolean getIsBreastfeeding() {
        return isBreastfeeding;
    }

    public void setIsBreastfeeding(Boolean isBreastfeeding) {
        this.isBreastfeeding = isBreastfeeding;
    }

    public String getMedicalNotes() {
        return medicalNotes;
    }

    public void setMedicalNotes(String medicalNotes) {
        this.medicalNotes = medicalNotes;
    }

    public Desize getDesize() {
        return desize;
    }

    public void setDesize(Desize desize) {
        this.desize = desize;
    }
}