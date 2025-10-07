package com.example.bbm.entity;

import com.example.bbm.enums.Desize;
import com.example.bbm.enums.DonorStatus;
import javax.persistence.*;

import java.time.LocalDateTime;

@Entity
@Table(name = "donor")
public class Donor extends Person {
    @Column(name = "weight",nullable = false)
    private double weight;

    @Enumerated(EnumType.STRING)
    @Column(name = "Donor_status",nullable = false)
    private DonorStatus  donorStatus = DonorStatus.UNAVAILABLE;

    @Column(name = "last_donation_date",nullable = true)
    private LocalDateTime lastDonationDate;

    @Column(name = "is_pregnant")
    private Boolean isPregnant;

    @Column(name = "is_breastfeeding")
    private Boolean isBreastfeeding;

    @Column(name = "medical_notes", length = 500)
    private String medicalNotes;

    @Enumerated(EnumType.STRING)
    @Column(name = "desize")
    private Desize desize;

    public Donor() {
    }

    public double getWeight() {
        return weight;
    }

    public void setWeight(double weight) {
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

    public Boolean getPregnant() {
        return isPregnant;
    }

    public void setPregnant(Boolean pregnant) {
        isPregnant = pregnant;
    }

    public Boolean getBreastfeeding() {
        return isBreastfeeding;
    }

    public void setBreastfeeding(Boolean breastfeeding) {
        isBreastfeeding = breastfeeding;
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
