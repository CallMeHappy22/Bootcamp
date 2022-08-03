package util;

import java.io.*;
import java.util.*;
import javax.mail.*;
import javax.mail.internet.*;

public class SendMail {

    public static final String USER = "lehongquan15a@gmail.com";
    public static final String PASS = "Qu@nlh99";

    public static void send(String to, String sub,
            String msg, final String user, final String pass) {
        //create an instance of Properties Class   
        Properties props = new Properties();

        /* Specifies the IP address of your default mail server
     	   for e.g if you are using gmail server as an email sever
           you will pass smtp.gmail.com as value of mail.smtp host. 
           As shown here in the code. 
           Change accordingly, if your email id is not a gmail id
         */
        props.put("mail.smtp.host", "smtp.gmail.com");
        //below mentioned mail.smtp.port is optional
        props.put("mail.smtp.port", "587");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.starttls.enable", "true");

        /* Pass Properties object(props) and Authenticator object   
           for authentication to Session instance 
         */
        Session session = Session.getInstance(props, new javax.mail.Authenticator() {
            @Override
            protected PasswordAuthentication getPasswordAuthentication() {
                return new PasswordAuthentication(user, pass);
            }
        });

        try {

            /* Create an instance of MimeMessage, 
 	      it accept MIME types and headers 
             */
            MimeMessage message = new MimeMessage(session);
            message.setFrom(new InternetAddress(user));
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(to));
            message.setSubject(sub);
            message.setContent(msg, "text/html");

            /* Transport class is used to deliver the message to the recipients */
            Transport.send(message);

        } catch (MessagingException e) {
            e.printStackTrace();
        }
    }

    public static void main(String[] args) {
        String subject = "Your order has been processing.";
        String message = "<!DOCTYPE html>\n"
                + "<html lang=\"en\">\n"
                + "\n"
                + "<head>\n"
                + "</head>\n"
                + "\n"
                + "<body>\n"
                + "    <h3 style=\"color: blue;\">Your order has been processing.</h3>\n"
                + "    <div>Full Name :Le Hong Quan</div>\n"
                + "    <div>Phone : 0866823499</div>\n"
                + "    <div>address : Vinh Hung, Vinh Loc, Thanh Hoa</div>\n"
                + "    <h3 style=\"color: blue;\">Thank you very much!</h3>\n"
                + "\n"
                + "</body>\n"
                + "\n"
                + "</html>";
        String user = "lehongquan15a@gmail.com";
        String pass = "Qu@nlh99";
        SendMail.send("anhng2610@gmail.com", subject, message, SendMail.USER, SendMail.PASS);
    }
}
