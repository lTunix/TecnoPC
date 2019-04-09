
package Modelo;

import ConexionBD.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import org.apache.tomcat.util.codec.binary.Base64;


public class Foro {
    int ID;
    String titulo, nomusu, rol, fechacreacion;

    public Foro() {
    }

    public int getID() {
        return ID;
    }

    public void setID(int ID) {
        this.ID = ID;
    }

    public String getTitulo() {
        return titulo;
    }

    public void setTitulo(String titulo) {
        this.titulo = titulo;
    }

    public String getNomusu() {
        return nomusu;
    }

    public void setNomusu(String nomusu) {
        this.nomusu = nomusu;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }
    
    public static LinkedList<Foro> listarTemas() throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from foro";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<Foro> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                Foro f = new Foro();
                f.setID(rs.getInt("id"));
                f.setTitulo(rs.getString("titulo") );
                f.setNomusu(rs.getString("nomusu"));
                f.setRol(rs.getString("rol"));
                f.setFechacreacion(rs.getString("fechacreacion"));
                listaADevolver.add( f );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Alumno.listarMedicos: " + e);
            return null;
        }      
    }
    
    public boolean IngresarGrupo()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = " INSERT INTO foro (titulo, nomusu, rol) VALUES " +
      "(?,?,?)";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, this.titulo);
            pst.setString(2, this.nomusu);
            pst.setString(3, this.rol); 
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Ingresar grupo foro"+e);
            return false;
        }
    }    
    
    public boolean EliminarGrupo()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "delete from foro where id=?";
            String sql2 = "delete from tema where idforo=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            PreparedStatement pst2 = conn.prepareStatement(sql2);
            pst.setInt(1, this.ID);            
            pst2.setInt(1, this.ID);            
            pst.execute();
            pst2.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Eliminar grupo foro"+e);
            return false;
        }
    }    
}
