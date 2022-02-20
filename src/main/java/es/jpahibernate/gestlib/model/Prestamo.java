package es.jpahibernate.gestlib.model;

import es.jpahibernate.gestlib.management.Estado;
import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.FormParam;
import lombok.Getter;
import lombok.Setter;

import java.util.Date;
import java.util.LinkedHashSet;
import java.util.Set;

@Entity
@Getter
@Setter
@Table(name = "prestamos")
public class Prestamo {

    @FormParam("idPrestamo")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @ManyToOne
    @JoinColumn(name = "usuarioId")
    private Usuario usuario;

    @FormParam("fechaPrestamo")
    @NotNull(message = "Fecha de préstamo debe estar informada")
    @MvcBinding
    //@PastOrPresent(message = "Fecha de préstamo no puede ser posterior a la fecha actual")
    @Temporal(TemporalType.DATE)
    //@Convert(converter = SimpleDateFormatAttributeConverter.class)
    @Column(nullable = false)
    private Date fechaPrestamo;

    @FormParam("fechaDevolucion")
    @NotNull(message = "Fecha de devolución debe estar informada")
    @MvcBinding
    //@Future(message = "La fecha debe ser posterior a la fecha actual")
    @Temporal(TemporalType.DATE)
    //@Convert(converter = SimpleDateFormatAttributeConverter.class)
    @Column(nullable = false)
    private Date fechaDevolucion;

    @FormParam("estadoPrestamo")
    @NotNull(message = "Es obligatorio escoger un estado")
    @MvcBinding
    @Column(nullable = false)
    private Estado estado;

    @ManyToMany
    @JoinTable(name = "prestamos_ejemplares",
            joinColumns = @JoinColumn(name = "prestamo_ejemplar"),
            inverseJoinColumns = @JoinColumn(name = "ejemplarId"))
    private Set<Ejemplar> ejemplares = new LinkedHashSet<>();

}
