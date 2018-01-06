package com.vaannila;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;


public class SchoolDayCareRegForm extends ActionForm {
	static final long serialVersionUID = -1210016535880832101L;
	
	private String schoolName;
	private String orgCode;
        private String userName;
	private String firstName;
	private String lastName;
	private String EmailAddress;
	private String orgPhone1;
	private String orgPhone2;
	private String orgExtension;
	
	//form getters and setters
	public String getschoolName() {
		return schoolName;
	}
	public void setschoolName(String schoolName) {
		this.orgCode = schoolName;
	}
	public String getorgCode() {
		return orgCode;
	}
	public void setorgCode(String orgCode) {
		this.orgCode = orgCode;
	}
	public String getuserName() {
		return userName;
	}
	public void setuserName(String userName) {
		this.userName = userName;
	}

    public String getfirstName() {
		return firstName;
	}
	public void setfirstName(String firstName) {
		this.firstName = firstName;
	}
	public String getlastName() {
		return lastName;
	}
	public void setlastName(String lastName) {
		this.lastName = lastName;
	}
    
    public String getEmailAddress() {
		return EmailAddress;
	}
	public void setEmailAddress(String EmailAddress) {
		this.EmailAddress = EmailAddress;
	}

	public String getOrgPhone1() {
		return orgPhone1;
	}
	public void setOrgPhone1(String orgPhone1) {
		this.orgPhone1 = orgPhone1;
	}
	public String getOrgPhone2() {
		return orgPhone2;
	}
	public void setOrgPhone2(String orgPhone2) {
		this.orgPhone2 = orgPhone2;
	}
	public String getOrgExtension() {
		return orgExtension;
	}
	public void setOrgExtension(String orgExtension) {
		this.orgExtension = orgExtension;
	}
@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		super.reset(mapping, request);
	
    }
}

