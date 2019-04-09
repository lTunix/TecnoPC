<%@page import="Modelo.Tema"%>
<% 
    HttpSession hs = request.getSession(false);
    
if(hs == null || hs.getAttribute("Rol") == null){
    out.println("<h2>Error: No ha iniciado sesion.</h2>");
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
 <title>TecnoPC | Foro</title>
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
                    if(hs != null && hs.getAttribute("Rol").equals("A")){ 
                        out.println("<li><a href='../admin/AdministrarUsuarios.jsp'>Administrar Usuarios</a></li>");
                    }else{
                        
                    } 
                     %> 
                    
 		<% 
                    if(hs == null || hs.getAttribute("Usuario")== null){ 
                        out.println("<a href='jsp/registro.jsp'>Registro</a>");
                    }else{
                        out.println("<li><a href='CarritoCompra.jsp'>Carrito de Compra</a></li>");
                        out.println("<li><a href='../CerrarSesion.do'>Cerrar Sesión</a></li>");
                    } 
                     %> 
 	</ul>
 </div>
     
     <table id="productos" border="1" width="700" align="center">            
            <tr>
                
                <td>ID</td>
                <td>Titulo</td>
                <td>Nombre de Usuario</td>
                <td>Rol</td>
                <td>Fecha Creacion</td>
                <% 
                        

                    if(hs != null && hs.getAttribute("Rol").equals("A") || hs.getAttribute("Rol").equals("E")){                        
                        out.println("<td>Operaciones</td>");                      
                        
                    }
                    %>  
                
            </tr>            
            
            <%out.println("<div id='navegacion'><a href='AgregarTemaForo.jsp?idUsu="+hs.getAttribute("Nombre")+"&idGrupo="+Integer.parseInt(request.getParameter("idGrupo"))+"'>Agregar Nuevo Tema</a> </div>");%>
            
            
            <% for(Tema t: Tema.listarTemas(Integer.parseInt(request.getParameter("idGrupo")))) { %>
            
              <tr>                 
                  
                  <td><%= t.getId() %></td>
                  <td width='700'><a href='DetalleTema.jsp?idTema=<%= t.getId()%>'><img width='30' height='30' src='../imagenes/foro.png'> <%= t.getTitulo() %></a></td>               
                  <td><%= t.getNickname() %></td>
                  <td><%= t.getRol() %></td> 
                  <td><%= t.getFechacreacion() %></td> 
                  
                      <% 
                        

                    if(hs != null && hs.getAttribute("Rol").equals("A") || hs.getAttribute("Rol").equals("E")){                        
                           out.println("<td><a href='../EliminarTemaForo.do?idTema="+t.getId()+"&idGrupo="+Integer.parseInt(request.getParameter("idGrupo"))+"'><img width='30' height='30' src='../imagenes/eliminar2.png'></a></td>");        
                        
                    }else{
                         
                    }
                    %>  
                      
                     
                  
            </tr>                 
           <% } %>
           
             </table>
     
 
 <div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="contacto.jsp">Contacto</a> | <a href="quienessomos.jsp">¿Quienes Somos?</a>
 </div>
 </div>
</body>
</html>


