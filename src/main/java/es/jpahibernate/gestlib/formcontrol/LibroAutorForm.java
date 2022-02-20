package es.jpahibernate.gestlib.formcontrol;

import jakarta.mvc.binding.MvcBinding;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.FormParam;
import lombok.Data;

@Data
public class LibroAutorForm {

    @FormParam("libroAutorId")
    @MvcBinding
    @NotNull(message = "Seleccione un Autor")
    private Long id;

}
