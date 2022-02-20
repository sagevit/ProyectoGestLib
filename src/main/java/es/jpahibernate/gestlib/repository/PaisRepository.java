package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Pais;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

import java.util.List;

@Repository
public interface PaisRepository extends EntityRepository<Pais, Long> {

    //Pais findById(Long id);

    Pais findByNombre(String nombre);

    List<Pais> findAllOrderByNombre();

}
