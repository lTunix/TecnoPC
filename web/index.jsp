<%@page import="Modelo.Producto"%>
<% 
    HttpSession hs = request.getSession(false);
    hs.setAttribute("rut", hs.getAttribute("Nombre"));
%>
<!DOCTYPE html> 
<html lang="es">
<head>
 <meta charset="utf-8" />
 <link rel="icon" type="image/png" href="imagenes/phpThumb_generated_thumbnailico.ico" />
 <link href="css/Diseno-web.css" rel="stylesheet" type="text/css">
 <title>TecnoPC | Inicio</title>
</head>
<body>
 <div id="global">
 <a href="Inicio.html"><div id="cabecera">
 </div></a>
 <div id="navegacion">
	 <ul>
 		<li><a href="index.jsp">Inicio</a></li>
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
                        out.println("<li><a href='jsp/ForoGrupos.jsp'>Foro</a></li>");
                        out.println("<li><a href='jsp/CarritoCompra.jsp'>Carrito de Compra</a></li>");                        
                        out.println("<li><a href='Vendedor/AdministrarCompras.jsp?rut="+hs.getAttribute("rut")+"'>Ver estado de las Compras</a></li>");
                    } 
                     %> 
                    
                    <% 
                    if(hs != null && hs.getAttribute("Usuario")== null){ 
                        
                    }else if(hs.getAttribute("Rol").equals("A")){
                        out.println("<li><a href='admin/AdministrarUsuarios.jsp'>Administrar Usuarios</a></li>");
                        out.println("<li><a href='Vendedor/AdministrarCompras.jsp?rut="+hs.getAttribute("rut")+"'>Administrar Compras</a></li>");
                        out.println("<li><a href='Vendedor/PublicarProducto.jsp'>Publicar Producto</a></li>");
                    }else if(hs.getAttribute("Rol").equals("V")){
                        out.println("<li><a href='Vendedor/AdministrarCompras.jsp?rut="+hs.getAttribute("rut")+"'>Administrar Compras</a></li>"); 
                        out.println("<li><a href='Vendedor/PublicarProducto.jsp'>Publicar Producto</a></li>"); 
                    }
                     %> 
                    
 		<li><% 
                    if(hs == null || hs.getAttribute("Usuario")== null){ 
                        out.println("<a href='jsp/registro.jsp'>Registro</a>");
                    }else{
                        out.println("<a href='CerrarSesion.do'>Cerrar Sesión</a>");
                    } 
                     %> </li>
                
                
 	</ul>
 </div>
     
     <table id="productos" border="1" width="700" align="center">            
            <tr>
                
                <td>ID</td>
                <td>Nombre</td>
                <td>Precio</td>
                <td>Stock</td>
                <td>Imagen</td>
                <% 
                        

                    if(hs != null && hs.getAttribute("Usuario")!= null){                        
                        out.println("<td>Operaciones</td>");                      
                        
                    }
                    %>  
                
            </tr>            
            
            <div id="navegacion"> Productos Recientes </div> 
            
            <% for(Producto p: Producto.listarProductos()) { %>
            
              <tr>                 
                  
                  <td><%=p.getId()%></td>
                  <td><%=p.getNombre() %></td>
                  <td><%=p.getPrecio() %></td>                
                  <td><%=p.getStock() %></td>
                  <% 
                                    out.println("<td align='center'><img src='data:image/gif;base64,");
                                    for (byte i : p.getEncodedImage()) 
                                    {
                                        out.print((char) i);
                                    }  
                                    out.print("' width='250' height='150'/>");
                                    out.println("</td>");
                  %>
                  
                  
                     <%                       
                         
                    if(hs.getAttribute("Rol") == null){ 
                        
                       
                    }else if (hs.getAttribute("Rol").equals("A") || hs.getAttribute("Rol").equals("E")){
                            String rut = hs.getAttribute("Nombre").toString();
                           out.println("<td><a href='AgregarProductoCarritoCompra.do?idprod="+p.getId()+"&idUsu="+rut+"'><img width='30' height='30' src='imagenes/añadircompra.png'></a>");        
                            out.println("<a href='Editor/ModificarProducto.jsp?idprod="+p.getId()+"'><img width='30' height='30' src='imagenes/modificarcompra.png'></a>");
                            out.println("<a href='EliminarProductoCatalogo.do?idprod="+p.getId()+"'><img width='30' height='30' src='imagenes/eliminar2.png'></a></td>");
                    }else if (hs.getAttribute("Rol").equals("U") || hs.getAttribute("Rol").equals("V")){
                            String rut = hs.getAttribute("Nombre").toString();
                           out.println("<td><a href='AgregarProductoCarritoCompra.do?idprod="+p.getId()+"&idUsu="+rut+"'><img width='30' height='30' src='imagenes/añadircompra.png'></a>");
                    }
                    %>     
                    
                      
                     
                  
            </tr>                 
           <% } %>
           
             </table>
     
 
 <div id="pie">
Copyright © TecnoPC.cl 2017 | <a href="jsp/contacto.jsp">Contacto</a> | <a href="jsp/quienessomos.jsp">¿Quienes Somos?</a>
 </div>
 </div>
</body>
</html>
