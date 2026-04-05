<%@ page contentType="text/html;charset=UTF-8" %>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
<head>
    <meta charset="UTF-8">
    <title>Editar Estudiante — EPN</title>
    <style>
        body  { font-family: sans-serif; max-width: 520px; margin: 2rem auto; padding: 0 1rem; }
        h1    { color: #00418e; }
        label { display: block; margin-top: .9rem; font-size: .9rem; color: #444; }
        input, select { width: 100%; padding: .45rem .7rem; margin-top: .25rem;
            border: 1px solid #ccc; border-radius: 4px; box-sizing: border-box; }
        .btns { margin-top: 1.4rem; display: flex; gap: .7rem; }
        .btn  { padding: .5rem 1.2rem; border: none; border-radius: 4px;
            cursor: pointer; text-decoration: none; font-size: .95rem; }
        .btn-primary { background: #00418e; color: #fff; }
        .btn-back    { background: #e5e7eb; color: #333; }
    </style>
</head>
<body>
<h1>Editar Estudiante</h1>

<c:if test="${not empty error}">
    <div style="color:#dc2626;background:#fef2f2;padding:.5rem .8rem;border-radius:4px;margin-top:.8rem;">
        ${error}
    </div>
</c:if>

<form action="estudiantes" method="post">
    <input type="hidden" name="accion" value="actualizar"/>
    <input type="hidden" name="id"     value="${estudiante.id}"/>

    <label>Nombres *
        <input type="text" name="nombres" value="${estudiante.nombres}" required/>
    </label>
    <label>Apellidos *
        <input type="text" name="apellidos" value="${estudiante.apellidos}" required/>
    </label>
    <label>Cédula *
        <input type="text" name="cedula" maxlength="10" pattern="\d{10}"
               value="${estudiante.cedula}" required/>
    </label>
    <label>Código EPN * (máx. 8 caracteres)
        <input type="text" name="codigoEpn" maxlength="8"
               value="${estudiante.codigoEpn}" required/>
    </label>
    <label>Carrera / Facultad *
        <select name="carrera" required>
            <option value="">-- Seleccione --</option>
            <option value="Ingeniería en Sistemas" ${estudiante.carrera == 'Ingeniería en Sistemas' ? 'selected' : ''}>Ingeniería en Sistemas</option>
            <option value="Ingeniería Civil"        ${estudiante.carrera == 'Ingeniería Civil'        ? 'selected' : ''}>Ingeniería Civil</option>
            <option value="Ingeniería Eléctrica"    ${estudiante.carrera == 'Ingeniería Eléctrica'    ? 'selected' : ''}>Ingeniería Eléctrica</option>
            <option value="Ingeniería Mecánica"     ${estudiante.carrera == 'Ingeniería Mecánica'     ? 'selected' : ''}>Ingeniería Mecánica</option>
            <option value="Ingeniería Química"      ${estudiante.carrera == 'Ingeniería Química'      ? 'selected' : ''}>Ingeniería Química</option>
            <option value="Ciencias"                ${estudiante.carrera == 'Ciencias'                ? 'selected' : ''}>Ciencias</option>
        </select>
    </label>
    <label>Fecha de nacimiento
        <input type="date" name="fechaNacimiento"
               value="${estudiante.fechaNacimiento}"/>
    </label>

    <div class="btns">
        <button type="submit" class="btn btn-primary">Actualizar</button>
        <a href="estudiantes" class="btn btn-back">Cancelar</a>
    </div>
</form>
</body>
</html>