package es.jpahibernate.gestlib.controller;

import es.jpahibernate.gestlib.model.Usuario;
import es.jpahibernate.gestlib.service.UsuarioService;
import jakarta.inject.Inject;
import jakarta.validation.Valid;
import jakarta.validation.constraints.NotNull;
import jakarta.ws.rs.*;
import jakarta.ws.rs.core.MediaType;
import jakarta.ws.rs.core.Response;
import lombok.extern.slf4j.Slf4j;

@Slf4j
@Path("/api/usuarios")
public class UsuarioRestController {

    @Inject
    private UsuarioService usuarioService;

    @GET
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response obtenerUsuarioById(@PathParam("id") @NotNull Long id) {
        Usuario usuario = usuarioService.localizarUsuario(id);

        if (usuario == null) {
            return Response.status(Response.Status.NOT_FOUND).build();
        }

        return Response.ok(usuario).build();
    }

    @POST
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response altaUsuario(@Valid Usuario usuario) {
        try {
            Usuario usuarioSave = usuarioService.actualizar(usuario);
            return Response.ok(usuarioSave).status(Response.Status.CREATED).build();
        } catch (Exception e) {
            return Response.notModified().build();
        }
    }

    @PUT
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    @Consumes(MediaType.APPLICATION_JSON)
    public Response modificarUsuario(@Valid Usuario usuario, @PathParam("id") @NotNull Long id) {

        // Si los IDs de los usuarios no son iguales se rechaza la modificación
        if (!usuario.getId().equals(id)) {
            return Response.notModified().build();
        }

        if (usuarioService.localizarUsuario(id) != null) {
            usuarioService.actualizar(usuario);
            return Response.ok().build();
        }

        return Response.status(Response.Status.NOT_FOUND).build();
    }

    @DELETE
    @Path("/{id}")
    @Produces(MediaType.APPLICATION_JSON)
    public Response delete(@PathParam("id") @NotNull Long id) {

        Usuario usuario = usuarioService.localizarUsuario(id);

        if (usuario != null) {
            if (usuarioService.eliminar(usuario)) {
                return Response.ok().build();
            }
            return Response.status(Response.Status.FORBIDDEN).build();
        }

        return Response.status(Response.Status.NOT_FOUND).build();
    }
}
