<%-- 
    Document   : logout
    Created on : 23-Mar-2020, 6:30:27 PM
    Author     : Srinivas Raman
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%

session.invalidate();
response.sendRedirect("index.html");
%>