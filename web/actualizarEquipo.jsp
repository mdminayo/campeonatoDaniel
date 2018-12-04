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
        <div class="container">
        <h1>Adicionar Equipo!</h1>
        
        <form method="post" action="grabarEquipo.jsp" >
            <table class="table table-bordered table-dark">
                <tr>
                    <td>Nombre</td><td><input type="text" name="equipo" class="form-control"></td>
                    <td><input type="submit" value="grabar" class="btn-primary"></td>
                    
                </tr>
            </table>
                
            
        </form>
        </div>
    </body>
</html>
