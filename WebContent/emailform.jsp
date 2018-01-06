<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>	
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Send an e-mail</title>
</head>

<script> 
function validateForm() 
  { 
  if(document.frm.recipient.value=="") 
   { 
     alert("To field should not be blank.."); 
     document.frm.recipient.focus(); 
     return false; 
    } 
     else if(document.frm.cc.value=="") 
      { 
       alert("cc should not be blank"); 
       document.frm.cc.focus(); 
	   return false; 
	   } 
	  else if(document.frm.subject.value=="") 
      { 
       alert("subject should not be blank"); 
       document.frm.subject.focus(); 
	   return false; 
	   } 
   }
   
   function cancelForm() 
  { 
  
     alert("Are you sure you want to go back to Login screen"); 
	 document.cancelfrm.submit();
      
    } 
</script>

<body>
    <form name="frm" action="confirmemail.jsp" method="post" onSubmit="return validateForm()">
        <table border="0" width="35%" align="center">
            <caption><h2>Send E-mail</h2></caption>
            <tr>
                <td width="50%">To: </td>
                <td><input type="text" name="recipient" value="dph-gaimmreg@dph.ga.gov" size="50"/></td>
            </tr>
			<tr>
			<td> </td>
			 </tr>
			<tr>
                <td width="50%">CC:</td>
				<td><input type="text" name="cc" value=<%= request.getParameter("EmailAddress") %> size="50"/></td>
            </tr>
            <tr>
                <td width="50%">Subject: </td> 
			
                <td><input type="text" name="subject" value= <%= request.getParameter("orgCode") %> size="50"/></td>
            </tr>
            <tr>
                <td>Content: </td>
				
				<td>
				<textarea rows="15" cols="65"  name="content" value=<%=request.getAttribute("schoolName")%> > </textarea>
				</td>
                 
            </tr>
            <tr>
                <td colspan="2" align="right"><input type="submit" value="Send"/></td>
			
		</form>
		<form name="cancelfrm" action="!security_ui.authenticateLogin" method="post">
				
				<td colspan="0" align="center"><input type="button" value="Cancel" onclick="cancelForm()"></td>
				
		</form>		
            </tr>
        </table>
         
   
</body>
</html>