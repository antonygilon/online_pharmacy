<%-- 
    Document   : index
    Created on : 23-Mar-2020, 1:00:32 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Medicines"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import = "java.util.*"%>
<%@page import = "java.sql.*"%>
<%@include file = "header.html"%>

<style>
   
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

<%
try
{

if(session.getAttribute("id")==null)
{
    response.sendRedirect("index.html");
}

else
{
    int id = (Integer)session.getAttribute("id");
    int level = (Integer)session.getAttribute("userlevel");

    %>
    <html>
    <head>
        <title>
            Welcome to Medfast  
        </title>
    </head>
    <body>

    <%
      if(level==1)
        {
            %>
            <br><br>
                    <center>
            <a href='category.jsp' class="button">Add new Medicine category</a><br>
            <a href='medicine.jsp' class="button">Insert New Stock</a><br>
            <a href='medicineupdate.jsp' class="button">Update Existing Stock</a><br>
            
                    <%
            
        }

        else
        {
            %>
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
  background-color: #1E90FF;
  color: white;
}
</style>
<br>
            <table>
            <tr>
                <th>Medicine Name</th>
                <th>Availability</th>
                <th>Cost</th>
            <%
                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                Transaction tx = ses.beginTransaction();
                String hql = "FROM Medicines";
                Query query = ses.createQuery(hql);
                List medicines = query.list();
                Iterator it = medicines.iterator();
                %>
            

                <%
                while(it.hasNext())
                {
                    Medicines m = (Medicines)it.next();
                    %>
            <tr>
                    <td><a href="buymedicine.jsp?id=<%=m.getMid()%>"><%=m.getMname()%></td></option>
                    <td><%=m.getStock()%></td>
                    <td><%=m.getMcost()%></td>
                </tr>
                    
                    <%
                        
                    
                    
                    
                }
                
                
               
                %></table><%

        }
}


}catch(Exception e){out.println(e);}
%>
