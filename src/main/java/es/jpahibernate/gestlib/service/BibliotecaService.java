package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Biblioteca;
import es.jpahibernate.gestlib.repository.BibliotecaRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class BibliotecaService {

    @Inject
    BibliotecaRepository bibliotecaRepository;

    public Biblioteca localizarBiblioteca (Long id) {
        return bibliotecaRepository.findById(id);
    }

    public List<Biblioteca> listadoBibliotecas () {
        return bibliotecaRepository.findAll();
    }

    public void actualizar(Biblioteca biblioteca) {
        bibliotecaRepository.save(biblioteca);
    }

}
