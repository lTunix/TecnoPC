<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html> 
<html lang="es">
<head>
 <meta charset="utf-8" />
 <link rel="icon" type="image/png" href="../imagenes/phpThumb_generated_thumbnailico.ico" />
 <link href="../css/Diseno-web.css" rel="stylesheet" type="text/css">
 <title>TecnoPC | Registro</title>
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
  	<div id="registro" align="right">
    <form action="../RegistrarUsuario.do" name="formulario_registro" method="get">
   	Rut: <input type="text" id="rut" name="rut"> <br>
   	Nombre Usuario: <input type="text" id="nombreUsu" name="nombreUsu"> <br>
    	Nombre: <input type="text" id="nombre" name="nombre"> <br>
        Apellido: <input type="text" id="apellido" name="apellido"> <br>
        Correo: <input type="text" id="correo" name="correo"> <br>        
        Telefono: <input type="text" id="telefono" name="telefono"> <br>        
        Contraseña: <input type="password" id="clave" name="clave"> <br> <br/>
        Sexo:
        <input type="radio" name="sexo" id="hombre" value="H">
                            <label for="hombre">Hombre</label>
                            <input type="radio" name="sexo" id="mujer" value="M">
                            <label for="mujer">Mujer</label> <br/>
        Fecha nacimiento: 
        Dia:  <select name="dia" >
             <option value="">Seleccione</option>
                <option name="dia" value="1">1</option>
                <option name="dia" value="2">2</option>
                <option name="dia" value="3">3</option>
                <option name="dia" value="4">4</option>
                <option name="dia" value="5">5</option>
                <option name="dia" value="6">6</option>
                <option name="dia" value="7">7</option>
                <option name="dia" value="8">8</option>
                <option name="dia" value="9">9</option>
                <option name="dia" value="10">10</option>
                <option name="dia" value="11">11</option>
                <option name="dia" value="12">12</option>
                <option name="dia" value="13">13</option>
                <option name="dia" value="14">14</option>
                <option name="dia" value="15">15</option>
                <option name="dia" value="16">16</option>
                <option name="dia" value="17">17</option>
                <option name="dia" value="18">18</option>
                <option name="dia" value="19">19</option>
                <option name="dia" value="10">20</option>
                <option name="dia" value="21">21</option>
                <option name="dia" value="22">22</option>
                <option name="dia" value="23">23</option>
                <option name="dia" value="24">24</option>
                <option name="dia" value="25">25</option>
                <option name="dia" value="26">26</option>
                <option name="dia" value="27">27</option>
                <option name="dia" value="28">28</option>
                <option name="dia" value="29">29</option>
                <option name="dia" value="30">30</option>
                <option name="dia" value="31">31</option>
              </select> 
        Mes:  <select name="mes">
             <option value="">Seleccione</option>
                <option name="mes" value="1">1</option>
                <option name="mes" value="2">2</option>
                <option name="mes" value="3">3</option>
                <option name="mes" value="4">4</option>
                <option name="mes" value="5">5</option>
                <option name="mes" value="6">6</option>
                <option name="mes" value="7">7</option>
                <option name="mes" value="8">8</option>
                <option name="mes" value="9">9</option>
                <option name="mes" value="10">10</option>
                <option name="mes" value="11">11</option>
                <option name="mes" value="12">12</option>
        </select>
        
        Año:  <select name="año">
            
                <option value="">Seleccione</option>
                <option name="año" value="2013">2013</option>
    <option name="año" value="2012">2012</option>
    <option name="año" value="2011">2011</option>
    <option name="año" value="2010">2010</option>
    <option name="año" value="2009">2009</option>
    <option name="año" value="2008">2008</option>
    <option name="año" value="2007">2007</option>
    <option name="año" value="2006">2006</option>
    <option name="año" value="2005">2005</option>
    <option name="año" value="2004">2004</option>
    <option name="año" value="2003">2003</option>
    <option name="año" value="2002">2002</option>
    <option name="año" value="2001">2001</option>
    <option name="año" value="2000">2000</option>
    <option name="año" value="1999">1999</option>
    <option name="año" value="1998">1998</option>
    <option name="año" value="1997">1997</option>
    <option name="año" value="1996">1996</option>
    <option name="año" value="1995">1995</option>
    <option name="año" value="1994">1994</option>
    <option name="año" value="1993">1993</option>
    <option name="año" value="1992">1992</option>
    <option name="año" value="1991">1991</option>
    <option name="año" value="1990">1990</option>
    <option name="año" value="1989">1989</option>
    <option name="año" value="1988">1988</option>
    <option name="año" value="1987">1987</option>
    <option name="año" value="1986">1986</option>
    <option name="año" value="1985">1985</option>
    <option name="año" value="1984">1984</option>
    <option name="año" value="1983">1983</option>
    <option name="año" value="1982">1982</option>
    <option name="año" value="1981">1981</option>
    <option name="año" value="1980">1980</option>
    <option name="año" value="1979">1979</option>
    <option name="año" value="1978">1978</option>
    <option name="año" value="1977">1977</option>
    <option name="año" value="1976">1976</option>
    <option name="año" value="1975">1975</option>
    <option name="año" value="1974">1974</option>
    <option name="año" value="1973">1973</option>
    <option name="año" value="1972">1972</option>
    <option name="año" value="1971">1971</option>
    <option name="año" value="1970">1970</option>
    <option name="año" value="1969">1969</option>
    <option name="año" value="1968">1968</option>
    <option name="año" value="1967">1967</option>
    <option name="año" value="1966">1966</option>
    <option name="año" value="1965">1965</option>
    <option name="año" value="1964">1964</option>
    <option name="año" value="1963">1963</option>
    <option name="año" value="1962">1962</option>
    <option name="año" value="1961">1961</option>
    <option name="año" value="1960">1960</option>
    <option name="año" value="1959">1959</option>
    <option name="año" value="1958">1958</option>
    <option name="año" value="1957">1957</option>
    <option name="año" value="1956">1956</option>
    <option name="año" value="1955">1955</option>
    <option name="año" value="1954">1954</option>
    <option name="año" value="1953">1953</option>
    <option name="año" value="1952">1952</option>
    <option name="año" value="1951">1951</option>
    <option name="año" value="1950">1950</option>
    <option name="año" value="1949">1949</option>
    <option name="año" value="1948">1948</option>
    <option name="año" value="1947">1947</option>
    <option name="año" value="1946">1946</option>
    <option name="año" value="1945">1945</option>
    <option name="año" value="1944">1944</option>
    <option name="año" value="1943">1943</option>
    <option name="año" value="1942">1942</option>
    <option name="año" value="1941">1941</option>
    <option name="año" value="1940">1940</option>
    <option name="año" value="1939">1939</option>
    <option name="año" value="1938">1938</option>
    <option name="año" value="1937">1937</option>
    <option name="año" value="1936">1936</option>
    <option name="año" value="1935">1935</option>
    <option name="año" value="1934">1934</option>
    <option name="año" value="1933">1933</option>
    <option name="año" value="1932">1932</option>
    <option name="año" value="1931">1931</option>
    <option name="año" value="1930">1930</option>
    <option name="año" value="1929">1929</option>
    <option name="año" value="1928">1928</option>
    <option name="año" value="1927">1927</option>
    <option name="año" value="1926">1926</option>
    <option name="año" value="1925">1925</option>
    <option name="año" value="1924">1924</option>
    <option name="año" value="1923">1923</option>
    <option name="año" value="1922">1922</option>
    <option name="año" value="1921">1921</option>
    <option name="año" value="1920">1920</option>
    <option name="año" value="1919">1919</option>
    <option name="año" value="1918">1918</option>
    <option name="año" value="1917">1917</option>
    <option name="año" value="1916">1916</option>
    <option name="año" value="1915">1915</option>
    <option name="año" value="1914">1914</option>
    <option name="año" value="1913">1913</option>
    <option name="año" value="1912">1912</option>
    <option name="año" value="1911">1911</option>
    <option name="año" value="1910">1910</option>
    <option name="año" value="1909">1909</option>
    <option name="año" value="1908">1908</option>
    <option name="año" value="1907">1907</option>
    <option name="año" value="1906">1906</option>
    <option name="año" value="1905">1905</option>
        </select>
                            <br/>
         País: <input type="text" id="pais" name="pais"> <br>
        </select>   <br/>
        Ciudad: <input type="text" id="ciudad" name="ciudad"> <br>
        Comuna: <input type="text" id="comuna" name="comuna"> <br>
        Rol:    <select name="rol">
            
                <option name="rol" value="A">Administrador</option>
                <option name="rol" value="E">Editor</option>
                <option name="rol" value="U">Usuario</option>
                <option name="rol" value="V">Vendedor</option>
                
                </select>
                            
        <br/>
        <br/>
        <input type="submit" value="Registrar"/>
    </form>
    </div>     
</div> <br>

<div id="pie">
    Copyright © TecnoPC.cl 2017 | <a href="contacto.jsp">Contacto</a> | <a href="quienessomos.jsp">¿Quienes Somos?</a>
</div>
 </div>
</body>
</html>