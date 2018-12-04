<%-- 
    Author     : gemelos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Registrate!</h1>
        
        <form action="registrarUsuario.jsp" method="post">
            <table>
                <tr>
                    <td>Usuario</td>
                    <td><input type="text" name="usuario"/></td>
                </tr>
                <tr>
                    <td>Contraseña</td>
                    <td><input type="password" name="clave"/></td>
                </tr>
                <tr>
                    <td>Rol</td>
                    <td>
                        <select name="rol" id="rol" required="true">
                        <option value="-1">Seleccione</option>
                        <option value="A">Administrador</option>
                        <option value="U">Usuario</option>
                        </select>
                    </td>
                </tr>
                <tr>
                    <td>Foto</td>
                    <td><input type="file" name="foto"/></td>
                </tr>
                 <tr>
                        
                    <td><input type="submit"></td>
                </tr>
            </table>
            
            
        </form>
        
        
    </body>
</html>
