package es.jpahibernate.gestlib.management;

import jakarta.enterprise.context.ApplicationScoped;
import jakarta.enterprise.context.RequestScoped;
import jakarta.enterprise.inject.Disposes;
import jakarta.enterprise.inject.Produces;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityManagerFactory;
import jakarta.persistence.PersistenceUnit;

@ApplicationScoped
public class EntityManagerProducer {

  @PersistenceUnit
  private EntityManagerFactory emf;

  @Produces
  @RequestScoped
  public EntityManager create() {
    return emf.createEntityManager();
  }

  public void dispose(@Disposes EntityManager em) {
    if (em.isOpen()) {
      em.close();
    }
  }
}
