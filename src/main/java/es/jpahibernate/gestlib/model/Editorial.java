package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Getter
@Setter
@Entity
@Table(name = "editoriales")
public class Editorial {

    @FormParam("idEditorial")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("nombreEditorial")
    @NotEmpty @NotBlank(message = "Nombre de editorial no puede estar vacío")
    @MvcBinding
    @Column(nullable = false)
    private String nombre;

    @FormParam("sedeEditorial")
    @MvcBinding
    @Column(columnDefinition = "TEXT")
    private String sede;

    @ManyToOne(optional = false)
    @JoinColumn(name = "paisId", nullable = false)
    private Pais pais;

    @OneToMany(mappedBy = "editorial")
    private Set<Edicion> ediciones;

}
