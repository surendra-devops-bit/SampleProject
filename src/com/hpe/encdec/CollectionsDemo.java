package com.hpe.encdec;

import java.util.*;
public class CollectionsDemo {
	public static Date caselectCutoffDate(){
		String caDate ="30-NOV-16";
		
		
		Date cutoffdateValue = new Date(caDate);
		
		
		return cutoffdateValue;
	}
	public Date hkselectCutoffDate(){
		
		String hkDate ="2-NOV-16";
		
		
		Date cutoffdateValue = new Date(hkDate);
		
		
		return cutoffdateValue;
	}
	public Date moselectCutoffDate(){
		
		String moDate ="3-NOV-16";
		
		Date cutoffdateValue = new Date(moDate);
		
		
		return cutoffdateValue;
	}

   public static void main(String[] args) {
      List a1 = new ArrayList();
      a1.add("HK");
      a1.add("CA");
      a1.add("MO");      
      System.out.println(" ArrayList Elements");
      System.out.print("\t" + a1);
      
      
      System.out.println( "in1"+a1.get(0));
      System.out.println( "in2"+a1.get(1));
      System.out.println( "in3"+a1.get(2));
      
      if((a1.equals(a1.get(0)))){
    	  caselectCutoffDate();
      }

      
   }
}