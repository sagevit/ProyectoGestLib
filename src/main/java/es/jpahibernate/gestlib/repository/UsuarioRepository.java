package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.model.Usuario;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Repository;

@Repository
public interface UsuarioRepository extends EntityRepository<Usuario, Long> {

    Usuario findById(Long id);

}
