package es.jpahibernate.gestlib.service;

import es.jpahibernate.gestlib.formcontrol.DevolucionForm;
import es.jpahibernate.gestlib.formcontrol.PrestamoForm;
import es.jpahibernate.gestlib.management.Estado;
import es.jpahibernate.gestlib.model.Prestamo;
import es.jpahibernate.gestlib.model.Usuario;
import es.jpahibernate.gestlib.repository.PrestamoRepository;
import jakarta.enterprise.context.ApplicationScoped;
import jakarta.inject.Inject;
import lombok.extern.slf4j.Slf4j;
import org.apache.deltaspike.jpa.api.transaction.Transactional;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Calendar;
import java.util.Date;
import java.util.List;

@Slf4j
@ApplicationScoped
public class PrestamoService {

    @Inject
    PrestamoRepository prestamoRepository;

    @Inject
    UsuarioService usuarioService;

    @Inject
    EjemplarService ejemplarService;

    public Prestamo localizarPrestamo (Long id) {
        return prestamoRepository.findById(id);
    }

    public List<Prestamo> listadoPrestamos () { return prestamoRepository.findAll(); }

    public List<Prestamo> listadoPrestamosPorUsuario (Usuario usuario) { return prestamoRepository.findByUsuarioOrderByEstado(usuario); }

    public List<Prestamo> listadoPrestamosPorFechaDevolucion (Date fecha) { return prestamoRepository.findByFechaDevolucionAfter(fecha); }

    public List<Usuario> listadoUsuariosPorEstadoDePrestamo (Estado estado) { return prestamoRepository.localizaUsuariosDePrestamosPorEstado(estado); }

    public void actualizar(Prestamo prestamo) {
        prestamoRepository.save(prestamo);
    }

    @Transactional
    public void creacionPrestamo(PrestamoForm prestamoForm) throws ParseException {

        ejemplarService.actualizarDisponibilidadEjemplares(false, prestamoForm.getEjemplaresId());

        Prestamo prestamo = new Prestamo();
        prestamo.setUsuario(usuarioService.localizarUsuario(prestamoForm.getIdUsuario()));
        prestamo.setFechaPrestamo(new SimpleDateFormat("yyyy-MM-dd").parse(prestamoForm.getFechaPrestamo()));
        prestamo.setFechaDevolucion(new SimpleDateFormat("yyyy-MM-dd").parse(prestamoForm.getFechaDevolucion()));
        prestamo.setEstado(Estado.PRESTADO);
        for (Long ejemplarId : prestamoForm.getEjemplaresId()) {
            prestamo.getEjemplares().add(ejemplarService.localizarEjemplar(ejemplarId));
        }
        prestamoRepository.save(prestamo);

    }

    @Transactional
    public void devolucionPrestamo(DevolucionForm devolucionForm) throws ParseException {

        ejemplarService.actualizarDisponibilidadEjemplares(true, prestamoRepository.findById(devolucionForm.getDevolucionId()).getEjemplares());

        Prestamo prestamo = prestamoRepository.findById(devolucionForm.getDevolucionId());

        Date fechaDevolucion = new SimpleDateFormat("yyyy-MM-dd").parse(devolucionForm.getFechaDevolucion());
        if (fechaDevolucion.after(prestamo.getFechaDevolucion())) {
            prestamo.setEstado(Estado.DEVUELTO);
        } else {
            prestamo.setEstado(Estado.RETRASADO);
        }
        prestamo.setFechaDevolucion(fechaDevolucion);
        prestamoRepository.save(prestamo);

    }

    public String obtenerFechaActual() {
        return new SimpleDateFormat("yyyy-MM-dd").format(Calendar.getInstance().getTime());
    }

    public String obtenerFechaA15Dias() {
        Calendar c = Calendar.getInstance();
        c.setTime(new Date());
        c.add(Calendar.DATE, 15);
        return new SimpleDateFormat("yyyy-MM-dd").format(c.getTime());
    }
}
