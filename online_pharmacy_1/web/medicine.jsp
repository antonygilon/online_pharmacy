<%-- 
    Document   : medicine
    Created on : 25-Apr-2020, 3:01:27 PM
    Author     : Srinivas Raman
--%>

<%@page import="java.text.SimpleDateFormat"%>
<%@page import="java.util.Date"%>
<%@page import="com.pharmacy.Medicines"%>
<%@page import="java.util.Iterator"%>
<%@page import="com.pharmacy.Category"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<style>
div {
  background-color: #FFFFFF;
  width: 700px;
  border: 15px solid dodgerblue;
  padding: 50px;
  margin: 20px;
}
</style>
<%
    if(request.getMethod()=="POST")
    {
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
        Transaction tx = ses.beginTransaction();
        String name = (String)request.getParameter("medicinename");
        int power =     Integer.parseInt(request.getParameter("power"));
        String mandate = (String)request.getParameter("mandate");
        String expdate = (String)request.getParameter("expdate");
        int cid = Integer.parseInt(request.getParameter("category"));
        int stock =Integer.parseInt(request.getParameter("stock"));
        String mdesc = (String)request.getParameter("mdesc");
        int cost = Integer.parseInt(request.getParameter("cost"));
        String hql = "FROM Category C";
         Query query = ses.createQuery(hql);
         List<Category> categories = query.list();
         Category c = categories.get(0);
         SimpleDateFormat formatter1=new SimpleDateFormat("yy/MM/DD");  
        Medicines m = new Medicines(c,name,power,formatter1.parse(mandate),formatter1.parse(expdate),stock,(float)cost);
        ses.save(m);
        tx.commit();
        ses.close();
    }
    
else
    {
        
         Session ses = NewHibernateUtil.getSessionFactory().openSession();
         Transaction tx = ses.beginTransaction();
         String hql = "FROM Category C";
         Query query = ses.createQuery(hql);
         List<Category> categories = query.list();
        %>
        <center>
            <div><h2>
         <form action="#" method="POST">
                <label for="medicinename"><b>Medicine Name</b></label>
                <input type="text" placeholder="Enter Medicine name" name="medicinename" required>
                <br/>
                <label for="power"><b>Medicine's power</b></label>
                <input type="number" placeholder="Enter Medicine's power" name="power" required>
                <br/>
                <label for="cost"><b>Medicine's Cost</b></label>
                <input type="number" placeholder="Enter Medicine's Cost" name="cost" required>
                <br/>
                <label for="mandate"><b>Manufacturing Date</b></label>
                <input type="date" placeholder="Enter Medicine's Manufacturing date" name="mandate" required>
                <br/>
                <label for="expdate"><b>Expiry Date</b></label>
                <input type="date" placeholder="Enter Medicine's Expiry date" name="expdate" required>
                <br/>
                <label for="stock"><b>Availability</b></label>
                <input type="number" placeholder="Enter Medicine's Stock Availability" name="stock" required>
                <br/>
                <label for="category"><b>Select Medicine Category</b></label>
                <select name="category">
                    <%
                         Iterator<Category> itr=categories.iterator();    
                          while(itr.hasNext())
                    {
                        Category c = itr.next();
  
        
                        %>
                        <option value="<%=c.getCid()%>"><%=c.getCname()%></option></div>
                        <%
                    }
                   
                    %>
    <%}

%>
