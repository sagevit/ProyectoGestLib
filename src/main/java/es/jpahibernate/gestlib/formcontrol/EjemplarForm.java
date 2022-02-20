package es.jpahibernate.gestlib.formcontrol;

import jakarta.mvc.binding.MvcBinding;
import jakarta.validation.constraints.*;
import jakarta.ws.rs.FormParam;
import lombok.Data;

@Data
public class EjemplarForm {

    @FormParam("bibliotecaEjemplarId")
    @MvcBinding
    @NotNull(message = "Seleccione una biblioteca")
    private Long bibliotecaId;

    @FormParam("libroEjemplarId")
    @MvcBinding
    @NotNull(message = "Seleccione un libro")
    private Long libroId;

    @FormParam("editorialEjemplarId")
    @MvcBinding
    @NotNull(message = "Seleccione una editorial")
    private Long editorialId;

    @FormParam("nombreLibro")
    @MvcBinding
    @NotEmpty @NotBlank(message = "Teclee nombre de libro o su ISBN")
    private String nombreLibro;

}
