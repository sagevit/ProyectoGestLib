package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Editorial;
import es.jpahibernate.gestlib.repository.EditorialRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;

@Slf4j
@ApplicationScoped
public class EditorialService {

    @Inject
    EditorialRepository editorialRepository;

    public Editorial localizarEditorial (Long id) {
        return editorialRepository.findById(id);
    }

    public List<Editorial> listadoEditoriales () {
        return editorialRepository.findAll();
    }

    public void actualizar(Editorial editorial) {
        editorialRepository.save(editorial);
    }

}
