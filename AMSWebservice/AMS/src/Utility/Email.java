package Utility;

import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;
import javax.activation.*;

public class Email
{
   public static void sendEmail(String from, String[] to, String subject, String content) throws Exception
   {  System.out.println("1111111111111111111111");
	    String host = "smtp.gmail.com";
	    String pass = "mast#odon$t4";
	    Properties props = System.getProperties();
	    System.out.println("222222222222222");
	    props.put("mail.smtp.starttls.enable", "true"); // added this line
	    System.out.println("333333333333333");
	    props.put("mail.smtp.host", host);
	    props.put("mail.smtp.user", from);
	    props.put("mail.smtp.password", pass);
	    props.put("mail.smtp.port", "587");
	    props.put("mail.smtp.auth", "true");
	    System.out.println("4444444444444");


	    Session session = Session.getDefaultInstance(props, null);
	    System.out.println("55555555555555");
	    
	    
	    System.out.println("1111111111111111111111");
	    MimeMessage message = new MimeMessage(session);
	      message.setSubject(subject);

	      MimeBodyPart textPart = new MimeBodyPart();
	      textPart.setContent(content, "text/html");

/*	      MimeBodyPart attachFilePart = new MimeBodyPart();
	      FileDataSource fds = 
	          new FileDataSource("SimpleMailWithAttachment.java");
	      attachFilePart.setDataHandler(new DataHandler(fds));
	      attachFilePart.setFileName(fds.getName());*/

	      Multipart mp = new MimeMultipart();
	      mp.addBodyPart(textPart);

	     	    
	    
	    InternetAddress[] toAddress = new InternetAddress[to.length];
	    System.out.println("22222222222222");
	    // To get the array of addresses
	    for( int i=0; i < to.length; i++ ) { // changed from a while loop
	        toAddress[i] = new InternetAddress(to[i]);
	    }
	    System.out.println(Message.RecipientType.TO);
	    System.out.println("3333333333333333");
	    for( int i=0; i < toAddress.length; i++) { // changed from a while loop
	        message.addRecipient(Message.RecipientType.TO, toAddress[i]);
	    }System.out.println("444444444444");
	    //message.setSubject("sending in a group");
	    message.setContent(mp);
	    //message.setText("Welcome to JavaMail");
	    Transport transport = session.getTransport("smtp");
	    transport.connect(host, from, pass);
	    System.out.println("5555555555555555");
	    transport.sendMessage(message, message.getAllRecipients());
	    System.out.println("6666666666666");
	    transport.close();
   }
}