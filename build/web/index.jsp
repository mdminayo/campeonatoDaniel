<%-- 
    Author     : gemelos
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
         <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body style="background-image: url(presentacion/imagenes/585858.jpg) ">
        
        <div aling="center">
            <div class="container">
        
        <center>
            <h1>INICIO SESION</h1>
        <form method="post" action="validar.jsp" name="login">
        <table >
            <tr>
                
                <td>
                    <label>USUARIO</label>
                    <input type="text" name="usuario" id="usuario" class="form-control">
                </td>
            </tr>
            <tr>
                <td>
                    <label>CLAVE</label>
                    <input type="password" name="clave" id="clave" class="form-control">
                </td>
            </tr>
            <tr>
                <td><input type="submit" name="enviar" class="btn btn-primary"></td>
                

            </tr>
        </table>
            
        </form>
        </center>
            </div>
           </div>
    </body>
</html>
