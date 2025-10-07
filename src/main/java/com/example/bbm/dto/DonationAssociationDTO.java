package com.example.bbm.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class DonationAssociationDTO {

    private UUID id;

    @NotNull(message = "Donation date is required")
    @PastOrPresent(message = "Donation date cannot be in the future")
    @JsonFormat(pattern = "yyyy-MM-dd'T'HH:mm:ss")
    private LocalDateTime donationDate;

    @NotBlank(message = "Blood bag number is required")
    @Size(max = 50, message = "Blood bag number must not exceed 50 characters")
    private String bloodBagNumber;

    @NotNull(message = "Quantity is required")
    @Positive(message = "Quantity must be a positive number")
    private Double quantity;

    @NotBlank(message = "Nurse name is required")
    @Size(max = 100, message = "Nurse name must not exceed 100 characters")
    private String nurseName;

    @NotBlank(message = "Donation location is required")
    @Size(max = 150, message = "Donation location must not exceed 150 characters")
    private String donationLocation;

    @NotEmpty(message = "At least one donater is required")
    private List<DonorDTO> donaiters;

    @NotNull(message = "Recipient is required")
    private RecipientDTO recipient;

    // ---- Constructors ----
    public DonationAssociationDTO() {
        this.id = UUID.randomUUID();
    }

    public DonationAssociationDTO(UUID id, LocalDateTime donationDate, String bloodBagNumber,
                                  Double quantity, String nurseName, String donationLocation,
                                  List<DonorDTO> donaiters, RecipientDTO recipient) {
        this.id = id;
        this.donationDate = donationDate;
        this.bloodBagNumber = bloodBagNumber;
        this.quantity = quantity;
        this.nurseName = nurseName;
        this.donationLocation = donationLocation;
        this.donaiters = donaiters;
        this.recipient = recipient;
    }

    // ---- Getters and Setters ----
    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public LocalDateTime getDonationDate() {
        return donationDate;
    }

    public void setDonationDate(LocalDateTime donationDate) {
        this.donationDate = donationDate;
    }

    public String getBloodBagNumber() {
        return bloodBagNumber;
    }

    public void setBloodBagNumber(String bloodBagNumber) {
        this.bloodBagNumber = bloodBagNumber;
    }

    public Double getQuantity() {
        return quantity;
    }

    public void setQuantity(Double quantity) {
        this.quantity = quantity;
    }

    public String getNurseName() {
        return nurseName;
    }

    public void setNurseName(String nurseName) {
        this.nurseName = nurseName;
    }

    public String getDonationLocation() {
        return donationLocation;
    }

    public void setDonationLocation(String donationLocation) {
        this.donationLocation = donationLocation;
    }

    public List<DonorDTO> getDonaiters() {
        return donaiters;
    }

    public void setDonaiters(List<DonorDTO> donaiters) {
        this.donaiters = donaiters;
    }

    public RecipientDTO getRecipient() {
        return recipient;
    }

    public void setRecipient(RecipientDTO recipient) {
        this.recipient = recipient;
    }
}
