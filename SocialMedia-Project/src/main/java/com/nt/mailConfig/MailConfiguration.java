package com.nt.mailConfig;

import java.util.Date;
import java.util.Random;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.MimeMessageHelper;
import org.springframework.stereotype.Component;

import jakarta.mail.internet.MimeMessage;

@Configuration
@Component
public class MailConfiguration {
	
	@Autowired
	private JavaMailSender sender;
	@Value("${spring.mail.username}")
	private String from;
	

	public Integer sendOtp(String email) throws Exception{
		//System.out.println("OtpService.sendOtp()");
		Integer otp=generateOtp();
		String msg="Your Otp For Register Social Media Project "+otp;
		MimeMessage message=sender.createMimeMessage();
		MimeMessageHelper helper=new MimeMessageHelper(message,false);
		
		helper.setSentDate(new Date());
		helper.setFrom(from);
		helper.setTo(email);
		helper.setSubject("Open it to know it");
		// set multipart body
		helper.setText(msg);
		//helper.addAttachment("image.jpg", new ClassPathResource("image.jpg"));
		sender.send(message);
		System.out.println("Mail Was Sent to "+email);
		return otp;
	}
	
	
	
	public Integer generateOtp() {
		//System.out.println("Helper.generateOtp()");
		 Random rand = new Random();
	        int number = 100000 + rand.nextInt(900000); // ensures it's always 6 digits
	       // System.out.println("Random 6-digit number: " + number);
	        
	        return number;
	}
}
