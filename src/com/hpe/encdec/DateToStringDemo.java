package com.hpe.encdec;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
public class DateToStringDemo{
   public static void main(String args[])
   {
       Date businessDate = new Date();
       DateFormat df = new SimpleDateFormat("dd-MON-yy");
    
      
       try
       {
           //format() method Formats a Date into a date/time string. 
           String testDateString = df.format(businessDate);
           System.out.println("String in dd-MON-yy format is: " + testDateString);
           

       }
       catch (Exception ex ){
          System.out.println(ex);
       }
    }
}