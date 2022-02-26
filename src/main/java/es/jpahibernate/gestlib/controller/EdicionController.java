package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.formcontrol.EdicionForm;
import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.Edicion;
import es.jpahibernate.gestlib.model.EdicionId;
import es.jpahibernate.gestlib.service.EdicionService;
import es.jpahibernate.gestlib.service.EditorialService;
import es.jpahibernate.gestlib.service.LibroService;
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
@Path("ediciones")
@Controller
@RequestScoped
public class EdicionController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private LibroService libroService;

    @Inject
    private EditorialService editorialService;

    @Inject
    private EdicionService edicionService;

    @GET
    @Path("/{id}")
    @View("edicion-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        Edicion edicion = new Edicion();
        edicion.setLibro(libroService.localizarLibro(id));
        this.models.put("edicion", edicion);
        this.models.put("editoriales", editorialService.listadoEditoriales());
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam Edicion edicion, @Valid @BeanParam EdicionForm edicionForm) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            edicion.setLibro(libroService.localizarLibro(edicionForm.getLibroId()));
            this.models.put("edicion", edicion);
            this.models.put("editoriales", editorialService.listadoEditoriales());
            return "edicion-form";
        }

        edicion.setId(new EdicionId());
        edicion.setEditorial(editorialService.localizarEditorial(edicionForm.getEditorialId()));
        edicion.setLibro(libroService.localizarLibro(edicionForm.getLibroId()));

        edicionService.actualizar(edicion);
        return "redirect:libros";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
