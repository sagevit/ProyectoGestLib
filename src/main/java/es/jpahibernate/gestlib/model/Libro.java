package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotEmpty;
import jakarta.validation.constraints.Size;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "libros")
public class Libro {

    @FormParam("idLibro")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("tituloLibro")
    @NotEmpty @NotBlank(message = "Título de libro no puede estar vacío")
    @Size(max = 50)
    @MvcBinding
    @Column(nullable = false, length = 50)
    private String titulo;

    @FormParam("isbnLibro")
    @NotEmpty @NotBlank(message = "El ISBN del libro no puede estar vacío")
    @Size(max = 13)
    @MvcBinding
    @Column(nullable = false, length = 13)
    private String isbn;

    @FormParam("sinopsisLibro")
    @MvcBinding
    @Column(columnDefinition = "TEXT")
    private String sinopsis;

    @ManyToOne(optional = false)
    @JoinColumn(name = "autorId", nullable = false)
    private Autor autor;

    @OneToMany(mappedBy = "libro")
    private Set<Edicion> ediciones;

}
