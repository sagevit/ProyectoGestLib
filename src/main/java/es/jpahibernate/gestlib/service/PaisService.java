package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Pais;
import es.jpahibernate.gestlib.repository.PaisRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class PaisService {

    @Inject
    PaisRepository paisRepository;

    public List<Pais> listadoPaises() {
        return paisRepository.findAllOrderByNombre();
    }

    public Pais leerPaisPorNombre(String nombre) {
        return paisRepository.findByNombre(nombre);
    }

}
