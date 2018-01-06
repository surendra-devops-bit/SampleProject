package com.vaannila;

import javax.servlet.http.HttpServletRequest;

import org.apache.struts.action.ActionMapping;
import org.apache.struts.action.ActionForm;


public class SchoolDayCareEmailForm extends ActionForm {
	
	
	private String recipient;
	private String cc;
    private String subject;
	private String content;
	
	//form getters and setters
	public String getrecipient() {
		return recipient;
	}
	public void setrecipient(String recipient) {
		this.cc = recipient;
	}
	public String getcc() {
		return cc;
	}
	public void setcc(String cc) {
		this.cc = cc;
	}
	public String getsubject() {
		return subject;
	}
	public void setsubject(String subject) {
		this.subject = subject;
	}

    public String getcontent() {
		return content;
	}
	public void setcontent(String content) {
		this.content = content;
	}
	
@Override
	public void reset(ActionMapping mapping, HttpServletRequest request) {
		super.reset(mapping, request);
	
    }
}

