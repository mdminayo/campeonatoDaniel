<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    
   
   /* String lista="";
    
    for (int i = 0; i < 10; i++) {
        
        lista+="<tr>";
            //out.print(" "+datos[i][0]);
            lista+="<td>"+datos[i][0]+"</td>";
            lista+="<td>"+datos[i][1]+"</td>";
            lista+="<td>"+datos[i][2]+"</td>";
            lista+="<td>"+datos[i][3]+"</td>";
            lista+="<td>"+datos[i][4]+"</td>";
            lista+="<td>"+datos[i][5]+"</td>";
            lista+="<td>"+datos[i][6]+"</td>";
            lista+="<td>"+datos[i][7]+"</td>";
            lista+="<td>"+datos[i][8]+"</td>";
            lista+="<td>"+datos[i][9]+"</td>";
        lista+="</tr>";
            
        }*/


    %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <div class="container">
        <h1>Tabla de posiciones!</h1>
         <table class="table table-bordered table-dark">
            <tr>
                <th>codEquipo</th>
                <th>Equipo</th>
                <th>Total puntos</th>
                <th>Partidos jugados</th>
                <th>Partidos ganados</th>
                <th>Partidos perdidos</th>
                <th>Partidos empatados</th>
                <th>Goles a favor</th>
                <th>Goles en contra</th>
                <th>Diferencia de goles</th>
                
            </tr>
            
            <%
                String datos [][]= Partido.tablaDePosiciones();
    
                for (int i = 0; i < 10; i++) {
                %>
                
                <tr>
                    <td><%=datos[i][0]%></td>
                    <td><%=datos[i][1]%></td>
                    <td><%=datos[i][2]%></td>
                    <td><%=datos[i][3]%></td>
                    <td><%=datos[i][4]%></td>
                    <td><%=datos[i][5]%></td>
                    <td><%=datos[i][6]%></td>
                    <td><%=datos[i][7]%></td>
                    <td><%=datos[i][8]%></td>
                    <td><%=datos[i][9]%></td>
                </tr>
                
                <%
                   }
                    %>
           
            
        </table>
        </div>
        
    </body>
</html>
