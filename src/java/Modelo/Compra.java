
package Modelo;

import ConexionBD.ConexionBD;
import java.io.IOException;
import java.sql.Blob;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import org.apache.tomcat.util.codec.binary.Base64;


public class Compra {
    int id, idprod, precio, total;
    String rutvendedor, rutcomprador, nombreprod, fechacreacion, estado;
    Blob imagen;
    byte[] encodedImage;

    public Compra() {
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

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public String getRutvendedor() {
        return rutvendedor;
    }

    public void setRutvendedor(String rutvendedor) {
        this.rutvendedor = rutvendedor;
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

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
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

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }

    public int getTotal() {
        return total;
    }

    public void setTotal(int total) {
        this.total = total;
    }
    
    
    
    
    
    public boolean AñadirCompra(){
        
        try
        {
        Connection conn = ConexionBD.getConexion();
        String sql = "INSERT INTO compra (rutcomprador, idproducto, nombreproducto, precio, imagen) SELECT rutcomprador, idproducto, nombreproducto, precio, imagen FROM carritocompra WHERE rutcomprador=?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, this.rutcomprador);
        pst.execute();
        return true;
    }catch(SQLException e){
            System.err.println("Exepción en Ingresar compra"+e);
            return false;
        }
    }
    
    public static LinkedList<Compra> listarProductos(String rut) throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from compra where rutcomprador=?";
            PreparedStatement pst = conn.prepareStatement(sql);  
            pst.setString(1, rut);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<Compra> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                Compra c = new Compra();
                c.setId(rs.getInt("id") );
                c.setRutvendedor(rs.getString("rutvendedor"));
                c.setRutcomprador(rs.getString("rutcomprador"));
                c.setIdprod(rs.getInt("idproducto") );
                c.setNombreprod(rs.getString("nombreproducto") );
                c.setPrecio(rs.getInt("precio"));                               
                c.setImagen(rs.getBlob("imagen"));
                c.setFechacreacion(rs.getString("fechacreacion"));
                c.setEstado(rs.getString("estado"));
                
                byte[] buffer = c.getImagen().getBytes(1, (int)c.getImagen().length());
                c.setEncodedImage(Base64.encodeBase64(buffer));
                  
                
                listaADevolver.add( c );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en CarritoCompra.ListarProductos " + e);
            return null;
        }      
    }
    
     public static LinkedList<Compra> listarUsuarios() throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select distinct rutcomprador from compra";
            PreparedStatement pst = conn.prepareStatement(sql);  
            ResultSet rs = pst.executeQuery();            
            LinkedList<Compra> listaADevolver = new LinkedList<>();            
            while( rs.next() )
            {
                Compra u = new Compra();
                u.setRutcomprador(rs.getString("rutcomprador") );            

                listaADevolver.add( u );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en CarritoCompra.ListarUsuarios " + e);
            return null;
        }      
    }
     
     public boolean AprobarCompra(){
        
        try
        {
        Connection conn = ConexionBD.getConexion();
        String sql = "update compra set rutvendedor=?,estado='S' where rutcomprador=?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, this.rutvendedor);
        pst.setString(2, this.rutcomprador);
        pst.execute();
        return true;
    }catch(SQLException e){
            System.err.println("Exepción en Aprobar compra"+e);
            return false;
        }
    }
     
     public boolean DesaprobarCompra(){
        
        try
        {
        Connection conn = ConexionBD.getConexion();
        String sql = "update compra set rutvendedor=?,estado='N' where rutcomprador=?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, this.rutvendedor);
        pst.setString(2, this.rutcomprador);
        pst.execute();
        return true;
    }catch(SQLException e){
            System.err.println("Exepción en Aprobar compra"+e);
            return false;
        }
    }
    
     public boolean AprobarCompraPorsiSola(){
        
        try
        {
        Connection conn = ConexionBD.getConexion();
        String sql = "update compra set rutvendedor=?,estado='S' where id=?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, this.rutvendedor);
        pst.setInt(2, this.id);
        pst.execute();
        return true;
    }catch(SQLException e){
            System.err.println("Exepción en Aprobar compra"+e);
            return false;
        }
    }
     
     public boolean DesaprobarCompraPorsiSola(){
        
        try
        {
        Connection conn = ConexionBD.getConexion();
        String sql = "update compra set rutvendedor=?,estado='N' where id=?";
        PreparedStatement pst = conn.prepareStatement(sql); 
        pst.setString(1, this.rutvendedor);
        pst.setInt(2, this.id);
        pst.execute();
        return true;
    }catch(SQLException e){
            System.err.println("Exepción en Desaprobar compra"+e);
            return false;
        }
    }
     
     public static Compra CalcularPrecio(String rutcomprador)
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select SUM(precio) as total from compra where estado='S' and rutcomprador=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, rutcomprador);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next() == true)
            {
                Compra c = new Compra(); 
                c.setRutcomprador(rutcomprador);
                c.setTotal(rs.getInt("total"));
                
                return c;
            }
            else
                return null;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Compra.calculartotal: " +e);
            return null;
        }
    }
    
}
