<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
</head>
<body> <br/><br/><br/><br/><br/> <center> 
<%-- <h2> <% String a=session.getAttribute("username").toString(); out.println(a); %> </h2> --%>


<h2> <% String userName=request.getParameter("username").toString(); out.println("UN" +userName); %> </h2>
<h2> <% String passWord=request.getParameter("password").toString(); out.println("PWD" +passWord); %> </h2>

<%-- <h2> <% String b=session.getAttribute("password").toString(); out.println("pwd "+b); %> </h2>  --%>
<br/> <br/> <br/><br/><br/><br/><br/> <a href="logout.jsp">Logout</a>
 </center> 
 </body>

</html>