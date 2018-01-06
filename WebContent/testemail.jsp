<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

	  
  <html:form method="post" action="/SchooldaycareReg.do">
    
    
    <!-- START CONTENT -->
    <style type="text/css">
	  .left-space{ margin-left: 106px }
	 </style>
	 <a name="gritstop">
	 <body>
    <form name="emailfrm" action="confirmemail.jsp" method="post" onSubmit="return validateForm()">
        <table border="0" width="35%" align="center">
            <caption><h2>Send E-mail</h2></caption>
	
		 <tr>
		   <td width="15%" align="right" class="RequiredField">TO:</td>
		   <td width="70%"><html:text property="recipient" value="dph-gaimmreg@dph.ga.gov" size="53" maxlength="50" tabindex="1"/></td>
		   <td width="15%" align="left">
		   </td>
		 </tr>
		 <tr>
		   <td width="15%" align="right" class="RequiredField">CC:</td>
		   <td width="70%"><html:text property="cc" value="frm.EmailAddress" size="53" maxlength="50" tabindex="2"/></td>  
		 </tr>
		 <tr>
		   <td width="15%" align="right" class="RequiredField">Subject:</td>
		   <td width="70%"><html:text property="subject" value="frm.getorgCode()" size="53" maxlength="50" tabindex="3"/></td> 
		 </tr>
		 <tr>
		   <td width="15%" align="right" class="RequiredField">Content:</td>
		   <td width="70%"><html:textarea rows="15" cols="65" property="content" value="" tabindex="3"/></td> 
		 </tr>
		 <tr>
                <td colspan="2" align="right"><input type="submit" value="Send"/></td>
		</form>
		<form name="cancelfrm" action="!security_ui.authenticateLogin" method="post">
				
				<td colspan="0" align="center"><input type="button" value="Cancel" onclick="cancelForm()"></td>
				
		</form>		
		 <tr><td></td></tr>
		 <tr><td></td></tr>
	
   </body>
  </script>  
  </html:form>