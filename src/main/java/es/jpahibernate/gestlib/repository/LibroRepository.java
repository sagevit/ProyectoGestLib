package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Libro;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

@Repository
public interface LibroRepository extends EntityRepository<Libro, Long> {

    Libro findById(Long id);

}
