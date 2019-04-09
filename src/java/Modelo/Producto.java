
package Modelo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;

import ConexionBD.ConexionBD;
import java.io.IOException;
import java.io.InputStream;
import java.sql.Blob;
import org.apache.tomcat.util.codec.binary.Base64;
import org.apache.tomcat.util.http.fileupload.FileItem;





public class Producto {
    String nombre;
    int precio, stock, id;
    Blob imagen;
    byte[] encodedImage;
    InputStream file;
    


    public Producto() {
        this.encodedImage = null;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public int getPrecio() {
        return precio;
    }

    public void setPrecio(int precio) {
        this.precio = precio;
    }

    public int getStock() {
        return stock;
    }

    public void setStock(int stock) {
        this.stock = stock;
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

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public InputStream getFile() {
        return file;
    }

    public void setFile(InputStream file) {
        this.file = file;
    }


    
    
    

    
    
    
    public static LinkedList<Producto> listarProductos() throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from producto";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<Producto> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                Producto p = new Producto();
                p.setId(rs.getInt("id") );
                p.setNombre(rs.getString("nombre") );
                p.setPrecio(rs.getInt("precio"));
                p.setStock(rs.getInt("stock"));
                p.setImagen(rs.getBlob("imagen"));
                byte[] buffer = p.getImagen().getBytes(1, (int)p.getImagen().length());
                p.setEncodedImage(Base64.encodeBase64(buffer));
                  
                
                listaADevolver.add( p );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Producto.ListarProductos " + e);
            return null;
        }      
    }
    
    public boolean RegistrarProducto() throws IOException
    {
        try
        {
            Connection con = ConexionBD.getConexion();
            String sql = "insert into producto (nombre, precio, stock, imagen) values(?,?,?,?)";
            PreparedStatement pst = con.prepareStatement(sql);            
            pst.setString(1, this.nombre);
            pst.setInt(2, this.precio);
            pst.setInt(3, this.stock);            
            pst.setBlob(4, this.file);
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción encontrada en Usuario.ModificarUsuario(): "+e);
            return false;
        }
    }
    
    public boolean EliminarProducto(){
        try{
            Connection conn = ConexionBD.getConexion();
            String sql = "delete from producto where id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, this.id);
            pst.execute();
            return true;
            
        }catch(SQLException e){
            System.err.println("Excepción en Producto.EliminarProducto " + e);
            return false;
        }
    }
    
    public static Producto buscarProducto(int idprod)
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from producto where id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, idprod);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next() == true)
            {
                Producto p = new Producto(); 
                p.setId(idprod);
                p.setNombre(rs.getString("nombre"));
                p.setPrecio(rs.getInt("precio"));
                p.setStock(rs.getInt("stock"));                
                
                return p;
            }
            else
                return null;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Producto.obtenerProducto: " +e);
            return null;
        }
    }
    
    public void ModificarProducto(int idprod, Producto nuevosDatos)
        {
           try
           {
               Connection conn = ConexionBD.getConexion();
               String sql = "update producto set nombre=?, precio=?, stock=?, imagen=? where id=?";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, getNombre());
               pst.setInt(2, getPrecio());
               pst.setInt(3, getStock());
               pst.setBlob(4, getFile());
               pst.setInt(5, getId());
               pst.execute();         
           }
           catch(SQLException e)
           {
               System.err.println("Excepción en Producto.modificarProducto: " +e);
           }
        }
    
    
}


