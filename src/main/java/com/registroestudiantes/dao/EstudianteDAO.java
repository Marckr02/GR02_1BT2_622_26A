package com.registroestudiantes.dao;

import com.registroestudiantes.model.Estudiante;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.Persistence;
import java.util.List;

public class EstudianteDAO {

    private final EntityManagerFactory emf =
            Persistence.createEntityManagerFactory("registroPU");

    public void guardar(Estudiante estudiante) {
        EntityManager em = emf.createEntityManager();
        try {
            em.getTransaction().begin();
            em.persist(estudiante);
            em.getTransaction().commit();
        } catch (RuntimeException ex) {
            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }
            throw ex;
        } finally {
            em.close();
        }
    }

    public List<Estudiante> listar() {
        EntityManager em = emf.createEntityManager();
        try {
            return em
                    .createQuery("FROM Estudiante", Estudiante.class)
                    .getResultList();
        } finally {
            em.close();
        }
    }
}