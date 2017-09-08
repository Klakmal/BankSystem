
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;
import java.io.BufferedWriter;
import java.io.FileWriter;
import java.io.IOException;

/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author lakmal_j
 */
public class Log{
    
        public String user_name;
        public String action;
        public String timestamp;
        public String branchname;
        
	private static final String FILENAME = "C:\\Users\\lakmal_J\\Documents\\NetBeansProjects\\BankSystem\\outputlog.txt";

	
        public void writelog(String user_name,String action,String branchname){
            
            try (BufferedWriter bw = new BufferedWriter(new FileWriter(FILENAME, true))) {

			String content = "This is the content to write into file\n";
                       
			bw.write(content);
                        bw.write(user_name);

			// no need to close it.
			//bw.close();

			System.out.println("Done");

		} catch (IOException e) {

			e.printStackTrace();

		}
        }

}
    

