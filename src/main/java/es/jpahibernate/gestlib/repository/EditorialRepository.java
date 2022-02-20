package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Editorial;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

@Repository
public interface EditorialRepository extends EntityRepository<Editorial, Long> {

    Editorial findById(Long id);

}
