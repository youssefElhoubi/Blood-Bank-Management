package com.example.bbm.dto;

import com.example.bbm.enums.BloodType;
import com.example.bbm.enums.Gender;
import com.example.bbm.enums.MedicalCondition;
import com.example.bbm.enums.RecipientState;
import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.*;
import java.time.LocalDateTime;
import java.util.UUID;

public class RecipientDTO extends PersonDTO {

    @NotNull(message = "Medical condition is required")
    private MedicalCondition medicalCondition;

    private RecipientState state = RecipientState.PENDING;

    @Min(value = 1, message = "Required blood bags must be at least 1")
    @Max(value = 100, message = "Required blood bags cannot exceed 100")
    private int requiredBloodBags;

    @Min(value = 0, message = "Current blood bags cannot be negative")
    private int currentBloodBags = 0;

    @NotBlank(message = "Hospital name is required")
    @Size(max = 100, message = "Hospital name must not exceed 100 characters")
    private String hospital;

    @NotBlank(message = "Doctor name is required")
    @Size(max = 100, message = "Doctor name must not exceed 100 characters")
    private String doctorName;

    @NotBlank(message = "Medical case is required")
    @Size(max = 255, message = "Medical case must not exceed 255 characters")
    private String medicalCase;

    @PastOrPresent(message = "Satisfied date cannot be in the future")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime satisfiedDate;

    // Constructors
    public RecipientDTO() {
        super();
    }

    public RecipientDTO(Long id, String firstName, String lastName, String email,
                        String phoneNumber, LocalDateTime dateOfBirth, Gender gender,
                        BloodType bloodType, LocalDateTime registrationDate,
                        MedicalCondition medicalCondition, RecipientState state,
                        int requiredBloodBags, int currentBloodBags,
                        String hospital, String doctorName, String medicalCase,
                        LocalDateTime satisfiedDate) {
        super(id, firstName, lastName, email, phoneNumber, dateOfBirth, gender, bloodType, registrationDate);
        this.medicalCondition = medicalCondition;
        this.state = state;
        this.requiredBloodBags = requiredBloodBags;
        this.currentBloodBags = currentBloodBags;
        this.hospital = hospital;
        this.doctorName = doctorName;
        this.medicalCase = medicalCase;
        this.satisfiedDate = satisfiedDate;
    }

    // Getters and Setters
    public MedicalCondition getMedicalCondition() {
        return medicalCondition;
    }

    public void setMedicalCondition(MedicalCondition medicalCondition) {
        this.medicalCondition = medicalCondition;
    }

    public RecipientState getState() {
        return state;
    }

    public void setState(RecipientState state) {
        this.state = state;
    }

    public int getRequiredBloodBags() {
        return requiredBloodBags;
    }

    public void setRequiredBloodBags(int requiredBloodBags) {
        this.requiredBloodBags = requiredBloodBags;
    }

    public int getCurrentBloodBags() {
        return currentBloodBags;
    }

    public void setCurrentBloodBags(int currentBloodBags) {
        this.currentBloodBags = currentBloodBags;
    }

    public String getHospital() {
        return hospital;
    }

    public void setHospital(String hospital) {
        this.hospital = hospital;
    }

    public String getDoctorName() {
        return doctorName;
    }

    public void setDoctorName(String doctorName) {
        this.doctorName = doctorName;
    }

    public String getMedicalCase() {
        return medicalCase;
    }

    public void setMedicalCase(String medicalCase) {
        this.medicalCase = medicalCase;
    }

    public LocalDateTime getSatisfiedDate() {
        return satisfiedDate;
    }

    public void setSatisfiedDate(LocalDateTime satisfiedDate) {
        this.satisfiedDate = satisfiedDate;
    }
}
