package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.Biblioteca;
import es.jpahibernate.gestlib.model.Gerente;
import es.jpahibernate.gestlib.service.BibliotecaService;
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
@Path("bibliotecas")
@Controller
@RequestScoped
public class BibliotecaController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private BibliotecaService bibliotecaService;

    @GET
    @Path("")
    @View("bibliotecas")
    public void main() { this.models.put("bibliotecas", bibliotecaService.listadoBibliotecas()); }

    @GET
    @Path("/nuevo")
    @View("biblioteca-form")
    public void nuevo() { }

    @GET
    @Path("/editar/{id}")
    @View("biblioteca-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        Biblioteca biblioteca =  bibliotecaService.localizarBiblioteca(id);
        this.models.put("biblioteca", biblioteca);
        this.models.put("gerente", biblioteca.getGerente());
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam Biblioteca biblioteca, @Valid @BeanParam Gerente gerente) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("biblioteca", biblioteca);
            this.models.put("gerente", gerente);
            return "biblioteca-form";
        }
        biblioteca.setGerente(gerente);
        this.bibliotecaService.actualizar(biblioteca);
        return "redirect:bibliotecas";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
