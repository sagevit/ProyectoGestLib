package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.management.Estado;
import es.jpahibernate.gestlib.model.Usuario;
import es.jpahibernate.gestlib.repository.PrestamoRepository;
import es.jpahibernate.gestlib.repository.UsuarioRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.apache.deltaspike.jpa.api.transaction.Transactional;

import java.util.List;

@Slf4j
@ApplicationScoped
public class UsuarioService {

    @Inject
    UsuarioRepository usuarioRepository;

    @Inject
    PrestamoRepository prestamoRepository;

    public Usuario localizarUsuario (Long id) { return usuarioRepository.findById(id); }

    public List<Usuario> listadoUsuarios () { return usuarioRepository.findAll(); }

    public Usuario actualizar(Usuario usuario) { return usuarioRepository.save(usuario); }

    @Transactional
    public boolean eliminar(Usuario usuario) {

        //Si tiene préstamos pendientes de devolver no se puede dar de baja
        if (prestamoRepository.countByUsuarioPorEstado(usuario, Estado.PRESTADO) != 0) {
            return false;
        }
        usuarioRepository.remove(usuario);
        return true;
    }

}
