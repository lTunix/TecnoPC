
<% 
    HttpSession hs = request.getSession(false);
    

    if(hs == null || hs.getAttribute("Rol") == null){
    out.println("<h2>Error: No ha iniciado sesion.</h2>");
    out.println("</br>");
    out.println("<a href='../index.jsp'>");
    out.println("Volver al inicio</a>");
    return;
}

if (hs.getAttribute("Rol").equals("U") == true || hs.getAttribute("Rol").equals("E") == true){
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
 <title>TecnoPC | Publicar Producto</title>
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
     
           
            <div id="principal">
  	<div id="registro" align="right">
            <form method="post" action="../RegistrarProducto.do" enctype="multipart/form-data">
            <table border="0">
                <tr>
                    <td>Nombre: </td>
                    <td><input type="text" name="nombre" size="50"/></td>
                </tr>
                <tr>
                    <td>Precio: </td>
                    <td><input type="text" name="precio" size="50"/></td>
                </tr>
                <tr>
                    <td>Stock: </td>
                    <td><input type="text" name="stock" size="50"/></td>
                </tr>
                <tr>
                    <td>Imagen: </td>
                    <td><input type="file" name="imagen" size="50"/></td>
                </tr>
                <tr>
                    <td colspan="2">
                        <input type="submit" value="Registrar Producto">
                    </td>
                </tr>
            </table>
        </form>
    </div>     
</div> <br>
            
     
 
 <div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="../jsp/contacto.jsp">Contacto</a> | <a href="../jsp/quienessomos.jsp">¿Quienes Somos?</a>
 </div>
 </div>
</body>
</html>
