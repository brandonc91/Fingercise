import java.io.*;
import java.net.*;
import java.util.HashMap;
public final class MyServer extends Thread {
	private static final int PORT=8889;
	private static final int NUM_CONNECT=1;
	private static HashMap<String, Integer> members;
	private static int memberCount;
	
	private MyServer() {
		memberCount = 0;
		members = new HashMap<String, Integer>();
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
	         System.out.println("Server started\n");
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
	         if (line.contains("register:")) {
	        	 int i = 0;
	        	 while (!line.substring(i, i+1).equals(":")) i++;
	        	 String name = line.substring(i, line.length());
	        	 addMember(name);
	        	 writer.println(name+":");
	         }
	         writer.flush();
	         server.close();
	      }
	      catch(IOException ie)
	      {
	         ie.printStackTrace();
	      }
	   }
	
	public static void addMember(String name) {
		if (members.containsKey(name)) {
			System.out.println("Sorry, this member has already registered.");
		}
		else {
			members.put(name, memberCount+1);
			memberCount++;
			System.out.println("Member registered!");
		}
	}
	
	
	
	
}
