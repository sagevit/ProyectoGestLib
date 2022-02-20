package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.model.Biblioteca;
import es.jpahibernate.gestlib.model.Ejemplar;
import es.jpahibernate.gestlib.repository.EjemplarRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;

import java.util.List;
import java.util.Set;

@Slf4j
@ApplicationScoped
public class EjemplarService {

    @Inject
    EjemplarRepository ejemplarRepository;

    public Ejemplar localizarEjemplar(Long ejemplarId) { return ejemplarRepository.findById(ejemplarId); }

    public List<Ejemplar> localizarEjemplaresPorBibliotecaAndDisponible(Biblioteca biblioteca, Boolean disponible) { return ejemplarRepository.findByBibliotecaAndDisponible(biblioteca, disponible); }

    public void actualizar(Ejemplar ejemplar) {
        ejemplarRepository.save(ejemplar);
    }

    public void actualizarDisponibilidadEjemplares(Boolean disponibilidad, List<Long> ids) {
        for (Long id : ids) {
            ejemplarRepository.updateDisponibilidadEjemplar(disponibilidad, id); }
        }

    public void actualizarDisponibilidadEjemplares(Boolean disponibilidad, Set<Ejemplar> ejemplares) {
        for (Ejemplar ejemplar : ejemplares) {
            ejemplarRepository.updateDisponibilidadEjemplar(disponibilidad, ejemplar.getId()); }
    }

}
