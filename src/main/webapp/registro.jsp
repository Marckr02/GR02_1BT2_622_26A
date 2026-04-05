<%@ page contentType="text/html;charset=UTF-8" %>
<html>
<body>
<h2>Registrar Estudiante</h2>
<form action="${pageContext.request.contextPath}/estudiantes" method="post">
    <label>Nombres: <input type="text" name="nombres" required/></label><br/>
    <label>Cédula: <input type="text" name="cedula" required/></label><br/>
    <label>Código único: <input type="text" name="codigoUnico" required/></label><br/>
    <label>Fecha de nacimiento: <input type="date" name="fechaNacimiento" required/></label><br/>
    <button type="submit">Guardar</button>
</form>
<a href="${pageContext.request.contextPath}/estudiantes">Ver lista</a>
</body>
</html>