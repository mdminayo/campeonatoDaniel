<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<%
    Equipo[] datos = Equipo.getDatosEnObjetos(null);
    
    
 %>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Partidos!</h1>
        <div>
            <form action="grabarPartido.jsp" method="post">
                <table class="table table-bordered table-dark">
                    <tr>
                        <td>Fecha</td>
                        <td><input type="date" name="fecha" class="form-control" id="fecha"/></td>
                    </tr>
                    <tr>
                        <td>Hora</td>
                        <td><input type="time" name="hora" class="form-control" id="hora"/></td>
                    </tr>
                     <tr>
                        <td>Lugar</td>
                        <td><input type="text" name="lugar" class="form-control" id="lugar"/></td>
                    </tr>
                    <tr>
                        <td>Equipo Local</td>
                        <td><select name="elocal" id="elocal" required="true" class="form-control"> 
                                <option value="-1">Seleccione</option>
                            <%
                                for (int i = 0; i < datos.length; i++) {
                                       Equipo equipo=datos[i];
                                       %>
                                       <option value="<%=equipo.getCodigo()%>"><%=equipo.getNombre()%></option>;
                                        <%
                                    }
                                %>
                            
                            
                            
                            </select></td>
                    </tr>
                    <tr>
                        <td>Equipo Visitante</td>
                        <td><select name="evisitante" id="evisitante" required="true" class="form-control">
                                <option value="-1">Seleccione</option>
                            <%
                                for (int i = 0; i < datos.length; i++) {
                                       Equipo equipo=datos[i];
                                       %>
                                       <option value="<%=equipo.getCodigo()%>"><%=equipo.getNombre()%></option>;
                                        <%
                                    }
                                %>
                            </select></td>
                    </tr>
                    <tr>
                        <td>Goles local</td>
                        <td><input type="number" name="glocal" class="form-control" id="glocal"/></td>
                    </tr>
                    <tr>
                        <td>Goles Visitante</td>
                        <td><input type="number" name="gvisitante" class="form-control" id="gvisitante"/></td>
                    </tr>
                    <tr>
                        
                        <td><input type="submit" class="btn-primary"></td>
                    </tr>
                </table>
                
            </form>
        </div>
        
    </body>
</html>
