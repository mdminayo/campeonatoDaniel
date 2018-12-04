<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Equipo"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    
Equipo equipo=new Equipo();
equipo.setNombre(request.getParameter("equipo"));
equipo.grabar();

response.sendRedirect("principal.jsp?CONTENIDO=equipos.jsp");
    

%>
