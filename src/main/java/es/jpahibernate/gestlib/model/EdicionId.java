package es.jpahibernate.gestlib.model;

import jakarta.persistence.Column;
import jakarta.persistence.Embeddable;
import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

import java.io.Serializable;

@Embeddable
@Getter
@Setter
@AllArgsConstructor
@NoArgsConstructor
public class EdicionId implements Serializable {

    @Column(name = "editorial_id")
    private Long editorialId;

    @Column(name = "libro_id")
    private Long libroId;

}
