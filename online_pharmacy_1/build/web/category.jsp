<%-- 
    Document   : category
    Created on : 25-Apr-2020, 2:50:25 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Category"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
    if(request.getMethod()=="POST")
    {
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = ses.beginTransaction();
        String cat = request.getParameter("category");
        Category c = new Category(cat);
        ses.save(c);
        tx.commit();
        ses.close();
    }
    
else
    {
        %>
        <center>
            <br><br><br><br>
        <form method ="post" action ="#">
            <h1> Category: <input type ="text"  name="category"></h1><br>
            <input type ="submit" class="button" value ="Insert Categroy">
        </form>
   <% }

%>
