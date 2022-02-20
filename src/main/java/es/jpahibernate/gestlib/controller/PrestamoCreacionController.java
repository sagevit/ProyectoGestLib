package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.formcontrol.PrestamoForm;
import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.service.BibliotecaService;
import es.jpahibernate.gestlib.service.EjemplarService;
import es.jpahibernate.gestlib.service.PrestamoService;
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

import java.text.ParseException;
import java.util.ArrayList;

@Slf4j
@Path("creacionPrestamos")
@Controller
@RequestScoped
public class PrestamoCreacionController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private BibliotecaService bibliotecaService;

    @Inject
    private UsuarioService usuarioService;

    @Inject
    private EjemplarService ejemplarService;

    @Inject
    private PrestamoService prestamoService;

    @GET
    @Path("")
    @View("prestamoBibliotecas")
    public void prestamoBibliotecas() {
        this.models.put("bibliotecas", bibliotecaService.listadoBibliotecas());
    }

    @GET
    @Path("{id}")
    @View("prestamoUsuarios")
    public void prestamoUsuarios(@PathParam("id") @NotNull Long id) {
        this.models.put("idBiblioteca", id);
        this.models.put("usuarios", usuarioService.listadoUsuarios());
    }

    @GET
    @Path("{idBiblioteca}/{idUsuario}")
    @View("prestamo-form")
    public void prestamoEjemplares(@PathParam("idBiblioteca") @NotNull Long idBiblioteca, @PathParam("idUsuario") @NotNull Long idUsuario) {
        this.models.put("fechaCreacion", prestamoService.obtenerFechaActual());
        this.models.put("fechaDevolucion", prestamoService.obtenerFechaA15Dias());
        this.models.put("idBiblioteca", idBiblioteca);
        this.models.put("idUsuario", idUsuario);
        this.models.put("ejemplares", ejemplarService
                .localizarEjemplaresPorBibliotecaAndDisponible(bibliotecaService
                        .localizarBiblioteca(idBiblioteca), true));
    }

    @POST
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam PrestamoForm prestamoForm) throws ParseException {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("fechaCreacion", prestamoForm.getFechaPrestamo());
            this.models.put("fechaDevolucion", prestamoForm.getFechaDevolucion());
            this.models.put("idBiblioteca", prestamoForm.getIdBiblioteca());
            this.models.put("idUsuario", prestamoForm.getIdUsuario());
            this.models.put("ejemplares", ejemplarService
                    .localizarEjemplaresPorBibliotecaAndDisponible(bibliotecaService
                            .localizarBiblioteca(prestamoForm.getIdBiblioteca()), true));
            return "prestamo-form";
        }

        prestamoService.creacionPrestamo(prestamoForm);
        return "redirect:creacionPrestamos";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
