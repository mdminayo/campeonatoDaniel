<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    String vinculos="";
    if(request.getParameter("tipo")!=null){
        if (!request.getParameter("tipo").equals("pdf")) {
            
            String tipo=request.getParameter("tipo");
            String extension="xls";
           
                response.setContentType("application/vnd.ms-"+tipo);
                response.setHeader("Content-Disposition","inline;filename=reporte."+extension);
            }
        
    
    }else{
        vinculos="<a href='resultados.jsp?tipo=excel'>Exportar a excel </a>";
        vinculos+="<a href='#' onClick='convertir()'>  PDF</a>";
    }
    
    
    Partido [] datos=Partido.getDatosEnObjetos();
    String lista="";
    for (int i = 0; i < datos.length; i++) {
           Partido partido=datos[i];
           lista+="<tr>";
                lista+="<td>"+partido.getFecha()+"</td>";
                lista+="<td>"+partido.getHora()+"</td>";
                lista+="<td>"+partido.getLugar()+"</td>";
                lista+="<td>"+partido.getLolcal()+"</td>";
                lista+="<td>"+partido.getGlocal()+"</td>";
                lista+="<td>"+partido.getPuntoslocal()+"</td>";
                lista+="<td>"+partido.getVisitante()+"</td>";
                lista+="<td>"+partido.getGvisitante()+"</td>";
                lista+="<td>"+partido.getPuntosvisitante()+"</td>";
           lista+="</tr>";
            
        }
    
%>


    
       
        <script type="text/javascript" src="/lib/jquery-3.3.1.min.js"></script>
        <script type="text/javascript" src="/lib/jspdf.js"></script>
        <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
        <center>
            <div class="container">
        <div id="HTMLtoPDF">
        <h1>Resultados!</h1>
        <div id="vinculos"> <%= vinculos %> </div>
        <table class="table table-bordered table-dark">
            <tr>
                <th>Fecha</th>
                <th>Hora</th>
                <th>Lugar</th>
                <th>Equipo local</th>
                <th>Goles local</th>
                <th>Puntos local</th>
                <th>Equipo Visitante</th>
                <th>Goles Visitante</th>
                <th>Puntos Visitante</th>
            </tr>
            <%=lista%>
            
        </table>
  
        </div>
            </div>
            <!-- Div contenedor de la grafica  -->    
    <div id="piechart" style="width: 900px; height: 500px;"></div>
        </center>

    <script type="text/javascript">
            
            function convertir(){
                document.getElementById("vinculos").innerHTML="";
                HTMLtoPDF();
                document.getElementById("vinculos").innerHTML="<%= vinculos %>";
            }
            
         
        </script>
        
    <script type="text/javascript">
      google.charts.load('current', {'packages':['corechart']});
      google.charts.setOnLoadCallback(drawChart);

      function drawChart() {

        var data = google.visualization.arrayToDataTable([
          
           ['Nombre del equipo', 'Goles'],
            <% 
                for (int i = 0; i < datos.length; i++) {
                    if (i>0) {
                        out.print(",");
                    }
                    out.print("['" +datos[i].getLolcal()+ "', "+datos[i].getGlocal()+"]");
                }
              
            %>
                        
                        
          
        ]);

        var options = {
          title: 'Grafica de partidos con mas goles'
        };

        var chart = new google.visualization.PieChart(document.getElementById('piechart'));

        chart.draw(data, options);
      }
    </script>