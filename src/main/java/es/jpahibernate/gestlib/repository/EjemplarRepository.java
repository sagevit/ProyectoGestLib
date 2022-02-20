package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Biblioteca;
import es.jpahibernate.gestlib.model.Ejemplar;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Modifying;
import org.apache.deltaspike.data.api.Query;
import org.apache.deltaspike.data.api.Repository;

import java.util.List;

@Repository
public interface EjemplarRepository extends EntityRepository<Ejemplar, Long> {

    Ejemplar findById(Long id);

    List<Ejemplar> findByBibliotecaAndDisponible(Biblioteca biblioteca, Boolean disponible);

    @Modifying
    @Query("update Ejemplar e set e.disponible = ?1 where e.id = ?2")
    void updateDisponibilidadEjemplar(Boolean disponibilidad, Long id);

}
