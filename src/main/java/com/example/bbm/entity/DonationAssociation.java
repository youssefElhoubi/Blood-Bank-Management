package com.example.bbm.entity;
import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.List;
import java.util.UUID;

public class DonationAssociation {
    @Id
    @Column(name = "id", updatable = false, nullable = false)
    private UUID id;

    @Temporal(TemporalType.DATE)
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
        this.id = UUID.randomUUID();
    }
}
