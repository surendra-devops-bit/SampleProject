<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>User Logininformation</title>
</head>
<body>
<%
String userName=request.getParameter("uname");
String password1=request.getParameter("psw");
String description = request.getParameter("description");

out.println("Username:     "      +userName);

%>
</br>
<%
out.println("Password:      "    +password1);
%>

<%
out.println("Description:      "    +description  +userName);
%>

<form action="" >
  <div class="imgcontainer">
    <img src="img_avatar2.png" alt="Avatar" class="avatar">
  </div>

  <div class="container">
    <label><b>Username</b></label>
    <input type="text" placeholder="Enter fisrst Username" name="uname" required>

    <label><b>Lastname</b></label>
    <input type="text" placeholder="Enter lastname" name="psw" required>
       
          
    <label><b>PhoneNumber</b></label>
    <input type="text" placeholder="Enter PhoneNumber" name="psw" required>
      
    <label><b>Email</b></label>
    <input type="text" placeholder="Enter Email" name="psw" required>
    
    
    <button type="submit">Login</button>
    <input type="checkbox" checked="checked"> Remember me
  </div>

  <div class="container" style="background-color:#f1f1f1">
   <button type="button" class="Emailsent">Cancel</button>
    <button type="button" class="cancelbtn">Cancel</button>
    
  </div>
</form>
</body>
</html>