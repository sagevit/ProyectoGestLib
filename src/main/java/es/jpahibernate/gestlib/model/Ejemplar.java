package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

@Entity
@Getter
@Setter
@Table(name = "ejemplares")
public class Ejemplar {

    @FormParam("ejemplarId")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "bibliotecaId")
    private Biblioteca biblioteca;

    @ManyToOne(optional = false)
    @JoinColumns({
            @JoinColumn(name = "edicionEditorialId", referencedColumnName = "editorial_id", nullable = false),
            @JoinColumn(name = "edicionLibroId", referencedColumnName = "libro_id", nullable = false)
    })
    private Edicion edicion;

    @Column(columnDefinition="BOOLEAN DEFAULT true")
    private Boolean disponible;

}
