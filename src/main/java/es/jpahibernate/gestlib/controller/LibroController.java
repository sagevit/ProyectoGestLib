package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.formcontrol.LibroAutorForm;
import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.Libro;
import es.jpahibernate.gestlib.service.AutorService;
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
@Path("libros")
@Controller
@RequestScoped
public class LibroController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private LibroService libroService;

    @Inject
    private AutorService autorService;

    @GET
    @Path("")
    @View("libros")
    public void main() { this.models.put("libros", libroService.listadoLibros()); }

    @GET
    @Path("/nuevo")
    @View("libro-form")
    public void nuevo() {
        this.models.put("autores", autorService.listadoAutores());
    }

    @GET
    @Path("/editar/{id}")
    @View("libro-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        this.models.put("autores", autorService.listadoAutores());
        this.models.put("libro", libroService.localizarLibro(id));
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam Libro libro, @Valid @BeanParam LibroAutorForm autor) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("libro", libro);
            this.models.put("autores", autorService.listadoAutores());
            return "libro-form";
        }
        libro.setAutor(autorService.localizarAutor(autor.getId()));
        libroService.actualizar(libro);
        return "redirect:libros";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
