<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<body>
<form method="post" action="">
</form>
<table>
<tr>
  <td width="100%">
	<fieldset><legend><b>Email Sent  ...</b></legend>
	<table width="100%">
	  <tr>
		<td valign=top>
		  <table border=0 cellPadding=4 cellSpacing=2 width="100%">
			<tr>
			  <td>
				<table>
				  <tr>


<table align=center width="760" border="0" cellspacing="2" cellpadding="1">
       <tr bgcolor="#FBFACC">
         <td height="20" align="center" bgcolor="#FBFACC">
		 <%
      out.println("<p> Mail sent Succesfully!!Please wait for GRITS helpdesk to revert back . </p>");
         %>
		 </td>
       </tr>	   
     </table>
</tr>    	                          
				</table>
			  </td>
			</tr>
		  </table>
<tr><td></td></tr>
<tr><td></td></tr>
<tr>
<td height="20" align="right" bgcolor="###BLUE">
<b> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</b>
<form name="confirmform" action="!security_ui.authenticateLogin" method="post">
	    <input type="button" value="Return to Login Page" id="btnCancel" style="width: 150px;" tabindex="78"> 
<tr><td align="center"><a href="/test/!security_ui.authenticateLogin" target="_top" class="xMenuItem" >&nbsp;Return to Login Page</td></tr>
</form>
</td>
</tr>
</head>
</body>
</html>