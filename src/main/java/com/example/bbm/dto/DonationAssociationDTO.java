package com.example.bbm.dto;

import com.fasterxml.jackson.annotation.JsonFormat;

import javax.validation.constraints.*;
import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class DonationAssociationDTO {

    private Long id;
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


    @NotBlank(message = "Donation location is required")
    @Size(max = 150, message = "Donation location must not exceed 150 characters")
    private String donationLocation;

    @NotEmpty(message = "At least one donater is required")
    private List<DonorDTO> donaiters;

    @NotNull(message = "Recipient is required")
    private RecipientDTO recipient;

    // ---- Constructors ----
    public DonationAssociationDTO() {

    }

    public DonationAssociationDTO(Long id, LocalDateTime donationDate, String bloodBagNumber,
                                  Double quantity,  String donationLocation,
                                  List<DonorDTO> donaiters, RecipientDTO recipient) {
        this.id = id;
        this.donationDate = donationDate;
        this.bloodBagNumber = bloodBagNumber;
        this.quantity = quantity;
        this.donationLocation = donationLocation;
        this.donaiters = donaiters;
        this.recipient = recipient;
    }

    // ---- Getters and Setters ----
    public Long getId() {
        return id;
    }

    public void setId(Long id) {
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
