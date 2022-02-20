package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Edicion;
import es.jpahibernate.gestlib.model.EdicionId;
import es.jpahibernate.gestlib.repository.EdicionRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class EdicionService {

    @Inject
    EdicionRepository edicionRepository;

    public Edicion localizarEdicion(EdicionId edicionId) { return edicionRepository.findById(edicionId); };

    public List<Edicion> listadoEdiciones () { return edicionRepository.findAll(); }

    public List<Edicion> listadoEdicionesLibro (Long libroId) { return edicionRepository.findByLibroId(libroId); }

    public List<Edicion> listadoEdicionesEditorial (Long editorialId) {
        return edicionRepository.findAll();
    }

    public void actualizar(Edicion edicion) {
        edicionRepository.save(edicion);
    }

}
