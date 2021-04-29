<%-- 
    Document   : checkout
    Created on : 25-Apr-2020, 1:54:23 PM
    Author     : Srinivas Raman
--%>

<%@page import="java.util.Date"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="com.pharmacy.Purchase"%>
<%@page import="com.pharmacy.Users"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="com.pharmacy.Orders"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page import="java.util.ArrayList"%>
<%@page import="com.pharmacy.Medicines"%>
<%@page import="com.pharmacy.Cart"%>
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
    if(session.getAttribute("mycart")!=null)
    {
        Cart mycart = (Cart)session.getAttribute("mycart");
        ArrayList<Medicines> meds = mycart.getMedicines();
        ArrayList<Integer> quantity = mycart.getQuantity();
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = ses.beginTransaction();

        double total_cost = 0;
        for(int i=0;i<meds.size();i++)
        {
            Medicines m = meds.get(i);
            total_cost  = total_cost + (m.getMcost()*quantity.get(i));
        }
         %>
         <center>
             <br>
             <br>
             <br>
         <button class="button">Thanks for the purchase. The total amount is </button>
         <center>
         <%
          
        out.println("<h1>"+total_cost+"<h1>");
        
        int user_id =(Integer)session.getAttribute("id");
        String hql = "FROM Users u where u.id=:a";
        Query query = ses.createQuery(hql);
        query.setParameter("a",user_id);
        List users = query.list();
        Users user = (Users)users.get(0);
        Orders order = new Orders(user,(int)total_cost);
        ses.save(order);
        Date date = new Date();
         for(int i=0;i<meds.size();i++)
        {
            Medicines m = meds.get(i);
            Purchase p = new Purchase(m,order,quantity.get(i),date);
            ses.save(p);
        }
        tx.commit();
        ses.close();
    }
%>