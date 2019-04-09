
package Controlador;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import Modelo.Tema;

public class CrearTemaForo extends HttpServlet {


    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            String titulo = request.getParameter("titulo");
            String detalle = request.getParameter("detalle");
            String idgrupo = request.getParameter("idgrupo");
            String rut = request.getParameter("rut");
            String nomusu = request.getParameter("nomusu");
            String rol = request.getParameter("rol");
            
            Tema t = new Tema();
            t.setTitulo(titulo);
            t.setDetalle(detalle);
            t.setIdforo(Integer.parseInt(idgrupo));
            t.setRut(rut);
            t.setNickname(nomusu);
            t.setRol(rol);
            
            t.IngresarTema();
            response.sendRedirect("jsp/TemaForo.jsp?idGrupo=" + idgrupo);
            
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
