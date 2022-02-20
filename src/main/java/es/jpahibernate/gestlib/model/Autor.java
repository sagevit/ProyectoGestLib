package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "autores")
public class Autor {

    @FormParam("idAutor")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("nombreAutor")
    @NotEmpty @NotBlank(message = "Nombre de autor no puede estar vacío")
    @Size(max = 33)
    @MvcBinding
    @Column(nullable = false, length = 33)
    private String nombre;

    @FormParam("apellido1Autor")
    @NotEmpty @NotBlank(message = "Primer apellido de autor no puede estar vacío")
    @Size(max = 33)
    @MvcBinding
    @Column(nullable = false, length = 33)
    private String apellido1;

    @FormParam("apellido2Autor")
    @Size(max = 33)
    @MvcBinding
    @Column(length = 33)
    private String apellido2;

    @OneToMany(mappedBy = "autor", fetch = FetchType.LAZY)
    private Set<Libro> libros = new LinkedHashSet<>();

    public String getNombreCompleto() {
        return this.nombre.concat(" ").concat(this.apellido1).concat(" ").concat(this.apellido2);
    }
}
