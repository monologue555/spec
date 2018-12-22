package chatting;
import java.io.*;
import java.net.*;
import java.util.*;
public class Server{
	private boolean bStart = false;
	private ServerSocket ss = null;
	List<Client> clients = new ArrayList<Client>();
	private int index = 0;
	public void tcpMonitor() {
		try {
			ss = new ServerSocket(8885);
			bStart = true;	
		} catch (IOException e) {	
			e.printStackTrace();
		}
		System.out.println("聊天室已建立！");
		try {
			while (bStart) {
				index++;
				Socket s = ss.accept();
				Client c = new Client(s);
				clients.add(c);
				String str="游客"+s.getPort();
	            System.out.println(str+"进入聊天室，当前聊天室人数为：" + index);
	    		
	    	
	    			for (int i = 0; i < clients.size(); i++) {
	    				Client a = clients.get(i);
	    			
	    				a.sendToEveryClient( "欢迎"+str+"进入，当前聊天室人数为：" + index);
	    			}
	    		
	    		
				new Thread(c).start();	
				
			}
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				ss.close();
			} catch (IOException e) {	
				e.printStackTrace();
			}
		}	
	}
	
	
	private class Client implements Runnable {
		DataInputStream dis = null;
		DataOutputStream dos = null;
		Socket s = null;
		
		boolean bStart = false;
		
		Client(Socket _s) {
			s = _s;
			
			try {
				dis = new DataInputStream(s.getInputStream());
				dos = new DataOutputStream(s.getOutputStream());
			} catch (IOException e) {
				e.printStackTrace();
			}
			
			bStart = true;
		}
		public void sendToEveryClient(String str) {
			try {
				dos.writeUTF(str);
				dos.flush();
				//System.out.println(str);
			} catch (IOException e) {	
				clients.remove(this);	
				
			}
		}
	
		public void run() {
			try {
				while (bStart) {
					
					String str = "游客"+s.getPort()+":"+dis.readUTF();
					//System.out.println(str);
					for (int i = 0; i < clients.size(); i++) {
						Client c = clients.get(i);
						c.sendToEveryClient(str);
						
					}
				}
			} catch (EOFException e) {
				clients.remove(this);
				index--;
				System.out.println("游客"+s.getPort()+"已离开，当前聊天室人数为：" + (index-1));
				for (int i = 0; i < clients.size(); i++) {
    				Client a = clients.get(i);
    			
    				a.sendToEveryClient( "游客"+s.getPort()+"已离开，当前聊天室人数为：" + (index-1));
    			}
			} catch (SocketException e) {
				clients.remove(this);
				index--;
				System.out.println("游客"+s.getPort()+"已离开，当前聊天室人数为：" + (index-1));
				for (int i = 0; i < clients.size(); i++) {
    				Client a = clients.get(i);
    			
    				a.sendToEveryClient( "游客"+s.getPort()+"已离开，当前聊天室人数为：" + (index-1));
    			}
			} catch (IOException e) {
				e.printStackTrace();
			} finally {
				try {
					if (s != null)
						s.close();
					if (dis != null)
						dis.close();
					if (dos != null)
						dos.close();
				} catch (IOException e) {
					e.printStackTrace();
				}
			}
		}

		
	}
	public static void main(String[] args) {
		Server ts = new Server();
		ts.tcpMonitor();
	}
}