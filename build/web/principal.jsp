<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
  <% 
            HttpSession sesion=request.getSession();
            Usuario user=new Usuario(sesion.getAttribute("usuario").toString());
       
   %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <script src="lib/amcharts/amcharts.js" type="text/javascript"></script>
        <script src="lib/amcharts/serial.js" type="text/javascript"></script>
        <script src="lib/amcharts/pie.js" type="text/javascript"></script>
        <script src="lib/funciones.js" type="text/javascript"></script>
        <script type="text/javascript" src="lib/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="lib/jspdf.js"></script>
        <script type="text/javascript" src="lib/pdfFromHTML.js"></script>
        <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.1.3/css/bootstrap.min.css" integrity="sha384-MCw98/SFnGE8fJT3GXwEOngsV7Zt27NXFoaoApmYm81iuXoPkFOJwJ8ERdknLPMO" crossorigin="anonymous">
        <title>JSP Page</title>
    </head>
    <body style="background-image: url(presentacion/imagenes/585858.jpg) ">
    <center>
        <div class="container">
        <h1>BIENVENIDA</h1>
            <a href="principal.jsp?CONTENIDO=equipos.jsp">Equipos</a>
            <a href="principal.jsp?CONTENIDO=partido.jsp">Registrar Partidos</a>
            <a href="principal.jsp?CONTENIDO=resultados.jsp">Resultados</a>
            <a href="principal.jsp?CONTENIDO=tablaposiciones.jsp">Tabla de posiciones</a>
            <a href="index.jsp">Salir</a>
            
        <div class="Contenido"><jsp:include page="<%=request.getParameter("CONTENIDO")%>" flush="true"/></div>
    </div>
    </center>
        
    </body>

</html>
