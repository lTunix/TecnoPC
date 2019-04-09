
package Controlador;

import Modelo.Producto;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;


@MultipartConfig(maxFileSize = 16177215)
public class ModificarProducto extends HttpServlet {


    
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        
        String Idprod = request.getParameter("idprod");
        String nombre = request.getParameter("nombre");
        String precio = request.getParameter("precio");
        String stock = request.getParameter("stock");
        
        InputStream inputStream = null; 
        Part filePart = request.getPart("imagen");
        
        if (filePart != null) {
            
            System.out.println(filePart.getName());
            System.out.println(filePart.getSize());
            System.out.println(filePart.getContentType());
             
            
            inputStream = filePart.getInputStream();
        }
        
        Producto p = new Producto();
        p.setId(Integer.parseInt(Idprod));
        p.setNombre(nombre);
        p.setPrecio(Integer.parseInt(precio));
        p.setStock(Integer.parseInt(stock));
        p.setFile(inputStream);
        
        p.ModificarProducto(Integer.parseInt(Idprod), p);
        response.sendRedirect("index.jsp");
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