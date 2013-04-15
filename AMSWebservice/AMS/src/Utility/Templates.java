package Utility;

public class Templates 
{
	public static String credentials(String username, String password)
	{
		String content = "<h1>Login Credentials</h1>" +
						  "Username: " + username + "<br>" +
						  "Password: " + password + "<br><br>" +
						  "Click <a href=\"http://localhost:8080/AMSClient/View/customerLogin.jsp\" >here</a> to login.";
		return content;
	}
}
