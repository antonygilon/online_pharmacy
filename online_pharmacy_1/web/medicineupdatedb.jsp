<%-- 
    Document   : medicineupdatedb
    Created on : 25-Apr-2020, 5:11:30 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Medicines"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
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
if(request.getParameter("stock")!=null)
{
    int mid = Integer.parseInt(request.getParameter("mid"));
    int stock = Integer.parseInt(request.getParameter("stock"));
    Session ses = NewHibernateUtil.getSessionFactory().openSession();
    Transaction tx = ses.beginTransaction();
     String hql = "FROM Medicines m where m.id=:a";
    Query query = ses.createQuery(hql);
    query.setParameter("a",mid);
    List med = query.list();
    Medicines m = (Medicines)med.get(0);
    m.setStock(stock);
    ses.save(m);
    tx.commit();
    %>
         <center>
             <br>
             <br>
             <br>
         <button class="button">Stock updated successfully </button>
         <center>
         <%
  


}
else
{
int id =(Integer)session.getAttribute("id");
int mid=Integer.parseInt(request.getParameter("id"));
%>
<center>
<form action="#" method="POST">
   <h1> Enter new stock availability:<input type="number" name="stock" palceholder="Enter new availability">
    <input type ="hidden" name="mid" value = <%=id%>>
    <br/>


    <input type="submit" class="button" value="Update">

</form>
<%

}

%>