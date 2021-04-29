<%-- 
    Document   : cart
    Created on : 23-Mar-2020, 2:36:07 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Cart"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.pharmacy.Medicines"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*"%>
<%@ taglib uri = "http://java.sun.com/jsp/jstl/core" prefix = "c" %>
<%@include file = "header.html"%>
<style>
    table {
  border-collapse: collapse;
  width: 100%;
}

th, td {
  text-align: left;
  padding: 8px;
}

tr:nth-child(even){background-color: #f2f2f2}

th {
  background-color:#1E90FF;
  color: white;
}
    .button {
  background-color: #1E90FF;
  border: none;
  color: white;
  padding: 15px 32px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
</style>
<jsp:useBean id="mycart" scope="session" class="com.pharmacy.Cart"/>
<%

int flag = 0;


if(session.getAttribute("cart")==null)
{
    if(request.getParameter("action")!=null && request.getParameter("action").equals("add"))
    {
         int mid = Integer.parseInt(request.getParameter("id"));
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
         Transaction tx = ses.beginTransaction();
         String hql = "FROM Medicines m where m.mid=:a";
         Query query = ses.createQuery(hql);
         query.setParameter("a",mid);
         List medicines = query.list();
         Iterator it = medicines.iterator();
         Medicines m = (Medicines)it.next();
         mycart.addMedicine(m,1);
        session.setAttribute("cart",1);
        
       %>
         <center>
         <button class="button">Product has been added</button>
         <center>
         <%
    }
    
    else
    {
    %>
         <center>
         <button class="button">Shopping cart is empty</button>
         <center>
         <%
    }
    
}
else
{
     if(request.getParameter("action")!=null && request.getParameter("action").equals("add"))
    {
         int mid = Integer.parseInt(request.getParameter("id"));
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
         Transaction tx = ses.beginTransaction();
         String hql = "FROM Medicines m where m.mid=:a";
         Query query = ses.createQuery(hql);
         query.setParameter("a",mid);
         List medicines = query.list();
         Iterator it = medicines.iterator();
         Medicines m = (Medicines)it.next();
         mycart.addMedicine(m,1);
         session.setAttribute("cart",1);
         %>
         <center>
         <button class="button">Product has been added</button>
         <center>
         <%
         
    }
     
    else
     {
     ArrayList<Medicines> m = mycart.getMedicines();
     ArrayList<Integer> q = mycart.getQuantity();
     %>
     <br>
     <br>
      <table>
         <tr>
             <th>Medicine</th>
             <th>Quantity</th>
         </tr>
         <%
     for(int i=0;i<m.size();i++)
     {
         %>
         <tr>
         <td><%=m.get(i).getMname()%></td>
         <td><%=q.get(i)%></td>         
         </tr>
         
     <%}

%></table>
<center>
    <br>
<a href ="checkout.jsp" class="button">Click here to checkout</a>

<%
    
    
    
 }
}
%>


