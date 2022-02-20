package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.Editorial;
import es.jpahibernate.gestlib.model.Pais;
import es.jpahibernate.gestlib.service.EditorialService;
import es.jpahibernate.gestlib.service.PaisService;
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
@Path("editoriales")
@Controller
@RequestScoped
public class EditorialController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private EditorialService editorialService;

    @Inject
    private PaisService paisService;

    @GET
    @Path("")
    @View("editoriales")
    public void main() { this.models.put("editoriales", editorialService.listadoEditoriales()); }

    @GET
    @Path("/nuevo")
    @View("editorial-form")
    public void nuevo() {
        this.models.put("paises", paisService.listadoPaises());
    }

    @GET
    @Path("/editar/{id}")
    @View("editorial-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        this.models.put("paises", paisService.listadoPaises());
        this.models.put("editorial", editorialService.localizarEditorial(id));
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam Editorial editorial, @Valid @BeanParam Pais pais) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("paises", paisService.listadoPaises());
            this.models.put("editorial", editorial);
            return "editorial-form";
        }
        editorial.setPais(paisService.leerPaisPorNombre(pais.getNombre()));
        this.editorialService.actualizar(editorial);
        return "redirect:editoriales";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
