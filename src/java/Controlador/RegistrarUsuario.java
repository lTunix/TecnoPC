
package Controlador;

import Modelo.Usuario;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;


public class RegistrarUsuario extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            
            
            String rut=request.getParameter("rut");
            String nomUsu=request.getParameter("nombreUsu");            
            String nom=request.getParameter("nombre");
            String ape=request.getParameter("apellido");
            String correo=request.getParameter("correo") ;
            String telefono=request.getParameter("telefono") ;
            String clave=request.getParameter("clave") ;
            String sexo=request.getParameter("sexo");            
            String nacimientodia=request.getParameter("dia");            
            String nacimientomes=request.getParameter("mes");            
            String nacimientoaño=request.getParameter("año");            
            String pais=request.getParameter("pais");            
            String ciudad=request.getParameter("ciudad");            
            String comuna=request.getParameter("comuna");            
            String rol=request.getParameter("rol");            
            
            
             
            
                Usuario u = new Usuario();
                u.setRut(rut);
                u.setNomusu(nomUsu);
                u.setNombre(nom);
                u.setApellido(ape);
                u.setEmail(correo);
                u.setTelefono(Integer.parseInt(telefono));
                u.setClave(clave);
                u.setSexo(sexo);
                u.setFechanacimiento(nacimientoaño + "-" + nacimientomes + "-" + nacimientodia);
                u.setPais(pais);
                u.setCiudad(ciudad);
                u.setComuna(comuna);
                u.setRol(rol);
                
             
                u.IngresarUsuario();
                
                
                response.sendRedirect("jsp/UsuarioRegistrado.jsp");
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
