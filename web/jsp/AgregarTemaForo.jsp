<%@page import="Modelo.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<% 
    HttpSession hs = request.getSession(false);
    String rut = request.getParameter("idUsu"); 
    Usuario aux = Usuario.buscarUsuario(rut);
    
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
 <title>TecnoPC | Crear Tema</title>
 <!-- Insertar aquí mas Metatags-->
</head>
<body >
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
 	</ul>
 </div>
 
 <div id="principal">
  	<div id="registro" align="right">
    <form action="../CrearTemaForo.do" name="formulario_registro" method="get">
        Titulo: <input type="text" id="titulo" name="titulo" size="85"> <br>
        Detalle: <textarea cols="50" rows="10" name="detalle"></textarea> <br>
        Id Grupo: <input readonly="readonly" type="text" id="titulo" name="idgrupo" value="<%= request.getParameter("idGrupo") %>"> <br>
        Rut: <input type="text" readonly="readonly" id="nomusu" name="rut" value="<%= aux.getRut() %>"> <br>
        Nombre Usuario: <input type="text" readonly="readonly" id="nomusu" name="nomusu" value="<%= aux.getNomusu() %>"> <br>
        Rol: <input type="text" readonly="readonly" id="rol" name="rol" value="<%= aux.getRol() %>"> <br>
   	         
        <br/>
        <br/>
        <input type="submit" value="Crear Tema"/>
    </form>
    </div>     
</div> <br>

<div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="contacto.jsp">Contacto</a> | <a href="quienessomos.jsp">¿Quienes Somos?</a>
</div>
 </div>
</body>
</html>
