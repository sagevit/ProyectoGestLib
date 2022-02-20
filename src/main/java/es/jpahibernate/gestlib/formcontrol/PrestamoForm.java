package es.jpahibernate.gestlib.formcontrol;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.Convert;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

import java.time.LocalDate;
import java.util.Date;
import java.util.List;

@Getter
@Setter
public class PrestamoForm {

    @FormParam("bibliotecaPrestamoId")
    @MvcBinding
    @NotNull(message = "Seleccione una biblioteca")
    private Long idBiblioteca;

    @FormParam("usuarioPrestamoId")
    @MvcBinding
    @NotNull(message = "Seleccione un usuario")
    private Long idUsuario;

    @FormParam("ejemplarPrestamoId")
    @MvcBinding
    @NotEmpty(message = "Seleccione al menos un ejemplar")
    private List<Long> ejemplaresId;

    @FormParam("fechaCreacionPrestamo")
    @MvcBinding
    @NotEmpty(message = "Informe la fecha de préstamo")
    @NotNull(message = "Informe la fecha de préstamo")
    //@Temporal(TemporalType.DATE)
    //@PastOrPresent(message = "Fecha de préstamo no puede ser posterior a la fecha actual")
    private String fechaPrestamo;

    @FormParam("fechaDevolucionPrestamo")
    @MvcBinding
    @NotEmpty(message = "Informe la fecha de devolución")
    @NotNull(message = "Informe la fecha de devolución")
    //@Temporal(TemporalType.DATE)
    //@Future(message = "La fecha de devolución debe ser posterior a la fecha actual")
    private String fechaDevolucion;

}
