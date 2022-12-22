package com.spring.muknolja.mail;

import java.util.Properties;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.mail.javamail.JavaMailSenderImpl;

@Configuration
public class MailConfig {
	
		@Bean
		public JavaMailSender JavaMailService() {
			JavaMailSenderImpl javaMailSender = new JavaMailSenderImpl();
			
			javaMailSender.setHost("smtp.naver.com");// ������
			javaMailSender.setUsername("rlwo5454");//���̹� ���̵�
			javaMailSender.setPassword("Junegemini11..");//���̹� ��й�ȣ
			
			javaMailSender.setPort(465); // ���� ��Ʈ
			
			javaMailSender.setJavaMailProperties(getMailProperties());
			
			return javaMailSender;
		}
		private Properties getMailProperties() {
			Properties properties = new Properties();
			properties.setProperty("mail.transport.protocol", "smtp");//����Ʈ�ݼ���
			properties.setProperty("mail.smpt.auth", "true");//smtp����
			properties.setProperty("mail.smtp.starttls.enable", "true");//
			properties.setProperty("mail.debug", "true");//����׻��
			properties.setProperty("mail.smtp.ssl.trust","smtp.naver.com");//ssl����
			properties.setProperty("mail.smtp.ssl.enable","true");//ssl���
			return properties;
		}

}
