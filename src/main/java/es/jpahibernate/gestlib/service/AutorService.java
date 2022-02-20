package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Autor;
import es.jpahibernate.gestlib.repository.AutorRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class AutorService {

    @Inject
    AutorRepository autorRepository;

    public Autor localizarAutor (Long id) {
        return autorRepository.findById(id);
    }

    public List<Autor> listadoAutores () { return autorRepository.findAll(); }

    public void actualizar(Autor autor) {
        autorRepository.save(autor);
    }

}
