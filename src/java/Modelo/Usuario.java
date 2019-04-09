
package Modelo;

import ConexionBD.ConexionBD;
import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.LinkedList;
import org.eclipse.jdt.internal.compiler.ast.ThisReference;


public class Usuario {
    String rut, nomusu, clave, nombre, apellido, sexo, fechanacimiento, fechacreacion, pais, ciudad, comuna, rol, email, estado;
    int telefono;

    public Usuario() {
    }

    public String getRut() {
        return rut;
    }

    public void setRut(String rut) {
        this.rut = rut;
    }

    public String getNomusu() {
        return nomusu;
    }

    public void setNomusu(String nomusu) {
        this.nomusu = nomusu;
    }

    public String getClave() {
        return clave;
    }

    public void setClave(String clave) {
        this.clave = clave;
    }

    public String getNombre() {
        return nombre;
    }

    public void setNombre(String nombre) {
        this.nombre = nombre;
    }

    public String getApellido() {
        return apellido;
    }

    public void setApellido(String apellido) {
        this.apellido = apellido;
    }

    public String getSexo() {
        return sexo;
    }

    public void setSexo(String sexo) {
        this.sexo = sexo;
    }

    public String getFechanacimiento() {
        return fechanacimiento;
    }

    public void setFechanacimiento(String fechanacimiento) {
        this.fechanacimiento = fechanacimiento;
    }

    public String getFechacreacion() {
        return fechacreacion;
    }

    public void setFechacreacion(String fechacreacion) {
        this.fechacreacion = fechacreacion;
    }

    public String getPais() {
        return pais;
    }

    public void setPais(String pais) {
        this.pais = pais;
    }

    public String getCiudad() {
        return ciudad;
    }

    public void setCiudad(String ciudad) {
        this.ciudad = ciudad;
    }

    public String getComuna() {
        return comuna;
    }

    public void setComuna(String comuna) {
        this.comuna = comuna;
    }

    public String getRol() {
        return rol;
    }

    public void setRol(String rol) {
        this.rol = rol;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public int getTelefono() {
        return telefono;
    }

    public void setTelefono(int telefono) {
        this.telefono = telefono;
    }

    public String getEstado() {
        return estado;
    }

    public void setEstado(String estado) {
        this.estado = estado;
    }
    
    
    
    public boolean IngresarUsuario()
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = " INSERT INTO USUARIO (rut,nomusu,clave,nombre,apellido,sexo,telefono,fechanacimiento,pais,ciudad,comuna,rol,email,estado) VALUES " +
      "(?,?,?,?,?,?,?,?,?,?,?,?,?,'I')";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, this.rut);
            pst.setString(2, this.nomusu);
            pst.setString(3, this.clave);
            pst.setString(4,this.nombre);
            pst.setString(5,this.apellido);
            pst.setString(6,this.sexo);
            pst.setInt(7,this.telefono);
            pst.setString(8,this.fechanacimiento);
            pst.setString(9,this.pais);
            pst.setString(10,this.ciudad);
            pst.setString(11,this.comuna);
            pst.setString(12,this.rol);
            pst.setString(13,this.email);            
                   
            pst.execute();
            return true;
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Ingresar usuario"+e);
            return false;
        }
    }     
    
    public static Usuario ExisteUsuario(String r, String c, String e, String rol){
         try{
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from usuario where rut=? and clave=? and estado=? and rol=?"; 
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, r);
            pst.setString(2, c);
            pst.setString(3, e);
            pst.setString(4, rol);
            ResultSet rs = pst.executeQuery();                 
           
         if(rs.next())
            {
                Usuario u = new Usuario();
                u.setRut(r);
                u.setClave(c);
                u.setEstado(e);
                u.setRol(rol);
                return u;                
            }
            else
            {
                return null;
            }          
         }catch(SQLException ex){
             System.out.println("Excepción en Medico.ValidarUsuario:" + ex);
            return null;
         }
         
         
     };
    
    public static LinkedList<Usuario> listarUsuarios() throws IOException{
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from usuario";
            PreparedStatement pst = conn.prepareStatement(sql);
            ResultSet rs = pst.executeQuery();
            
            LinkedList<Usuario> listaADevolver = new LinkedList<>();
            
            while( rs.next() )
            {
                Usuario u = new Usuario();
                u.setRut(rs.getString("rut"));
                u.setNomusu(rs.getString("nomusu"));
                u.setClave(rs.getString("clave"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setSexo(rs.getString("sexo"));
                u.setTelefono(rs.getInt("telefono"));
                u.setFechanacimiento(rs.getString("fechanacimiento"));
                u.setFechacreacion(rs.getString("fechacreacion"));
                u.setPais(rs.getString("pais"));
                u.setCiudad(rs.getString("ciudad"));
                u.setComuna(rs.getString("comuna"));
                u.setRol(rs.getString("rol"));
                u.setEmail(rs.getString("email"));
                u.setEstado(rs.getString("estado"));
                
                listaADevolver.add( u );
            }
            
            return listaADevolver;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Usuario.listarUsuarios: " + e);
            return null;
        }      
    }
    
    public static void eliminarUsuario(String rut)
    {
        try
        {
            Connection conn  = ConexionBD.getConexion();
            String sql = "delete from usuario where rut=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, rut);
            pst.execute();
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Usuario.eliminarUsuario: " + e);
            return;
        }                
    }
    
     public static void AprobarUsuario(String rut)
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "update usuario set estado='A' where rut=?";
            PreparedStatement pst = conn.prepareStatement(sql);             
            
            pst.setString(1, rut);
            
            pst.execute();
            
        }
        catch(SQLException e)
        {
            System.err.println("Exepción en Aprobar usuario"+e);
            return;
        }

    }

        public static void modificarUsuario(String rut, Usuario nuevosDatos)
        {
           try
           {
               Connection conn = ConexionBD.getConexion();

               String sql = "UPDATE USUARIO set nomusu=?,clave=?,nombre=?,apellido=?,sexo=? ,telefono=?,fechanacimiento=?,pais=?"
                       + ",ciudad=?,comuna=?,rol=?,email=? WHERE rut=?";
               PreparedStatement pst = conn.prepareStatement(sql);
               pst.setString(1, nuevosDatos.getNomusu());
               pst.setString(2, nuevosDatos.getClave());
               pst.setString(3, nuevosDatos.getNombre());
               pst.setString(4, nuevosDatos.getApellido());
               pst.setString(5, nuevosDatos.getSexo());
               pst.setInt(6, nuevosDatos.getTelefono());
               pst.setString(7, nuevosDatos.getFechanacimiento());
               pst.setString(8, nuevosDatos.getPais());
               pst.setString(9, nuevosDatos.getCiudad());
               pst.setString(10, nuevosDatos.getComuna());
               pst.setString(11, nuevosDatos.getRol());
               pst.setString(12, nuevosDatos.getEmail());
               pst.setString(13, rut);
               pst.execute();         
           }
           catch(SQLException e)
           {
               System.err.println("Excepción en Usuario.modificarUsuario: " +e);
           }
        }
        
        public static Usuario buscarUsuario(String rut)
    {
        try
        {
            Connection conn = ConexionBD.getConexion();
            String sql = "select * from usuario where rut=?";
            PreparedStatement pst = conn.prepareStatement(sql);
            pst.setString(1, rut);
            ResultSet rs = pst.executeQuery();
            
            if(rs.next() == true)
            {
                Usuario u = new Usuario(); 
                u.setRut(rut);
                u.setNomusu(rs.getString("nomusu"));
                u.setClave(rs.getString("clave"));
                u.setNombre(rs.getString("nombre"));
                u.setApellido(rs.getString("apellido"));
                u.setSexo(rs.getString("sexo"));
                u.setTelefono(rs.getInt("telefono"));
                u.setPais(rs.getString("pais"));
                u.setCiudad(rs.getString("ciudad"));
                u.setComuna(rs.getString("comuna"));
                u.setRol(rs.getString("rol"));
                u.setEmail(rs.getString("email"));
                
                return u;
            }
            else
                return null;
        }
        catch(SQLException e)
        {
            System.err.println("Excepción en Usuario.obtenerUsuario: " +e);
            return null;
        }
    }
}
