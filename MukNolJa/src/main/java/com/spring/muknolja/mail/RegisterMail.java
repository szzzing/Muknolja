package com.spring.muknolja.mail;

import java.io.UnsupportedEncodingException;
import java.util.Random;

import javax.mail.MessagingException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMessage.RecipientType;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.mail.MailException;
import org.springframework.mail.javamail.JavaMailSender;
import org.springframework.stereotype.Service;

@Service
public class RegisterMail implements MailServiceInter {

	@Autowired
	JavaMailSender emailsender; // Bean ����ص� MailConfig �� emailsender ��� �̸����� autowired

	private String ePw; // ������ȣ

	// ���� ���� �ۼ�
	@Override
	public MimeMessage createMessage(String to) throws MessagingException, UnsupportedEncodingException {
//		System.out.println("������ ��� : " + to);
//		System.out.println("���� ��ȣ : " + ePw);
		
		MimeMessage message = emailsender.createMimeMessage();

		message.addRecipients(RecipientType.TO, to);// ������ ���
		message.setSubject("GoodJob ȸ������ �̸��� ����");// ����

		String msgg = "";
		msgg += "<div style='margin:100px;'>";
		msgg += "<h1> </h1>";
		msgg += "<h1> MUKNOLJA</h1>";
		msgg += "<br>";
		msgg += "<p>먹놀자에 오신걸 환영합니다<p>";
		msgg += "<br>";
		msgg += "<div align='center' style='border:1px solid black; font-family:verdana';>";
		msgg += "<h3 style='color:blue;'>먹놀자 인증번호</h3>";
		msgg += "<div style='font-size:130%'>";
		msgg += "CODE : <strong>";
		msgg += ePw + "</strong><div><br/> "; // ���Ͽ� ������ȣ �ֱ�
		msgg += "</div>";
		message.setText(msgg, "utf-8", "html");// ����, charset Ÿ��, subtype
		// ������ ����� �̸��� �ּ�, ������ ��� �̸�
		message.setFrom(new InternetAddress("rlwo5454@naver.com", "MUKNOLJA_Admin"));// ������ ���

		return message;
	}

	// ���� ���� �ڵ� ����
	@Override
	public String createKey() {
		StringBuffer key = new StringBuffer();
		Random rnd = new Random();

		for (int i = 0; i < 8; i++) { // �����ڵ� 8�ڸ�
			int index = rnd.nextInt(5); // 

			switch (index) {
			case 0:
				key.append("a");
				// a~z (ex. 1+97=98 => (char)98 = 'b')
				break;
			case 1:
				key.append("b");
				// A~Z
				break;
			case 2:
				key.append("c");
				// 0~9
				break;
			case 3:
				key.append("d");
				// 0~9
				break;
			case 4:
				key.append("e");
				// 0~9
				break;
			}
		}

		return key.toString();
	}

	// ���� �߼�
	// sendSimpleMessage �� �Ű������� ���� to �� �� �̸��� �ּҰ� �ǰ�,
	// MimeMessage ��ü �ȿ� ���� ������ ������ ������ ��´�.
	// �׸��� bean ���� ����ص� javaMail ��ü�� ����ؼ� �̸��� send!!
	@Override
	public String sendSimpleMessage(String to) throws Exception {

		ePw = createKey(); // ���� ������ȣ ����

		// TODO Auto-generated method stub
		MimeMessage message = createMessage(to); // ���� �߼�
		try {// ����ó��
			emailsender.send(message);
		} catch (MailException es) {
			es.printStackTrace();
			throw new IllegalArgumentException();
		}


		return ePw; // ���Ϸ� ���´� ���� �ڵ带 ������ ��ȯ
	}
}
