package Utility;

import java.rmi.RemoteException;
import java.util.Random;
import Connection.*;

public class GenerateUserCredentials 
{
	public static String getUserName(String firstname, String lastname)
	{
		return firstname.toLowerCase() + "." + lastname.toLowerCase();
	}
	
	public static String setPassword(DBConnect con, String username, String pid) throws RemoteException
	{
		String letters = "abcdefghijklmnopqrstuvwxyz0123456789ABCDEFGHIJKLMNOPQRSTUVWXYZ";
		String password = "";
		while(true)
		{
			for(int i=0;i<7;i++)
				password = password.concat(String.valueOf(letters.charAt(new Random().nextInt(62))));
			if(con.checkCredentials(username, password, pid))
				break;
			else
				password = "";
			
		}
		return password;
	}
}
