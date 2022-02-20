package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.Autor;
import es.jpahibernate.gestlib.service.AutorService;
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
@Path("autores")
@Controller
@RequestScoped
public class AutorController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private AutorService autorService;

    @GET
    @Path("")
    @View("autores")
    public void main() {
        this.models.put("autores", autorService.listadoAutores());
    }

    @GET
    @Path("/nuevo")
    @View("autor-form")
    public void nuevo() { }

    @GET
    @Path("/editar/{id}")
    @View("autor-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        this.models.put("autor", autorService.localizarAutor(id));
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam Autor autor) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("autor", autor);
            return "autor-form";
        }
        autorService.actualizar(autor);
        return "redirect:autores";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
