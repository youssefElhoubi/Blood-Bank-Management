package com.example.bbm.entity;

import com.example.bbm.enums.BloodType;
import com.example.bbm.enums.Gender;
import javax.persistence.*;

import java.time.LocalDateTime;
import java.util.UUID;

@Entity
@Table(name = "person")
public abstract class Person {
    @Id
    private UUID id = UUID.randomUUID();
    @Column(name = "first_name",nullable = false,length = 50)
    private String firstName;
    @Column(name = "last_name",nullable = false,length = 50)
    private String lastName;
    @Column(name = "email",nullable = false,length = 50)
    private String email;
    @Column(name = "phone_number",nullable = false,length = 15)
    private String phoneNumber;
    @Column(name = "date_of_birth",nullable = false)
    private LocalDateTime dateOfBirth;
    @Enumerated(EnumType.STRING)
    @Column(name="gender",nullable = false)
    private Gender gender;
    @Enumerated(EnumType.STRING)
    @Column(name= "blood_type",nullable = false)
    private BloodType bloodType;
    @Column(name="registration_date",nullable = false)
    private LocalDateTime registrationDate =  LocalDateTime.now();

    public Person(UUID id, String firstName, String lastName, String email, String phoneNumber, LocalDateTime dateOfBirth, Gender gender, BloodType bloodType, LocalDateTime registrationDate) {
        this.id = id;
        this.firstName = firstName;
        this.lastName = lastName;
        this.email = email;
        this.phoneNumber = phoneNumber;
        this.dateOfBirth = dateOfBirth;
        this.gender = gender;
        this.bloodType = bloodType;
        this.registrationDate = registrationDate;
    }

    public Person() {

    }

    public UUID getId() {
        return id;
    }

    public void setId(UUID id) {
        this.id = id;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPhoneNumber() {
        return phoneNumber;
    }

    public void setPhoneNumber(String phoneNumber) {
        this.phoneNumber = phoneNumber;
    }

    public LocalDateTime getDateOfBirth() {
        return dateOfBirth;
    }

    public void setDateOfBirth(LocalDateTime dateOfBirth) {
        this.dateOfBirth = dateOfBirth;
    }

    public Gender getGender() {
        return gender;
    }

    public void setGender(Gender gender) {
        this.gender = gender;
    }

    public BloodType getBloodType() {
        return bloodType;
    }

    public void setBloodType(BloodType bloodType) {
        this.bloodType = bloodType;
    }

    public LocalDateTime getRegistrationDate() {
        return registrationDate;
    }

    public void setRegistrationDate(LocalDateTime registrationDate) {
        this.registrationDate = registrationDate;
    }
}
