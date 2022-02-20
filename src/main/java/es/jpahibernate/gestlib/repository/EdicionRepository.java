package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Edicion;
import es.jpahibernate.gestlib.model.EdicionId;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

import java.util.List;

@Repository
public interface EdicionRepository extends EntityRepository<Edicion, Long> {

    Edicion findById(EdicionId id);

    List<Edicion> findByLibroId(Long id);

    List<Edicion> findByEdicionId(Long id);

}
