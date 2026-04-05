# GR02_1BT2_622_26A

Aplicación web Java con Maven para registrar y listar estudiantes usando Jakarta Servlet, JPA/Hibernate y JSP.

## Requisitos
- Java 11 o superior
- MySQL en `localhost:3306`
- Base de datos `registro_db`
- Credenciales válidas en `src/main/resources/META-INF/persistence.xml`

## Archivos clave
- `src/main/java/com/registroestudiantes/model/Estudiante.java`
- `src/main/java/com/registroestudiantes/dao/EstudianteDAO.java`
- `src/main/java/com/registroestudiantes/servlet/EstudianteServlet.java`
- `src/main/webapp/registro.jsp`
- `src/main/webapp/lista.jsp`
- `src/main/resources/META-INF/persistence.xml`

## Flujo
- `GET /estudiantes` muestra la lista.
- `POST /estudiantes` guarda un estudiante.
- `registro.jsp` envía el formulario al servlet.

## Compilación
Si tienes Maven instalado:
```powershell
mvn clean package
```

## Ejecución
Despliega el WAR en Tomcat 10.1+ o usa el plugin de Tomcat si tu entorno está configurado para ello.

## Nota
La configuración JPA activa está en `src/main/resources/META-INF/persistence.xml`.

