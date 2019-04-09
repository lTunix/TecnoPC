
package Modelo;

import ConexionBD.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import org.apache.tomcat.util.codec.binary.Base64;


public class Tema {
    int id, idforo;
    String rut, nickname, rol, titulo, detalle, fechacreacion;

    public Tema() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdforo() {
        return idforo;
    }

    public void setIdforo(int idforo) {
        this.idforo = idforo;
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNickname() {
        return nickname;
    }

    public void setNickname(String nickname) {
        this.nickname = nickname;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getDetalle() {
        return detalle;
    }

    public void setDetalle(String detalle) {
        this.detalle = detalle;
    }

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }
    
    public static LinkedList<Tema> listarTemas(int idgrupo) throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from tema where idforo=?";
            PreparedStatement pst = conn.prepareStatement(sql);  
            pst.setInt(1, idgrupo);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<Tema> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                Tema t = new Tema();
                t.setId(rs.getInt("id") );
                t.setIdforo(rs.getInt("idforo"));
                t.setRut(rs.getString("rut"));
                t.setNickname(rs.getString("nickname"));
                t.setRol(rs.getString("rol"));
                t.setTitulo(rs.getString("titulo"));
                t.setDetalle(rs.getString("detalle"));
                t.setFechacreacion(rs.getString("fechacreacion"));               
                  
                
                listaADevolver.add( t );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Temas.ListarTemas " + e);
            return null;
        }      
    }
    
    public boolean IngresarTema()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "INSERT INTO tema (idforo, rut, nickname, rol, titulo, detalle) VALUES " +
      "(?,?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, this.idforo);
            pst.setString(2, this.rut);
            pst.setString(3, this.nickname); 
            pst.setString(4, this.rol); 
            pst.setString(5, this.titulo); 
            pst.setString(6, this.detalle); 
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Ingresar tema foro"+e);
            return false;
        }
    }    
    
    public static Tema buscarTema(int idtema)
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select titulo, detalle from tema where id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, idtema);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next() == true)
            {
                Tema t = new Tema(); 
                t.setTitulo(rs.getString("titulo"));
                t.setDetalle(rs.getString("detalle"));
                
                return t;
            }
            else
                return null;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Tema.buscartema: " +e);
            return null;
        }
    }
    
    public boolean EliminarTema()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "delete from tema where id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, this.id);                       
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Eliminar tema foro"+e);
            return false;
        }
    }    
}
