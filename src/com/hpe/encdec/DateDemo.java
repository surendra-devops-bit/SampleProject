package com.hpe.encdec;
import java.util.Calendar;
import java.util.Date;
import java.util.TimeZone;
public class DateDemo {
	
		public static void main(String args[]){
			
			
			    
		        //Java calendar in default timezone and default locale
		        Calendar cal = Calendar.getInstance();
		        cal.setTimeZone(TimeZone.getTimeZone("GMT"));
		      
		        System.out.println("current date: " + getDate(cal));
		      
		      
		        //adding days into Date in Java
		        cal.add(Calendar.DATE, 2);
		        System.out.println("date after 2 days : " + getDate(cal));
		      
		        //subtracting days from Date in Java
		        cal.add(Calendar.DATE, -2);
		        System.out.println("date before 2 days : " + getDate(cal));
		      
		      
		           
		    }
		  
		    /**
		     *
		     * @return current Date from Calendar in dd/MM/yyyy format
		     * adding 1 into month because Calendar month starts from zero
		     */
		    public static String getDate(Calendar cal){
		        return "" + cal.get(Calendar.DATE) +"/" +
		                (cal.get(Calendar.MONTH)+1) + "/" + cal.get(Calendar.YEAR);
		    }
		  
		   
		  

			 
			     
			   }
			
		