package es.jpahibernate.gestlib.model;

import jakarta.mvc.binding.MvcBinding;
import jakarta.persistence.*;
import jakarta.validation.constraints.Email;
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
@Table(name = "bibliotecas")
public class Biblioteca {

    @FormParam("idBiblioteca")
    @MvcBinding
    @Id
    @GeneratedValue(strategy = GenerationType.IDENTITY)
    private Long id;

    @FormParam("nombreBiblioteca")
    @NotEmpty @NotBlank(message = "Nombre de biblioteca no puede estar vacío")
    @Size(max = 60)
    @MvcBinding
    @Column(nullable = false, length = 60)
    private String nombre;

    @FormParam("direccionBiblioteca")
    @MvcBinding
    @Column(columnDefinition = "TEXT")
    private String direccion;

    @FormParam("telefonoBiblioteca")
    @Size(max = 9)
    @MvcBinding
    @Column
    private String telefono;

    @FormParam("emailBiblioteca")
    @Size(max = 33)
    @Email(message = "Dirección de correo con formato erróneo")
    @MvcBinding
    @Column
    private String email;

    @FormParam("webBiblioteca")
    @Size(max = 50)
    @MvcBinding
    @Column
    private String web;

    @OneToOne(cascade = CascadeType.ALL, optional = false, orphanRemoval = true, fetch = FetchType.LAZY)
    @JoinColumn(name = "gerenteId", nullable = false, unique = true)
    private Gerente gerente;

    @OneToMany(mappedBy = "biblioteca", cascade = CascadeType.REMOVE, orphanRemoval = true, fetch = FetchType.LAZY)
    private Set<Ejemplar> ejemplares = new LinkedHashSet<>();

}
