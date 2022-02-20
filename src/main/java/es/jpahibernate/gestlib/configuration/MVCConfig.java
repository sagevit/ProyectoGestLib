package es.jpahibernate.gestlib.configuration;

import jakarta.ws.rs.ApplicationPath;
import jakarta.ws.rs.core.Application;
import org.eclipse.krazo.Properties;

import java.util.HashMap;
import java.util.Map;

@ApplicationPath("mvc")
public class MVCConfig extends Application {

    @Override
    public Map<String, Object> getProperties() {
        Map<String,Object> map = new HashMap<>();
        map.put(Properties.DEFAULT_VIEW_FILE_EXTENSION, "jsp");
        return map;
    }
}
