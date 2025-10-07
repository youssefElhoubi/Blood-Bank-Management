package com.example.bbm.entity;

import com.example.bbm.enums.MedicalCondition;
import com.example.bbm.enums.RecipientState;
import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.List;

@Entity
@Table(name = "recipient")
public class Recipient extends Person {

    @Enumerated(EnumType.STRING)
    @Column(name = "medical_condition", nullable = false)
    private MedicalCondition medicalCondition;

    @Enumerated(EnumType.STRING)
    @Column(name = "state", nullable = false)
    private RecipientState state = RecipientState.PENDING;

    @Column(name = "required_blood_bags", nullable = false)
    private int requiredBloodBags;

    @Column(name = "current_blood_bags", nullable = false)
    private int currentBloodBags = 0;

    @Column(name = "hospital", nullable = false, length = 100)
    private String hospital;

    @Column(name = "doctor_name", nullable = false, length = 100)
    private String doctorName;

    @Column(name = "medical_case", nullable = false, length = 255)
    private String medicalCase;

    @Column(name = "satisfied_date")
    private LocalDateTime satisfiedDate;
    @OneToMany(mappedBy = "recipient", cascade = CascadeType.ALL)
    private List<DonationAssociation> donations;

    public Recipient() {}

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
