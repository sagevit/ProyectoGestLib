package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Autor;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

@Repository
public interface AutorRepository extends EntityRepository<Autor, Long> {

    Autor findById(Long id);

}
