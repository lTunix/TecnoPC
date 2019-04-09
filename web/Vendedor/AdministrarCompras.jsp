<%@page import="Modelo.Compra"%>
<% 
    HttpSession hs = request.getSession(false);
    String rut = request.getParameter("rut");    
    Compra aux = Compra.CalcularPrecio(rut);
    
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
 <title>TecnoPC | Aministrar Compras</title>
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
     
           
            <% if(hs.getAttribute("Rol").equals("A") ||hs.getAttribute("Rol").equals("V")) { %>
            <div id="navegacion"> Buscar Compra del Usuario: 
                <form method="get" action="../BuscarCompra.do">
                <select name="rutcomprador">
                   <% for(Compra u: Compra.listarUsuarios()) { %>
                   <option value=<%= u.getRutcomprador() %> > <%= u.getRutcomprador() %>  </option>
                   <% } %>
                </select> 
                <input type="submit" value="Buscar"/>
                </form>
            </div> 
                   
                
            
                <div id='navegacion'>
                    <%out.println("<li><a href='../AprobarCompra.do?idUsu="+hs.getAttribute("Nombre")+"&idUsu2="+hs.getAttribute("rut")+"'>APROBAR TODAS LAS COMPRAS</a></li> ");%>                
                <%out.println("<li><a href='../DesaprobarCompra.do?idUsu="+hs.getAttribute("Nombre")+"&idUsu2="+hs.getAttribute("rut")+"'>DESAPROBAR TODAS LAS COMPRAS</a></li> ");%>                
                </div>
                
                <% } %>
                
                <div id="navegacion"> Precio Total de las compras aprobadas para 
                   
                   
                   <%= aux.getRutcomprador() %>
                    
                   
                   : $ <%= aux.getTotal() %>  </div>           
                                  
                
               
            
            
                
           <% if(hs.getAttribute("rut") != null) { %>    
            <table id="productos" border="1" width="700" align="center">            
            <tr>
                
                <td>ID</td>      
                <td>Rut Vendedor</td> 
                <td>Rut Comprador</td> 
                <td>ID Producto</td>
                <td>Nombre Producto</td>
                <td>Precio</td>
                <td>Imagen</td>               
                <td>Fecha Creacion</td>               
                <td>Estado</td>   
                
                <% if(hs.getAttribute("Rol").equals("A") ||hs.getAttribute("Rol").equals("V")) { %>
                <td>Operaciones</td>               
                <% } %>               
                
               
                
            </tr>  
            <% for(Compra c: Compra.listarProductos(hs.getAttribute("rut").toString())) { %>
            
              <tr>                 
                  
                  <td><%= c.getId() %></td>
                  <td><%  if(c.getRutvendedor() == null) { out.print("No asignado"); 
                  }else{ out.print(c.getRutvendedor()); }%></td>
                  <td><%= c.getRutcomprador() %></td>
                  <td><%= c.getIdprod() %></td>
                  <td><%= c.getNombreprod() %></td>
                  <td><%= c.getPrecio() %></td> 
                  <%  out.println("<td align='center'><img src='data:image/gif;base64,");
                         for (byte i : c.getEncodedImage()) 
                                    {
                                        out.print((char) i);
                                    }  
                                    out.print("' width='250' height='150'/>");
                                    out.println("</td>");            
                                            
                       %>             
                   <td><%= c.getFechacreacion() %></td> 
                   <% if(c.getEstado() == null ) { out.print("<td> <img width='30' height='30' src='../imagenes/espera.png'> </td>");  
                   }else if (c.getEstado().equals("S") ){ out.print("<td> <img width='30' height='30' src='../imagenes/aprobado.png'> </td> "); 
                    }else if (c.getEstado().equals("N") ) { out.print("<td> <img width='30' height='30' src='../imagenes/noaprobado.png'> </td> "); } %>
                      
                    <% if(hs.getAttribute("Rol").equals("A") ||hs.getAttribute("Rol").equals("V")) { out.print("<td> <a href='../AprobarCompraPorsiSola.do?idCompra="+c.getId()+"&idUsu="+hs.getAttribute("Nombre")+"&idUsu2="+hs.getAttribute("rut")+"'> <img width='30' height='30' src='../imagenes/aprobado.png' /> </a> "
                            + "                                                                                  <a href='../DesaprobarCompraPorsiSola.do?idCompra="+c.getId()+"&idUsu="+hs.getAttribute("Nombre")+"&idUsu2="+hs.getAttribute("rut")+"'> <img width='30' height='30' src='../imagenes/noaprobado.png' /> </a> </td>"); }%>  
                   
            </tr>                 
           <% } %>
           
             </table>
            
           <% } %>
     
 
 <div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="../jsp/contacto.jsp">Contacto</a> | <a href="../jsp/quienessomos.jsp">¿Quienes Somos?</a>
 </div>
 </div>
</body>
</html>
