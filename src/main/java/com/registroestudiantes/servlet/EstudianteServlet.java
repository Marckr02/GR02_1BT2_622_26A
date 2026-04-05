package com.registroestudiantes.servlet;

import com.registroestudiantes.dao.EstudianteDAO;
import com.registroestudiantes.model.Estudiante;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.time.LocalDate;

@WebServlet("/estudiantes")
public class EstudianteServlet extends HttpServlet {

    private final EstudianteDAO estudianteDAO = new EstudianteDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setAttribute("estudiantes", estudianteDAO.listar());
        request.getRequestDispatcher("/lista.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");

        Estudiante estudiante = new Estudiante();
        estudiante.setNombres(request.getParameter("nombres"));
        estudiante.setCedula(request.getParameter("cedula"));
        estudiante.setCodigoUnico(request.getParameter("codigoUnico"));

        String fechaNacimiento = request.getParameter("fechaNacimiento");
        if (fechaNacimiento != null && !fechaNacimiento.isBlank()) {
            estudiante.setFechaNacimiento(LocalDate.parse(fechaNacimiento));
        }

        estudianteDAO.guardar(estudiante);
        response.sendRedirect(request.getContextPath() + "/estudiantes");
    }
}