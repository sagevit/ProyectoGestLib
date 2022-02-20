package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Pattern;
import jakarta.validation.constraints.Size;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "usuarios")
public class Usuario {

    @FormParam("idUsuario")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("nombreUsuario")
    @NotEmpty @NotBlank(message = "Nombre de usuario no puede estar vacío")
    @Size(max = 33)
    @MvcBinding
    @Column(nullable = false, length = 33)
    private String nombre;

    @FormParam("apellido1Usuario")
    @NotEmpty @NotBlank(message = "Primer apellido de usuario no puede estar vacío")
    @Size(max = 33)
    @MvcBinding
    @Column(nullable = false, length = 33)
    private String apellido1;

    @FormParam("apellido2Usuario")
    @Size(max = 33)
    @MvcBinding
    @Column(length = 33)
    private String apellido2;

    @FormParam("dniUsuario")
    @NotEmpty @NotBlank(message = "DNI de usuario no puede estar vacío")
    @Size(max = 9)
    @Pattern(regexp = "[0-9]{1,8}[A-Za-z]", message = "Formato de DNI incorrecto")
    @MvcBinding
    @Column(length = 9, unique=true)
    private String dni;

    @FormParam("direccionUsuario")
    @MvcBinding
    @Column(columnDefinition = "TEXT")
    private String direccion;

    @OneToMany(mappedBy = "usuario", cascade = CascadeType.REMOVE, orphanRemoval = true, fetch = FetchType.LAZY)
    private Set<Prestamo> prestamos = new LinkedHashSet<>();

    public String getNombreCompleto() {
        return this.nombre.concat(" ").concat(this.apellido1).concat(" ").concat(this.apellido2);
    }
}
