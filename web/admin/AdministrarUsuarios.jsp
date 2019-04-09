<%@page import="Modelo.Usuario"%>
<% 
    HttpSession hs = request.getSession(false);
    

    if(hs == null || hs.getAttribute("Rol") == null){
    out.println("<h2>Error: No ha iniciado sesion.</h2>");
    out.println("</br>");
    out.println("<a href='../index.jsp'>");
    out.println("Volver al inicio</a>");
    return;
}

if (hs.getAttribute("Rol").equals("U") == true || hs.getAttribute("Rol").equals("E") == true || hs.getAttribute("Rol").equals("V") == true){
    out.println("<h2>Error: Su rol no le permite visualizar esta pagina.</h2>");
    out.println("</br>");
    out.println("<a href='../index.jsp'>");
    out.println("Volver al inicio</a>");
    return;
}
%>
<!DOCTYPE html> 
<html lang="es">
<head>
 <meta charset="utf-8" />
 <link rel="icon" type="image/png" href="../imagenes/phpThumb_generated_thumbnailico.ico" />
 <link href="../css/Diseno-web.css" rel="stylesheet" type="text/css">
 <title>TecnoPC | Aministrar Usuarios</title>
</head>
<body>
 <div id="global">
 <a href="Inicio.html"><div id="cabecera">
 </div></a>
 <div id="navegacion">
	 <ul>
 		<li><a href="../index.jsp">Inicio</a></li>
	 	<li><% 
                    if(hs == null || hs.getAttribute("Usuario")== null){                        
                        out.println("<a href='jsp/login.jsp'>Login</a>");                       
                        
                    }else{
                        if(hs.getAttribute("Rol").equals("A")){
                            String rol = "Administrador:";
                            out.println("Bienvenido " + rol + " " + hs.getAttribute("Nombre"));
                        }else if(hs.getAttribute("Rol").equals("E")){
                            String rol = "Editor:";
                            out.println("Bienvenido " + rol + " " + hs.getAttribute("Nombre"));
                        }else if(hs.getAttribute("Rol").equals("U")){
                            String rol = "Usuario:";
                            out.println("Bienvenido " + rol + " " + hs.getAttribute("Nombre"));
                        }else if(hs.getAttribute("Rol").equals("V")){
                            String rol = "Vendedor:";
                            out.println("Bienvenido " + rol + " " + hs.getAttribute("Nombre"));
                        }
                        
                    }
                    %>  
                    </li>   
                    
                    <% 
                    if(hs == null || hs.getAttribute("Usuario")== null){ 
                        
                    }else{
                        out.println("<li><a href='../jsp/ForoGrupos.jsp'>Foro</a></li>");
                    } 
                     %> 
                    
                    
 		<% 
                    if(hs == null || hs.getAttribute("Usuario")== null){ 
                        out.println("<a href='jsp/registro.jsp'>Registro</a>");
                    }else{
                        out.println("<li><a href='../jsp/CarritoCompra.jsp'>Carrito de Compra</a></li>");
                        out.println("<li><a href='../CerrarSesion.do'>Cerrar Sesión</a></li>");
                    } 
                     %> 
 	</ul>
 </div>
     
     <table id="usuarios" border="1" width="700" align="center">            
            <tr>
                
                <td>Rut</td>
                <td>Nombre de Usuario</td>
                <td>Clave</td>
                <td>Nombre</td>
                <td>Apellido</td>
                <td>Sexo</td>
                <td>Telefono</td>
                <td>Fecha Nacimiento</td>
                <td>Fecha Creación</td>
                <td>Pais</td>
                <td>Ciudad</td>
                <td>Comuna</td>
                <td>Rol</td>
                <td>Email</td>
                <td>Estado</td>
                <% 
                        

                    if(hs != null && hs.getAttribute("Rol")!= null){                        
                        out.println("<td>Operaciones</td>");                      
                        
                    }
                    %>  
                
            </tr>            
            
            <div id="navegacion"> Usuarios Recientes </div> 
            
            <% for(Usuario u: Usuario.listarUsuarios()) { %>
            
              <tr>                 
                  
                  <td><%= u.getRut()%></td>                  
                  <td><%= u.getNomusu() %></td>                
                  <td><%= u.getClave() %></td>
                  <td><%= u.getNombre() %></td>    
                  <td><%= u.getApellido() %></td>    
                  <td><%= u.getSexo() %></td>    
                  <td><%= u.getTelefono() %></td>    
                  <td><%= u.getFechanacimiento() %></td>    
                  <td><%= u.getFechacreacion() %></td>    
                  <td><%= u.getPais() %></td>    
                  <td><%= u.getCiudad() %></td>    
                  <td><%= u.getComuna() %></td>    
                  <td><%= u.getRol() %></td>    
                  <td><%= u.getEmail() %></td>    
                  <td><%= u.getEstado() %></td>    
                      <% 
                        

                    if(hs != null && hs.getAttribute("Usuario")!= null){  
                        if(u.getEstado().equals("I")){
                               out.print("<td><a href='../AprobarUsuario.do?idUsu="+u.getRut()+"'><img width='30' height='30' src='../imagenes/aprobar.png'></a></td>");
                           }
                           out.print("<td><a href='ModificarUsuario.jsp?idUsu="+u.getRut()+"'><img width='30' height='30' src='../imagenes/modificar.png'></a></td>"); 
                           out.print("<td><a href='../EliminarUsuario.do?idUsu="+u.getRut()+"'><img width='30' height='30' src='../imagenes/eliminar.png'></a></td>");
                           
                    }else{
                         
                    }
                    %>  
                      
                     
                  
            </tr>                 
           <% } %>
           
             </table>
     
 
 <div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="../jsp/contacto.jsp">Contacto</a> | <a href="../jsp/quienessomos.jsp">¿Quienes Somos?</a>
 </div>
 </div>
</body>
</html>
