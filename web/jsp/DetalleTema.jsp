<%@page import="Modelo.Tema"%>
<%@page import="Modelo.Respuesta"%>
<% 
    HttpSession hs = request.getSession(false);
    String idtema = request.getParameter("idTema");    
    Tema aux = Tema.buscarTema(Integer.parseInt(idtema));
    
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
     
        <div id="Foro">
            <ul><li><a href='IngresarRespuesta.jsp?idUsu=<%= hs.getAttribute("Nombre") %>&idTema=<%= request.getParameter("idTema") %>'>Responder al post</a></li></ul> <br>
            <div style="border: 1px black; border-color: black; border-radius: 5px 5px; box-shadow: 5px 5px #000000; background-color: #bcbfc2; word-wrap: break-word; "> <%= aux.getTitulo() %> </div> <br>
            <div style="border: 1px black; border-color: black; border-radius: 5px 5px; background-color: #ffffff; word-wrap: break-word; "><%= aux.getDetalle() %> </div> <br><br>
            
            <div style="border: 1px black; border-color: black; border-radius: 5px 5px; box-shadow: 5px 5px #000000; background-color: #bcbfc2; word-wrap: break-word; "> Respuestas </div>
            
            <table id="respuestas" border="1" align="center">            
             
            
                <% for(Respuesta r: Respuesta.listarRespuestas(Integer.parseInt(request.getParameter("idTema")))) { %>
            
              <tr>                 
                  
                  <td><%=r.getId()%></td>
                  <td> <div style="word-wrap: break-word; width: 450px;"> <%=r.getRespuesta() %> </div> </td>
                  <td><%= r.getNickname() %></td>
                  <td><%= r.getFechacreacion() %></td>               
                  
                  
                  
                      
                      <%                       
                         
                    if(hs.getAttribute("Nombre").equals(r.getRut()) || hs.getAttribute("Rol").equals("A") || hs.getAttribute("Rol").equals("E")){ 
                        
                        out.println("<td><a href='../EliminarRespueta.do?idRes="+r.getId()+"&idTema="+request.getParameter("idTema")+"'><img width='30' height='30' src='../imagenes/eliminar2.png'></a></td>");
                       
                    }
                    
                    %>  
                      
                     
                  
            </tr>                 
           <% } %>
           
             </table>
        </div>  
            
            
      
 
 <div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="contacto.jsp">Contacto</a> | <a href="quienessomos.jsp">¿Quienes Somos?</a>
 </div>
 </div>
</body>
</html>


