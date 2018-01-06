<%@ taglib uri="/WEB-INF/struts-html.tld" prefix="html"%>

	  
  <html:form method="post" action="/SchooldaycareReg.do">
    
    
    <!-- START CONTENT -->
    <style type="text/css">
	  .left-space{ margin-left: 106px }
	 </style>
	 <a name="gritstop">
	 <table align=center width="760" border="0" cellspacing="2" cellpadding="1">
       <tr bgcolor="#FBFACC">
         <td height="20" align="center" bgcolor="#FBFACC">
		   <b>School/Daycare User - Provide the Below Details !!!</b>
		 </td>
       </tr>	   
     </table>
     <table bgcolor="#f0f0f0" align=center width="100%" border="0" cellspacing="2" cellpadding="1">
       <tr bgcolor="#cccccc">
         <td height="25" class="grayBar"><b>&nbsp;&nbsp;User Information</b></td>
       </tr>
     </table>
     <table bgcolor="#f0f0f0" align=center width="100%" border="0" cellspacing="2" cellpadding="1">
       <tr>
	     
		 </tr>
		 <tr>
		   <td width="15%" align="right" class="RequiredField">School Name:</td>
		   <td width="70%"><html:text property="schoolName" value="" size="53" maxlength="50" tabindex="1"/></td>
		   <td width="15%" align="left">
		     <input type="button" value="Cancel" id="btnCancel" style="width: 80px;" tabindex="78">
		   </td>
		   
		 </tr>
		 <tr>
		   <td width="15%" align="right" class="RequiredField">Organization Code:</td>
		   <td width="70%"><html:text property="orgCode" value="" size="53" maxlength="50" tabindex="1"/></td>  
		 </tr>
		 <tr><td></td></tr>
		 <tr><td></td></tr>
	     <tr>
		   <td width="15%" align="right" class="RequiredField">Username:</td>
		   <td width="85%" ><html:text property="userName" value="" size="53" maxlength="50" tabindex="4"/></td>
		 </tr>
		 <tr>
           <td width="15%" align="right" class="RequiredField">First Name:</td>
           <td><html:text property="firstName" value="" size="53" maxlength="55" tabindex="6"/></td>
	     </tr>
		 <tr>
           <td width="15%" align="right">Last Name:</td>
           <td><html:text property="lastName" value="" size="53" maxlength="55" tabindex="7"/></td>
         </tr>
			  <tr>
                <td width="15%" align="right" class="RequiredField">Email:</td>
                <td><html:text property="EmailAddress" value="" size="53" maxlength="80" tabindex="12"/></td>
              </tr>
			  
                
				
				  
				     <tr>
				       <td width="18%" align="right" class="RequiredField">&nbsp;&nbsp;Phone Number:</td>
					   <td width="21%">
					     <html:text property="orgPhone1" value="" size="4" maxlength="3" tabindex="14"/>-<html:text property="orgPhone2" value="" size="5" maxlength="4" tabindex="15"/>
					     -<html:text property="orgPhone3" value="" size="5" maxlength="4" tabindex="16"/>
					     &nbsp;&nbsp;Ext.&nbsp;&nbsp;<html:text property="orgExtension" value="" size="5" maxlength="7" tabindex="17"/>
					   </td>
					   <%--
					   <td width="5%" align="right">Ext.</td>
					   <td width="39%"><html:text property="orgExtension" value="" size="5" maxlength="7" tabindex="17"/></td>
					    --%>
				     
				   
				 </td>
<table bgcolor="#f0f0f0" align=center width="100%" border="0" cellspacing="2" cellpadding="1">
       <tr>
	     <td width="15%" align="right" class="RequiredField"></td>
         <td width="15%" align="right">
		 <b> &emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;&emsp;</b>
           <html:submit property="btnSave" style="width: 80px;" tabindex="77">
               
             </html:submit>
           </td>
		 </tr>				 
			  </tr>
			  <tr><td></td></tr>
			  <tr><td></td></tr>
			  <tr><td></td></tr>
			  <tr><td></td></tr>       
    <script type="text/javascript">

	$(document).ready(function(){
		checkTopLocation();
    	prepareJQueryEvents(); 
	});
	
	
    	$("#btnCancel").click(function() {
	  		var frm = window.document.schooldaycareRegform;
	  		var preUrl = frm.onlineURL.value;
	  		var url = preUrl+"security_ui.logout?pSecureId="+frm.pSecureId.value;
			if (confirm("By pressing OK, you will be returned to the GRITS Logon Screen and lose all changes.  " +
						"Press Cancel to remain on this screen and continue sending email.")){
		  		window.location.href = url;
			}else{
	   			return false;
			}
    	});
 
 		$(function() {
   
    		// Setup form validation on the #register-form element
    		$('form[name=schooldaycareRegform').validate({
	
	    		// Invalid Handler
				invalidHandler: function(form, validator) {
          		var errors = validator.numberOfInvalids();
          		if (errors) {
            		alert(validator.errorList[0].message);
            		validator.errorList[0].element.focus();
          		}
        	},
    
            // Specify the validation rules
        	rules: {
		    	//New Organization Section
           		 firstName: "required",
           		 lastName: "required",
           		 EmailAddress: {
                   required: true,
                   email: true
                 },
			     
			     orgPhone1: {
				   required: true,
				   minlength: 3,
				   number: true
			     },
			     orgPhone2: {
				   required: true,
				   minlength: 3,
				   number: true
			     },
			     orgPhone3: {
					   required: true,
					   minlength: 4,
					   number: true
				     },
			     orgExtension: {
				   required: false,
				   minlength: 1,
				   number: true
			     },
			     
            // Specify the validation error messages
            messages: {
            	firstName: "Please enter your firstName",
                lastName: "Please enter your lastName",
                EmailAddress: "EmailAddress must be in the format of name@domain.com",
                orgPhone1: "Please enter exactly 3 numeric characters",
			    orgPhone2: "Please enter exactly 3 numeric characters",
			    orgPhone3: "Please enter exactly 4 numeric characters",
			    orgExtension: "Please enter a valid Extension as at least 1 numeric character",
			    
            },  // end messages
		
		    errorPlacement: function(error, element) {
            // Override error placement to not show error messages beside elements //
            },
		
            submitHandler: function(form) {
                form.cmdAction.value = "save";
				$('#btnCancel').attr('disabled',true);
				setTimeout(function(){
                  form.submit(); 
                }, 1500);//Time in milliseconds
            } // submitHandler
          });  // validate
        });	// function			
    </script>  
  </html:form>