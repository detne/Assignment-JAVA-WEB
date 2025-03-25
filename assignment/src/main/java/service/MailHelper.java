package service;

import java.io.IOException;
import java.util.Properties;

import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

public class MailHelper {
	final static String username = "projectapartment@gmail.com";//your email id
    final static String password = "qnwb zznk duhr ogmw";// your password

	 public static void MailHelper(String email, String subject, String final_Text) {
		 Properties props = new Properties();
	        props.put("mail.smtp.auth", true);
	        props.put("mail.smtp.starttls.enable", true);
	        props.put("mail.smtp.host", "smtp.gmail.com");
	        props.put("mail.smtp.port", "587");
		 Session session = Session.getInstance(props,
	              new javax.mail.Authenticator() {
	                  @Override
	                  protected PasswordAuthentication getPasswordAuthentication() {
	                      return new PasswordAuthentication(username, password);
	                  }
	              });
	      try {
	          Message message = new MimeMessage(session);
	          message.setFrom(new InternetAddress(username));
	          message.setRecipients(Message.RecipientType.TO, InternetAddress.parse(email));
	          MimeBodyPart textPart = new MimeBodyPart();
	          Multipart multipart = new MimeMultipart();
	          textPart.setContent(final_Text, "text/html; charset=utf-8");
	          message.setSubject(subject);
	          multipart.addBodyPart(textPart);
	          message.setContent(multipart);
	          message.setSubject(subject);
	          //out.println("Sending");
	          Transport.send(message);
	        
	      } catch (Exception e) {
	          
	      }
	  
	 }
	  public static String getTextFromMessage(Message message) throws MessagingException, IOException {
	        String result = "";
	        if (message.isMimeType("text/html")) {
	            // Return HTML content directly
	            result = (String) message.getContent();
	        } else if (message.isMimeType("multipart/*")) {
	            MimeMultipart mimeMultipart = (MimeMultipart) message.getContent();
	            result = getTextFromMimeMultipart(mimeMultipart);
	        } else if (message.isMimeType("text/plain")) {
	            // For plain text, return as is
	            result = message.getContent().toString();
	        }
	        return result;
	    }

	    public static String getTextFromMimeMultipart(MimeMultipart mimeMultipart) throws MessagingException, IOException {
	        StringBuilder result = new StringBuilder();
	        int count = mimeMultipart.getCount();
	        String htmlContent = null;
	        String plainTextContent = null;

	        for (int i = 0; i < count; i++) {
	            BodyPart bodyPart = mimeMultipart.getBodyPart(i);
	            if (bodyPart.isMimeType("text/html")) {
	                htmlContent = (String) bodyPart.getContent();
	            } else if (bodyPart.isMimeType("text/plain")) {
	                plainTextContent = bodyPart.getContent().toString();
	            } else if (bodyPart.getContent() instanceof MimeMultipart) {
	                result.append(getTextFromMimeMultipart((MimeMultipart) bodyPart.getContent()));
	            }
	        }

	        // Prefer HTML content over plain text if available
	        return (htmlContent != null) ? htmlContent : (plainTextContent != null) ? plainTextContent : result.toString();
	    }
	
}
