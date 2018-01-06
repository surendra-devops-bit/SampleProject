import java.io.File;

public class CopyFiles {
	 public static void main(String[] args) {
         // TODO code application logic here
         // File (or directory) to be moved
         //File file = new File("C:\\Users\\bommises\\Desktop\\Thanu");
		 File file = new File("C:/Users/bommises/Desktop/Thanu/");
         // Destination directory
         File dir = new File("C:\\Users\\bommises\\Desktop\\Thanu1");
         if(dir.isDirectory()) {
        	    File[] content = dir.listFiles();
        	    for(int i = 0; i < content.length; i++) {
        	        //move content[i]
        	    }
         // Move file to new directory
         boolean success = file.renameTo(new File(dir, file.getName()));
         if (!success) {
             System.out.print("not good");
         }
     }

}
}
