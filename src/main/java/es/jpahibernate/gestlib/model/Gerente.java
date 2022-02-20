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
@Table(name = "gerentes")
public class Gerente {

    @FormParam("idGerente")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("nombreGerente")
    @NotEmpty @NotBlank(message = "Nombre de gerente no puede estar vacío")
    @Size(max = 33)
    @MvcBinding
    @Column(nullable = false, length = 33)
    private String nombre;

    @FormParam("apellido1Gerente")
    @NotEmpty @NotBlank(message = "Primer apellido de gerente no puede estar vacío")
    @Size(max = 33)
    @MvcBinding
    @Column(nullable = false, length = 33)
    private String apellido1;

    @FormParam("apellido2Gerente")
    @Size(max = 33)
    @MvcBinding
    @Column(length = 33)
    private String apellido2;

    public String getNombreCompleto() {
        return this.nombre.concat(" ").concat(this.apellido1).concat(" ").concat(this.apellido2);
    }
}
