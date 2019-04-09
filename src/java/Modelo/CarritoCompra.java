
package Modelo;

import java.sql.Blob;
import ConexionBD.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import org.apache.tomcat.util.codec.binary.Base64;


public class CarritoCompra {
    int id, idprod, cantidad, precio, total;
    String rutcomprador, nombreprod;
    Blob imagen;
    byte[] encodedImage;

    public CarritoCompra() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdprod() {
        return idprod;
    }

    public void setIdprod(int idprod) {
        this.idprod = idprod;
    }

    public int getCantidad() {
        return cantidad;
    }

    public void setCantidad(int cantidad) {
        this.cantidad = cantidad;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }

    public String getRutcomprador() {
        return rutcomprador;
    }

    public void setRutcomprador(String rutcomprador) {
        this.rutcomprador = rutcomprador;
    }

    public String getNombreprod() {
        return nombreprod;
    }

    public void setNombreprod(String nombreprod) {
        this.nombreprod = nombreprod;
    }

    public Blob getImagen() {
        return imagen;
    }

    public void setImagen(Blob imagen) {
        this.imagen = imagen;
    }

    public byte[] getEncodedImage() {
        return encodedImage;
    }

    public void setEncodedImage(byte[] encodedImage) {
        this.encodedImage = encodedImage;
    }
    
        
    public boolean AñadirProducto(){
        
        try
        {
        Connection conn = ConexionBD.getConexion();
        String sql = "INSERT INTO carritocompra (idproducto, nombreproducto, precio, imagen, rutcomprador) SELECT id, producto.nombre, precio, imagen, usuario.rut FROM producto, usuario WHERE id=? and usuario.rut=?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setInt(1, this.idprod);
        pst.setString(2, this.rutcomprador);
        pst.execute();
        return true;
    }catch(SQLException e){
            System.err.println("Exepción en Ingresar producto al carrito de compra"+e);
            return false;
        }
    }
    
    
    public static LinkedList<CarritoCompra> listarProductos(String rut) throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from carritocompra where rutcomprador=?";
            PreparedStatement pst = conn.prepareStatement(sql);  
            pst.setString(1, rut);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<CarritoCompra> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                CarritoCompra cr = new CarritoCompra();
                cr.setId(rs.getInt("id") );
                cr.setIdprod(rs.getInt("idproducto") );
                cr.setNombreprod(rs.getString("nombreproducto") );
                cr.setPrecio(rs.getInt("precio"));                               
                cr.setImagen(rs.getBlob("imagen"));
                byte[] buffer = cr.getImagen().getBytes(1, (int)cr.getImagen().length());
                cr.setEncodedImage(Base64.encodeBase64(buffer));
                  
                
                listaADevolver.add( cr );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en CarritoCompra.ListarProductos " + e);
            return null;
        }      
    }
    
    public boolean EliminarProducto(){
        try{
            Connection conn = ConexionBD.getConexion();
            String sql = "delete from carritocompra where id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, this.id);
            pst.execute();
            return true;
            
        }catch(SQLException e){
            System.err.println("Excepción en CarritoCompra.EliminarProducto " + e);
            return false;
        }
    }
    
    public boolean VaciarListado(){
        try{
            Connection conn = ConexionBD.getConexion();
            String sql = "delete from carritocompra where rutcomprador=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, this.rutcomprador);
            pst.execute();
            return true;
            
        }catch(SQLException e){
            System.err.println("Excepción en CarritoCompra.VaciarListado " + e);
            return false;
        }
    }
}
