<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Partido"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    Partido partido= new Partido();
    partido.setFecha(request.getParameter("fecha"));
    partido.setHora(request.getParameter("hora"));
    partido.setLugar(request.getParameter("lugar"));
    partido.setCodElocal(request.getParameter("elocal"));
    partido.setCodEvisitante(request.getParameter("evisitante"));
    partido.setGlocal(request.getParameter("glocal"));
    partido.setGvisitante(request.getParameter("gvisitante"));
    
    String local=request.getParameter("elocal");
    String visitante=request.getParameter("evisitante");
    
    if (local.equals(visitante)){
        
        out.print("Equipo local y visitante deben ser diferentes");
            
        } else {
         partido.grabar();
    
        }
    
    response.sendRedirect("principal.jsp");
   /*
    out.print(request.getParameter("elocal")+"<br>");
    out.print(request.getParameter("evisitante")+"<br>");
    out.print(request.getParameter("glocal")+"<br>");
    out.print(request.getParameter("gvisitante"));*/
   

 %>