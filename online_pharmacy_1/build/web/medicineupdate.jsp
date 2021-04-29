<%-- 
    Document   : medicineupdate
    Created on : 25-Apr-2020, 5:02:10 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Medicines"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
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
</style>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <br><br><br>
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
               while(it.hasNext())
                {
                    Medicines m = (Medicines)it.next();
                    %>
            <tr>
                    <td><a href="medicineupdatedb.jsp?id=<%=m.getMid()%>"><%=m.getMname()%></td></option>
                    <td><%=m.getStock()%></td>
                    <td><%=m.getMcost()%></td>
                </tr>
                   
               <%}%>
                </table>
            
    </body>
</html>
