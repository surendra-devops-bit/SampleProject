package com.hpe.encdec;

import java.io.File;
import java.io.IOException;

public class CheckIfFileExists {

	public static void main(String[] args) {
		 
		
		CheckIfFileExists checkfile=new CheckIfFileExists();
		checkfile.fileExists();
		
		   // create a file that is really a directory
		    //File aDirectory = new File("C:/sampleTest/SampleProject/files");
		    
		 //   File aDirectory = new File("/sampleTest/SampleProject/files");
		    
		    // get a listing of all files in the directory
		  //  String[] filesInDir = aDirectory.list();

		    // sort the list of files (optional)
		    // Arrays.sort(filesInDir);

		    // have everything i need, just print it now
		  /*  for ( int i=0; i<filesInDir.length; i++ )
		    {
		    	boolean bool=false;
		    	if(filesInDir[i].length()==2){
		   // 	return bool;
		    	}
		    	
		      System.out.println( "file: " + filesInDir[i] );
		    }*/
		    
	}
	
public boolean fileExists(){
	File aDirectory = new File("/sampleTest/SampleProject/files");
	 String[] filesInDir = aDirectory.list();
	 for ( int i=0; i<filesInDir.length; i++ )
	    {
	    	boolean bool=false;
	    	
	    	if(filesInDir[i].length()==2){
	    		 System.out.println( "file@@@@@@@: " + filesInDir[i] );
	    	return true;
	    	
	    	}
	    	
	      System.out.println( "file: " + filesInDir[i]);
	      System.out.println( "<<<<<<<<>>>>>>>: " + filesInDir.length);
	    }
	
	return false;
}
}



