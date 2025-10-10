package com.example.bbm.dao;

import com.example.bbm.dto.PersonDTO;
import com.example.bbm.entity.Person;
import com.example.bbm.util.JpaUtil;

import javax.persistence.EntityManager;
import java.util.List;
import java.util.stream.Collectors;

public class PersonDAO {

    // ✅ Convert Entity → DTO
    private PersonDTO toDTO(Person person) {
        return new PersonDTO(
                person.getId(),
                person.getFirstName(),
                person.getLastName(),
                person.getEmail(),
                person.getPhoneNumber(),
                person.getDateOfBirth(),
                person.getGender(),
                person.getBloodType(),
                person.getRegistrationDate()
        );
    }

    // ✅ Convert DTO → Entity
    private Person toEntity(PersonDTO dto) {
        Person person = new Person();
        person.setId(dto.getId());
        person.setFirstName(dto.getFirstName());
        person.setLastName(dto.getLastName());
        person.setEmail(dto.getEmail());
        person.setPhoneNumber(dto.getPhoneNumber());
        person.setDateOfBirth(dto.getDateOfBirth());
        person.setGender(dto.getGender());
        person.setBloodType(dto.getBloodType());
        person.setRegistrationDate(dto.getRegistrationDate());
        return person;
    }

    // ✅ Create (Insert)
    public void save(PersonDTO dto) throws Exception {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            em.persist(toEntity(dto));
        } catch (Exception e) {
            throw new Exception("Failed to save person: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    // ✅ Read all
    public List<PersonDTO> findAll() throws Exception {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            List<Person> persons = em.createQuery("FROM Person", Person.class).getResultList();
            return persons.stream().map(this::toDTO).collect(Collectors.toList());
        } catch (Exception e) {
            throw new Exception("Failed to fetch persons: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    // ✅ Find by ID
    public PersonDTO findById(Long id) throws Exception {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Person person = em.find(Person.class, id);
            return person != null ? toDTO(person) : null;
        } catch (Exception e) {
            throw new Exception("Failed to find person: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    // ✅ Update
    public void update(PersonDTO dto) throws Exception {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Person existing = em.find(Person.class, dto.getId());
            if (existing == null) throw new Exception("Person not found with ID " + dto.getId());

            existing.setFirstName(dto.getFirstName());
            existing.setLastName(dto.getLastName());
            existing.setEmail(dto.getEmail());
            existing.setPhoneNumber(dto.getPhoneNumber());
            existing.setDateOfBirth(dto.getDateOfBirth());
            existing.setGender(dto.getGender());
            existing.setBloodType(dto.getBloodType());
            existing.setRegistrationDate(dto.getRegistrationDate());

            em.merge(existing);
        } catch (Exception e) {
            throw new Exception("Failed to update person: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }

    // ✅ Delete
    public void delete(Long id) throws Exception {
        EntityManager em = JpaUtil.getEntityManager();
        try {
            Person person = em.find(Person.class, id);
            if (person != null) {
                em.remove(person);
            }
        } catch (Exception e) {
            throw new Exception("Failed to delete person: " + e.getMessage(), e);
        } finally {
            em.close();
        }
    }
}
