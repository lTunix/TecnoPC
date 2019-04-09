
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="es">
<head>
 <meta charset="utf-8" />
 <link rel="icon" type="image/png" href="../imagenes/phpThumb_generated_thumbnailico.ico" />
 <link href="../css/Diseno-web.css" rel="stylesheet" type="text/css">
 <title>TecnoPC | Login</title>
 <!-- Insertar aquí mas Metatags-->
</head>
<body >
 <div id="global">
 <a href="Inicio.html"><div id="cabecera">
 </div></a>
 <div id="navegacion">
	 <ul>
 		<li><a href="../index.jsp">Inicio</a></li>
	 	<li><a href="login.jsp">Login</a></li>
 		<li><a href="registro.jsp">Registro</a></li>
 	</ul>
 </div>
 <div id="principal">
 	<div id="login" align="right">
    <form action="../ValidarUsuario.do" name="formulario_registro" method="post">
 Rut: <input type="text" id="rut" name="rut"> <br>
 Contraseña: <input type="password" id="clave" name="clave"> <br>
 Rol:    <select name="rol">
            
                <option name="rol" value="A">Administrador</option>
                <option name="rol" value="E">Editor</option>
                <option name="rol" value="U">Usuario</option>
                <option name="rol" value="V">Vendedor</option>
                
                </select><br>
 <input type="submit" value="Entrar"> 
 	</form>
 </div><br>
</div> 
<div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="contacto.jsp">Contacto</a> | <a href="quienessomos.jsp">¿Quienes Somos?</a>
</div>
 </div>
</body>
</html>
