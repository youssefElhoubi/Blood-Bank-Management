package com.example.bbm.util;

import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;

public class JpaUtil {

    // Singleton instance of EntityManagerFactory
    private static final EntityManagerFactory emf = buildEntityManagerFactory();

    private static EntityManagerFactory buildEntityManagerFactory() {
        try {
            // "myPersistenceUnit" must match the name in persistence.xml
            return Persistence.createEntityManagerFactory("myPersistenceUnit");
        } catch (Exception e) {
            System.err.println("❌ EntityManagerFactory creation failed: " + e);
            throw new ExceptionInInitializerError(e);
        }
    }

    // Get an EntityManager (like a connection)
    public static EntityManager getEntityManager() {
        return emf.createEntityManager();
    }

    // Close the factory when shutting down the app
    public static void close() {
        if (emf != null) {
            emf.close();
        }
    }
}
