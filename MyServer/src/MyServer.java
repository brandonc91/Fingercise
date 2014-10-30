import java.io.*;
import java.net.*;
public final class MyServer extends Thread {
	private static final int PORT=8889;
	private static final int NUM_CONNECT=1;
	
	private MyServer() {
		
	}
	
	public static void main(String args[])
	   {
	      MyServer myServer = new MyServer();
	      if(myServer !=null) {myServer.start();}
	   }
	
	public void run()
	   {
	      try
	      {
	         ServerSocket server = new ServerSocket(PORT, NUM_CONNECT);
	         Socket client = server.accept();
	         
	         BufferedReader reader = new BufferedReader(
	            new InputStreamReader(client.getInputStream()));

	         PrintWriter writer = new PrintWriter(new BufferedWriter(
	            new OutputStreamWriter(client.getOutputStream())));
	         String line = reader.readLine();
	         System.out.println("Hello" + line);
	         if (line.equals("HELLO")) {
	        	 writer.print("Chicago:New York:San Francisco:");
	        	 writer.print("Chicago:New York:San Francisco:");
	        	 writer.println("Chicago:New York:San Francisco:");
	         }
	         writer.flush();
	      }
	      catch(IOException ie)
	      {
	         ie.printStackTrace();
	      }
	   }
}
