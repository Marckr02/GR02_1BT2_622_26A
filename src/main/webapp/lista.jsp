<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Estudiantes EPN</title>
    <style>
        body { font-family: sans-serif; max-width: 960px; margin: 2rem auto; padding: 0 1rem; }
        h1   { color: #00418e; }
        table { width: 100%; border-collapse: collapse; margin-top: 1rem; }
        th   { background: #00418e; color: #fff; padding: .6rem 1rem; text-align: left; }
        td   { padding: .55rem 1rem; border-bottom: 1px solid #ddd; }
        tr:hover td { background: #f0f5ff; }
        .btn      { padding: .35rem .8rem; border: none; border-radius: 4px;
            cursor: pointer; font-size: .85rem; text-decoration: none; }
        .btn-primary  { background: #00418e; color: #fff; }
        .btn-warning  { background: #f59e0b; color: #fff; }
        .btn-danger   { background: #dc2626; color: #fff; }
        form.search { display: flex; gap: .5rem; margin-top: 1rem; }
        form.search input { flex: 1; padding: .4rem .7rem; border: 1px solid #ccc; border-radius: 4px; }
        .vacio { color: #888; padding: 1rem; }
    </style>
</head>
<body>
<h1>Registro de Estudiantes — EPN</h1>

<a href="registro.jsp" class="btn btn-primary">+ Nuevo estudiante</a>

<form class="search" action="estudiantes" method="get">
    <input type="hidden" name="accion" value="buscar"/>
    <input type="text" name="q" placeholder="Buscar por cédula o código EPN..."
           value="${busqueda}"/>
    <button type="submit" class="btn btn-primary">Buscar</button>
    <a href="estudiantes" class="btn" style="background:#e5e7eb">Ver todos</a>
</form>

<table>
    <thead>
    <tr>
        <th>Código EPN</th><th>Apellidos</th><th>Nombres</th>
        <th>Cédula</th><th>Carrera</th><th>Nacimiento</th><th>Acciones</th>
    </tr>
    </thead>
    <tbody>
    <c:choose>
        <c:when test="${empty estudiantes}">
            <tr><td colspan="7" class="vacio">No se encontraron registros.</td></tr>
        </c:when>
        <c:otherwise>
            <c:forEach var="est" items="${estudiantes}">
                <tr>
                    <td>${est.codigoEpn}</td>
                    <td>${est.apellidos}</td>
                    <td>${est.nombres}</td>
                    <td>${est.cedula}</td>
                    <td>${est.carrera}</td>
                    <td>${est.fechaNacimiento}</td>
                    <td>
                        <a href="estudiantes?accion=editar&id=${est.id}"
                           class="btn btn-warning">Editar</a>
                        <a href="estudiantes?accion=eliminar&id=${est.id}"
                           class="btn btn-danger"
                           onclick="return confirm('¿Eliminar a ${est.nombres} ${est.apellidos}?')">
                            Eliminar
                        </a>
                    </td>
                </tr>
            </c:forEach>
        </c:otherwise>
    </c:choose>
    </tbody>
</table>
</body>
</html>