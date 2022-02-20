package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.*;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "ediciones")
public class Edicion {

    @EmbeddedId
    private EdicionId id;

    @MapsId("editorialId")
    @ManyToOne
    private Editorial editorial;

    @MapsId("libroId")
    @ManyToOne
    private Libro libro;

    @FormParam("anioEdicion")
    @NotNull(message = "Año de edición no puede estar vacío")
    @Min(1800)
    @Max(2099)
    @MvcBinding
    @Column(nullable = false)
    private Integer anio;

}
