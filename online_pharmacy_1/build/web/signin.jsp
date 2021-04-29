<%@page import="com.pharmacy.Users"%>
<%@page import="org.hibernate.Query"%>
<%@page import="org.hibernate.Transaction"%>
<%@page import="org.hibernate.Session"%>
<%@page import="com.pharmacy.NewHibernateUtil"%>
<%@page import = "java.sql.*"%>
<%@page import = "java.util.*"%>
<%@include file = "header.html"%>
<%

String username = request.getParameter("username");
String password = request.getParameter("password");
out.println(username);
out.println(password);

try
{

   int user_id=0;
   int user_level=0;
   boolean flag = false;
   Session ses = NewHibernateUtil.getSessionFactory().openSession();
   Transaction tx = ses.beginTransaction();

     Query query = ses.createQuery("FROM Users u where u.username =:a AND u.password =:b");
    query.setParameter("a",username);
    query.setParameter("b",password);
   List user = query.list();
 
   if(user.isEmpty())
   {
       flag = true;
   }
   
   else
   {
       int i = 0;
       Iterator iterator = user.iterator();
       while(iterator.hasNext())
       {
            Users u  = (Users) iterator.next();
           
            user_id = u.getId();
            user_level = u.getUserLevel();
            
            
       } 
   }
 

   if(flag==true)
   {
       out.println("Invalid username or password");
       //response.sendRedirect("signin.html");

   }

   else
   {
    session.setAttribute("username",username);
    session.setAttribute("id",user_id);
    session.setAttribute("userlevel",user_level);
    session.setAttribute("Entered",0);
    out.println("Signed in successfully");
    response.sendRedirect("index.jsp");
   }
    

}catch(Exception e){out.println(e);
    e.printStackTrace();}

%>

