
package Modelo;

import ConexionBD.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;


public class Respuesta {
    int id, idtema;
    String rut, nickname, rol, respuesta, fechacreacion;

    public Respuesta() {
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public int getIdtema() {
        return idtema;
    }

    public void setIdtema(int idtema) {
        this.idtema = idtema;
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

    public String getRespuesta() {
        return respuesta;
    }

    public void setRespuesta(String respuesta) {
        this.respuesta = respuesta;
    }

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }
    
    public boolean IngresarRespuesta()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "INSERT INTO respuesta (idtema, rut, nickname, rol, respuesta) VALUES " +
      "(?,?,?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, this.idtema);
            pst.setString(2, this.rut);
            pst.setString(3, this.nickname); 
            pst.setString(4, this.rol); 
            pst.setString(5, this.respuesta);  
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Ingresar respuesta foro"+e);
            return false;
        }
    }    
    
    public static LinkedList<Respuesta> listarRespuestas(int idtema) throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from respuesta where idtema=?";
            PreparedStatement pst = conn.prepareStatement(sql);  
            pst.setInt(1, idtema);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<Respuesta> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                Respuesta r = new Respuesta();
                r.setId(rs.getInt("id"));
                r.setIdtema(rs.getInt("idtema"));
                r.setRut(rs.getString("rut"));
                r.setNickname(rs.getString("nickname"));
                r.setRol(rs.getString("rol"));
                r.setRespuesta(rs.getString("respuesta"));
                r.setFechacreacion(rs.getString("fechacreacion"));
                
                listaADevolver.add( r );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Temas.ListarTemas " + e);
            return null;
        }      
    }
    
    public boolean EliminarRespuesta()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "delete from respuesta where id=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setInt(1, this.id);             
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Eliminar respuesta foro"+e);
            return false;
        }
    }    
}
