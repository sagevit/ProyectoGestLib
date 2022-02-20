package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Usuario;
import es.jpahibernate.gestlib.repository.UsuarioRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class UsuarioService {

    @Inject
    UsuarioRepository usuarioRepository;

    public Usuario localizarUsuario (Long id) { return usuarioRepository.findById(id); }

    public List<Usuario> listadoUsuarios () { return usuarioRepository.findAll(); }

    public Usuario actualizar(Usuario usuario) { return usuarioRepository.save(usuario); }

    public void eliminar(Usuario usuario) { usuarioRepository.remove(usuario); }

}
