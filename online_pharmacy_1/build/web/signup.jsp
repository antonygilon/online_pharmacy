<%@page import="com.pharmacy.Users"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@include file = "header.html"%>

<%

String name = request.getParameter("name");
String username = request.getParameter("username");
String pwd = request.getParameter("psw");
String mail = request.getParameter("mail");
String phonenum = request.getParameter("phonenum");
String address = request.getParameter("address");

try
{

    Session ses = NewHibernateUtil.getSessionFactory().openSession();
    Transaction tx = ses.beginTransaction();
    Users newuser = new Users();
    newuser.setName(name);
    newuser.setUsername(username);
    newuser.setPassword(pwd);
    newuser.setAddress(address);
    newuser.setPhoneNum(phonenum);
    newuser.setEmail(mail);
    newuser.setUserLevel(0);
    ses.save(newuser);
    tx.commit();
    



out.println("Thanks for signing up. Click <a href='signin.html'>here</a> to continue");


}catch(Exception e){out.println(e);}
%>

