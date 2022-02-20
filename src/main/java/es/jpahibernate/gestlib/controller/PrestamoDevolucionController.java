package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.formcontrol.DevolucionForm;
import es.jpahibernate.gestlib.management.Errors;
import es.jpahibernate.gestlib.management.Estado;
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
@Path("devolucionPrestamos")
@Controller
@RequestScoped
public class PrestamoDevolucionController {

    @Inject
    private Models models;

    @Inject
    private Errors errores;

    @Inject
    private BindingResult bindingResult;

    @Inject
    private UsuarioService usuarioService;

    @Inject
    private PrestamoService prestamoService;

    @GET
    @Path("")
    @View("devolucionUsuarios")
    public void devolucionUsuarios() {
        this.models.put("usuarios", prestamoService.listadoUsuariosPorEstadoDePrestamo(Estado.PRESTADO));
    }

    @GET
    @Path("{idUsuario}")
    @View("devolucionPrestamos")
    public void devolucionPrestamos(@PathParam("idUsuario") @NotNull Long idUsuario) {
        this.models.put("prestamos", prestamoService.listadoPrestamosPorUsuario(usuarioService.localizarUsuario(idUsuario)));
    }

    @GET
    @Path("prestamo/{idPrestamo}")
    @View("devolucion-form")
    public void devolverPrestamo(@PathParam("idPrestamo") @NotNull Long idPrestamo) {
        this.models.put("fechaDevolucion", prestamoService.obtenerFechaActual());
        this.models.put("prestamo", prestamoService.localizarPrestamo(idPrestamo));
    }

    @POST
    @Path("/actualizar")
    @ValidateOnExecution(type = ExecutableType.NONE)
    public String actualizar(@Valid @BeanParam DevolucionForm devolucionForm) throws ParseException {
        if (bindingResult.isFailed()) {
            this.getErrores();
            this.models.put("fechaDevolucion", devolucionForm.getFechaDevolucion());
            this.models.put("prestamo", prestamoService.localizarPrestamo(devolucionForm.getDevolucionId()));
            return "devolucion-form";
        }

        prestamoService.devolucionPrestamo(devolucionForm);
        return "redirect:devolucionPrestamos";
    }

    private void getErrores() {
        errores.setErrors(new ArrayList<>(bindingResult.getAllErrors()));
    }

}
