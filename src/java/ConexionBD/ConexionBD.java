package ConexionBD;
import java.sql.*;

public class ConexionBD 
{
    private static String url = "jdbc:derby://localhost:1527/BDCompra";
    private static String user= "inacap";
    private static String pass= "inacap";
    private static Connection conn;
    
    public static Connection getConexion()
    {
        try {
            Class.forName("org.apache.derby.jdbc.ClientDriver");
            
            if(conn == null)
                conn = DriverManager.getConnection(url, user, pass);
            
            return conn;
        }
        catch(Exception e){
            System.err.println(
                   "Excepción en ConexionBD.getConexion: " + e);
            
            return null;
        }
    }
}
