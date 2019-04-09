<%@page import="Modelo.CarritoCompra"%>
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
 <title>TecnoPC | Carrito de Compra</title>
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
                        out.println("<li><a href='../CerrarSesion.do'>Cerrar Sesión</a></li>");
                    } 
                     %> 
 	</ul>
 </div>
     
     <table id="productos" border="1" width="700" align="center">            
            <tr>
                
                <td>ID</td>                
                <td>ID Producto</td>
                <td>Nombre Producto</td>
                <td>Precio</td>
                <td>Imagen</td>               
                <td>Operaciones</td>               
                
               
                
            </tr>            
         
            <div id='navegacion'>
                <%out.println("<li><a href='../AgregarCompra.do?idUsu="+hs.getAttribute("Nombre")+"'>CONFIRMAR COMPRA</a></li> ");%>
                <%out.println("<li><a href='../VaciarCarrito.do?idUsu="+hs.getAttribute("Nombre")+"'>VACIAR CARRITO</a></li> ");%>
            </div>
            
            
            
            <% for(CarritoCompra cr: CarritoCompra.listarProductos(hs.getAttribute("Nombre").toString())) { %>
            
              <tr>                 
                  
                  <td><%= cr.getId() %></td>
                  <td><%= cr.getIdprod() %></td>
                  <td><%= cr.getNombreprod() %></td>
                  <td><%= cr.getPrecio() %></td> 
                  <%  out.println("<td align='center'><img src='data:image/gif;base64,");
                         for (byte i : cr.getEncodedImage()) 
                                    {
                                        out.print((char) i);
                                    }  
                                    out.print("' width='250' height='150'/>");
                                    out.println("</td>");            
                                            
                       %>             
                       
                       <% 
                       out.println("<td><a href='../EliminarProducto.do?idprod="+cr.getId()+"'>Eliminar Producto</a></td>");
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


