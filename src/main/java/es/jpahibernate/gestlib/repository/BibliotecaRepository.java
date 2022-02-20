package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Biblioteca;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

@Repository
public interface BibliotecaRepository extends EntityRepository<Biblioteca, Long> {

    Biblioteca findById(Long id);

}
