package es.jpahibernate.gestlib.management;

import jakarta.enterprise.context.RequestScoped;
import jakarta.inject.Named;
import jakarta.mvc.binding.ParamError;

import java.util.ArrayList;
import java.util.List;
import java.util.stream.Collectors;

@Named("error")
@RequestScoped
public class Errors {

    private List<ParamError> errors = new ArrayList<>();

    public void setErrors(List<ParamError> messages) {
        this.errors = messages;
    }

    public String getErrors() {
        return errors.stream()
                .map(ParamError::getMessage)
                .collect(Collectors.joining("<br>"));
    }

    public String getMessage(String param) {
        return errors.stream()
                .filter(v -> v.getParamName().equals(param))
                .map(ParamError::getMessage)
                .findFirst()
                .orElse("");
    }
}