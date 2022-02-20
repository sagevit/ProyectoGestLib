package es.jpahibernate.gestlib.formcontrol;

import jakarta.mvc.binding.MvcBinding;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.FormParam;
import lombok.Data;

@Data
public class EdicionForm {

    @FormParam("editorialEdicionId")
    @MvcBinding
    @NotNull(message = "Seleccione una editorial")
    private Long editorialId;

    @FormParam("libroEdicionId")
    @MvcBinding
    @NotNull(message = "Seleccione un libro")
    private Long libroId;
}
