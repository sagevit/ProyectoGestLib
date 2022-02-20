package es.jpahibernate.gestlib.repository;

import es.jpahibernate.gestlib.management.Estado;
import es.jpahibernate.gestlib.model.Prestamo;
import es.jpahibernate.gestlib.model.Usuario;
import org.apache.deltaspike.data.api.EntityRepository;
import org.apache.deltaspike.data.api.Query;
import org.apache.deltaspike.data.api.Repository;

import java.util.Date;
import java.util.List;

@Repository
public interface PrestamoRepository extends EntityRepository<Prestamo, Long> {

    Prestamo findById(Long id);

    List<Prestamo> findByUsuarioOrderByEstado(Usuario usuario);

    List<Prestamo> findByFechaDevolucionAfter(Date fecha);

    @Query("select distinct(p.usuario) from Prestamo p where p.estado = ?1")
    List<Usuario> localizaUsuariosDePrestamosPorEstado(Estado estado);

}
