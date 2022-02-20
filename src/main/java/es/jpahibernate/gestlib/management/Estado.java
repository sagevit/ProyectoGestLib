package es.jpahibernate.gestlib.management;

import lombok.Getter;

@Getter
public enum Estado {

    PRESTADO("En préstamo"),
    DEVUELTO("Devuelto"),
    RETRASADO("Devuelto con retraso");

    private String descripcion;

    Estado(String descripcion) {
        this.descripcion = descripcion;
    }
}
