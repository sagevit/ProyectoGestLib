package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.formcontrol.EjemplarForm;
import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.EdicionId;
import es.jpahibernate.gestlib.model.Ejemplar;
import es.jpahibernate.gestlib.service.BibliotecaService;
import es.jpahibernate.gestlib.service.EdicionService;
import es.jpahibernate.gestlib.service.EjemplarService;
import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Inject;
import jakarta.mvc.Controller;
import jakarta.mvc.Models;
import jakarta.mvc.View;
import jakarta.mvc.binding.BindingResult;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.validation.executable.ExecutableType;
import jakarta.validation.executable.ValidateOnExecution;
import jakarta.ws.rs.*;
import lombok.extern.slf4j.Slf4j;
import org.apache.deltaspike.jpa.api.transaction.Transactional;

import java.util.ArrayList;

@Slf4j
@Path("ejemplares")
@Controller
@RequestScoped
public class EjemplarController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private BibliotecaService bibliotecaService;

    @Inject
    private EdicionService edicionService;

    @Inject
    private EjemplarService ejemplarService;

    @GET
    @Path("/{id}")
    @View("ejemplar-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        this.models.put("ejemplarForm", new EjemplarForm());
        this.models.put("biblioteca", bibliotecaService.localizarBiblioteca(id));
        this.models.put("ediciones", edicionService.listadoEdiciones());
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam EjemplarForm ejemplarForm) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("ejemplarForm", ejemplarForm);
            this.models.put("biblioteca", bibliotecaService.localizarBiblioteca(ejemplarForm.getBibliotecaId()));
            this.models.put("ediciones", edicionService.listadoEdiciones());
            return "ejemplar-form";
        }

        Ejemplar ejemplar = new Ejemplar();
        ejemplar.setBiblioteca(bibliotecaService.localizarBiblioteca(ejemplarForm.getBibliotecaId()));
        ejemplar.setEdicion(edicionService.localizarEdicion(new EdicionId(ejemplarForm.getEditorialId(), ejemplarForm.getLibroId())));
        ejemplar.setDisponible(true);
        ejemplarService.actualizar(ejemplar);

        return "redirect:bibliotecas";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
