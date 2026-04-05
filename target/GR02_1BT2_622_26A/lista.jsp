<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<html>
<body>
<h2>Estudiantes registrados</h2>
<a href="${pageContext.request.contextPath}/registro.jsp">Nuevo registro</a>
<table border="1">
    <tr><th>Nombres</th><th>Cédula</th><th>Código</th><th>Nacimiento</th></tr>
    <c:forEach var="estudiante" items="${estudiantes}">
        <tr>
            <td>${estudiante.nombres}</td>
            <td>${estudiante.cedula}</td>
            <td>${estudiante.codigoUnico}</td>
            <td>${estudiante.fechaNacimiento}</td>
        </tr>
    </c:forEach>
</table>
</body>
</html>