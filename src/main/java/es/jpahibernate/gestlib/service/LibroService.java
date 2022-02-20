package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Libro;
import es.jpahibernate.gestlib.repository.LibroRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class LibroService {

    @Inject
    LibroRepository libroRepository;

    public List<Libro> listadoLibros () {
        return libroRepository.findAll();
    }

    public Libro localizarLibro (Long id) {
        return libroRepository.findById(id);
    }

    public void actualizar(Libro libro) {
        libroRepository.save(libro);
    }

}
