package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.model.Usuario;
import es.jpahibernate.gestlib.service.UsuarioService;
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
@Path("usuarios")
@Controller
@RequestScoped
public class UsuarioController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private UsuarioService usuarioService;

    @GET
    @Path("")
    @View("usuarios")
    public void main() {
        this.models.put("usuarios", usuarioService.listadoUsuarios());
    }

    @GET
    @Path("/nuevo")
    @View("usuario-form")
    public void nuevo() { }

    @GET
    @Path("/editar/{id}")
    @View("usuario-form")
    public void editar(@PathParam("id") @NotNull Long id) {
        this.models.put("usuario", usuarioService.localizarUsuario(id));
    }

    @POST
    @Transactional
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam Usuario usuario) {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("usuario", usuario);
            return "usuario-form";
        }
        usuarioService.actualizar(usuario);
        return "redirect:usuarios";
    }

    @POST
    @Transactional
    @Path("/eliminar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String eliminar(@BeanParam Usuario usuario) {
        usuarioService.eliminar(usuarioService.localizarUsuario(usuario.getId()));
        //this.models.put("usuarios", usuarioService.listadoUsuarios());
        return "redirect:usuarios";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
