package Connection;

import java.util.*;
import java.sql.*;

public class ConPool implements Runnable
{
	static private ConPool poolinstance = null;
	int mincon = 10;
	int maxcon = 30;
	Connection newcon = null;
	boolean creatingnewcon = false;
	static List<Connection> freecon = new ArrayList<Connection>();
	static List<Connection> busycon = new ArrayList<Connection>();
	
	private ConPool()
	{
		System.out.println("creating new pool......");
		while(freecon.size() < mincon)
		{
			if((newcon = createNewCon()) != null)
			{
				try
				{
					freecon.add(newcon);
				} catch(Exception e){System.out.println("Error in creating new connection....");}
			}
		}
	}

	static public ConPool getInstance()
	{
		if (poolinstance == null)
		{
			poolinstance = new ConPool();
		}
		return poolinstance;
	}

	public synchronized Connection getCon()
	{
		if(!freecon.isEmpty())
		{
			Connection con = freecon.remove(0);
			busycon.add(con);
			return con;
		}
		else
		{
			if((freecon.size() + busycon.size()) < maxcon && !creatingnewcon)
			{
				try
				{
					createAdditionalCon();
				} catch(Exception e){System.out.println("Error in creating additional connection....");}
			}
			else
			{
				try
				{
					throw new Exception();
				} catch(Exception e){System.out.println("Max. connection limit reached....");}
			}
			try
			{
				wait();
			} catch(Exception e){}
			
			return getCon();
		}
	}
	
	private Connection createNewCon()
	{
    	try
    	{
    		Class.forName("com.mysql.jdbc.Driver");
    		return DriverManager.getConnection("jdbc:mysql://localhost:3306/ams", "root", "root");
    	} catch(Exception e){return null;}
	}
	
	private void createAdditionalCon()
	{
		creatingnewcon = true;
		new Thread(this).start();
	}
	
	public synchronized void freeCon(Connection con)
	{
		if(!busycon.isEmpty())
		{
			busycon.remove(con);
			freecon.add(con);
		}
		notifyAll();
	}
	
	public void run()
	{
		synchronized (this)
		{
			Connection con = createNewCon();
			if(con != null)
			{
				freecon.add(con);
				creatingnewcon = false;
				notifyAll();
			}
		}
	}
	
	public static synchronized void closeAllCon()
	{
		try
		{
			for(Connection conn : freecon)
				if(!conn.isClosed())
					conn.close();
			for(Connection conn : busycon)
				if(!conn.isClosed())
					conn.close();
			freecon.clear();
			busycon.clear();
			poolinstance = null;
			System.out.println("All connections closed...");
		} catch(Exception e){System.out.println("Error closing connections..." + e);}
	}
	

}
