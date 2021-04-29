<%-- 
    Document   : orderhistory
    Created on : 25-Apr-2020, 5:32:29 PM
    Author     : Srinivas Raman
--%>

<%@page import="com.pharmacy.Orders"%>
<%@page import="java.util.Iterator"%>
<%@page import="java.util.List"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Session"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
    
<table border="5" cellspacing="2" cellpadding="2">
            <tr>
                <th>Order id</th>
                <th>Order by</th>
                <th>Total Cost</th>
            <%
                Session ses = NewHibernateUtil.getSessionFactory().openSession();
                Transaction tx = ses.beginTransaction();
                String hql = "FROM Orders";
                Query query = ses.createQuery(hql);
                List medicines = query.list();
                Iterator it = medicines.iterator();
                %>
            

                <%
                while(it.hasNext())
                {
                    Orders m = (Orders)it.next();
                   
                    %>
            <tr>
                    <th><a href="buymedicine.jsp?id=<%= m.getOrderId()%>"><%=m.getOrderId()%></th></option>
                    <td><%=m.getUsers().getName()%></td>
                    <td><%=m.getTotalCost()%></td>
                </tr>
                    
                    <%
                        
                    
                    
                    
                }
                
                
               
                %></table><%

        }


%>
