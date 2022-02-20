package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "paises")
public class Pais {

    @FormParam("idPais")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("nombrePais")
    @NotEmpty @NotBlank(message = "Nombre de país no puede estar vacío")
    @Size(max = 25)
    @MvcBinding
    @Column(nullable = false, length = 25)
    private String nombre;

}
