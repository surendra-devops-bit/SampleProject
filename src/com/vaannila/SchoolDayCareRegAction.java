package com.vaannila;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.struts.action.ActionForm;
import org.apache.struts.action.ActionForward;
import org.apache.struts.action.ActionMapping;

//import com.vaannila.SchoolDayCareEmailForm;
import com.mailservice.MailUtil;
import java.io.*;

public class SchoolDayCareRegAction extends org.apache.struts.action.Action {


  public ActionForward execute(ActionMapping mapping, ActionForm form,
            HttpServletRequest request, HttpServletResponse response)
            throws Exception {

		String sdr = "success";
		SchoolDayCareRegForm frm = (SchoolDayCareRegForm)form;
		//SchoolDayCareEmailForm emailfrm = (SchoolDayCareEmailForm)form;

		File f = new File("mail.properties");
		System.out.println("f.getAbsoluteFile() " + f.getAbsoluteFile());
				if (f.exists() && !f.isDirectory()) System.out.println("File Exists");
					else System.out.println("File Does not Exists");
		

frm.setEmailAddress("nalini-kanta.tripathy@hpe.com");
try{

String status=MailUtil.sendMail("nalini-kanta.tripathy@hpe.com", frm.getEmailAddress(), "school day care user","New User","nalini-kanta.tripathy@hpe.com");
System.out.println("Mail Sent Status : "+status);
}catch(Exception e){
	System.out.println(e);
	
}

		return mapping.findForward(sdr);
	}


}
