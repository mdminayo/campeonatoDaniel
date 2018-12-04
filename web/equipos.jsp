<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Equipo[] datos=Equipo.getDatosEnObjetos(null);
    String lista="";
    for (int i = 0; i < datos.length; i++) {
        Equipo equipo=datos[i];
        lista+="<tr>";
         lista+="<td>"+equipo.getCodigo()+"</td>";
         lista+="<td>"+equipo.getNombre()+"</td>";
                    
        lista+="</tr>";
            
        }
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Partidos</title>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    </head>
    <body>
        <div class="container">
        <h1> Equipos!</h1>
        <table class="table table-bordered table-dark">
            <tr>
                <th>Codigo</th>
                <th>Nombre</th>
                <th><a href="principal.jsp?CONTENIDO=actualizarEquipo.jsp">Adicionar</a></th>
            </tr>
            <%=lista%>
        </table>
        </div>
        
        
    
       
        
    <!-- Div contenedor de la grafica  -->    
    <div id="piechart" style="width: 900px; height: 500px;"></div>
  
    </body>
    
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          
           ['Nombre del equipo', 'Puntos ganados'],
            <% 
                for (int i = 0; i < datos.length; i++) {
                    if (i>0) {
                        out.print(",");
                    }
                    out.print("['" +datos[i].getNombre()+ "', "+datos[i].getCodigo()+"]");
                }
              
            %>
                        
                        
          
        ]);

        var options = {
          title: 'Grafica de partidos con mas puntos'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>
    
    
</html>
