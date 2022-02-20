package es.jpahibernate.gestlib.formcontrol;

import jakarta.mvc.binding.MvcBinding;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
public class DevolucionForm {

    @FormParam("devolucionId")
    @MvcBinding
    @NotNull(message = "Seleccione un préstamo")
    private Long devolucionId;

    @FormParam("fechaDevolucionDevolucion")
    @MvcBinding
    @NotEmpty(message = "Informe la fecha de devolución")
    @NotNull(message = "Informe la fecha de devolución")
    //@Temporal(TemporalType.DATE)
    //@Future(message = "La fecha de devolución debe ser posterior a la fecha actual")
    private String fechaDevolucion;

}
