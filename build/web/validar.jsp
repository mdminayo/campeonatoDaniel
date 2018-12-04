<%-- 
    Author     : gemelos
--%>

<%@page import="clases.Usuario"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
String usuario=request.getParameter("usuario");
String clave=request.getParameter("clave");

Usuario datos=new Usuario("'"+usuario+"'","'"+clave+"'");

if (datos.getUsuario()!=null){
    
    HttpSession sesion=request.getSession();
    sesion.setAttribute("usuario", usuario);
    response.sendRedirect("principal.jsp");
}else{
    response.sendRedirect("index.jsp");
}

%>

