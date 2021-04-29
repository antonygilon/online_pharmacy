<%-- 
    Document   : buymedicine
    Created on : 23-Mar-2020, 2:02:46 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Medicines"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.sql.Date"%>
<%@include file = "header.html"%>


<%
try
{

if(session.getAttribute("id")==null)
{
    response.sendRedirect("index.html");
}

else
{
    
    int user_id =(Integer)session.getAttribute("id");
    int mid = Integer.parseInt(request.getParameter("id"));
    Session ses = NewHibernateUtil.getSessionFactory().openSession();
    Transaction tx = ses.beginTransaction();
    String hql = "FROM Medicines m where m.mid=:a";
    Query query = ses.createQuery(hql);
    query.setParameter("a",mid);
    List medicines = query.list();
    Iterator it = medicines.iterator();
    Medicines m = (Medicines)it.next();

    
    %>
    <html>
    <head>
        <title>
            Happy shopping!
        </title>
    </head>
    <body>
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
<br>
    <table>
    <tr>
    <th>Medicine Name</th>
    <td><%=m.getMname()%></td>
    </tr>
    <tr>
    <th>Medicine Power</th>
    <td><%=m.getMpower()%>mg</td>
    </tr>
    <tr>
    <th>Medicine Category</th>
    <td><%=m.getCategory().getCname()%></td>
    </tr>
    <tr>
    <th>Medicine Description</th>
    <td><%=m.getMdesc()%></td>
    </tr>
    <tr>
    <th>Medicine Cost</th>
    <td><%=m.getMcost()%></td>
    </tr>
    <tr>
    <th>Medicine Availability</th>
    <td><%=m.getStock()%></td>
    </tr>
    <tr>
    <th>Manufacturing Date</th>
    <td><%=m.getMandate()%></td>
    </tr>
    <tr>
    <th>Expiry Date</th>
    <td><%=m.getExpdate()%></td>
    </tr>
  
</table>
     <center>
         <a href="cart.jsp?page=products&action=add&id=<%=mid %>" class="button">Add to cart</a>
        
        </center>

<%}
}catch(Exception e){out.println(e);}
%>