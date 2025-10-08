package com.example.bbm.entity;
import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

@Entity
@Table(name = "donation_association")
public class DonationAssociation {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    @GeneratedValue(strategy = GenerationType.AUTO)
    private Long id;
    @Column(name = "donation_date")
    private LocalDateTime donationDate;

    @Column(name = "blood_bag_number")
    private String bloodBagNumber;

    @Column(name = "quantity")
    private Double quantity;

    @Column(name = "nurse_name")
    private String nurseName;

    @Column(name = "donation_location")
    private String donationLocation;

    @ManyToMany
    @JoinTable(
            name = "donation_donors",
            joinColumns = @JoinColumn(name = "donation_id"),
            inverseJoinColumns = @JoinColumn(name = "donor_id")
    )
    private List<Donor> donaiters;

    @ManyToOne
    @JoinColumn(name = "recipient_id")
    private Recipient recipient;

    // Constructors
    public DonationAssociation() {

    }

    public DonationAssociation(Long id, LocalDateTime donationDate, String bloodBagNumber, Double quantity, String nurseName, String donationLocation, List<Donor> donaiters, Recipient recipient) {
        this.id = id;
        this.donationDate = donationDate;
        this.bloodBagNumber = bloodBagNumber;
        this.quantity = quantity;
        this.nurseName = nurseName;
        this.donationLocation = donationLocation;
        this.donaiters = donaiters;
        this.recipient = recipient;
    }

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

    public List<Donor> getDonaiters() {
        return donaiters;
    }

    public void setDonaiters(List<Donor> donaiters) {
        this.donaiters = donaiters;
    }

    public Recipient getRecipient() {
        return recipient;
    }

    public void setRecipient(Recipient recipient) {
        this.recipient = recipient;
    }
}
