package com.mailservice;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.io.InputStream;
import java.io.OutputStreamWriter;
import java.util.Properties;

import javax.activation.DataHandler;
import javax.activation.DataSource;
import javax.activation.FileDataSource;
import javax.mail.BodyPart;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.Multipart;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.AddressException;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeBodyPart;
import javax.mail.internet.MimeMessage;
import javax.mail.internet.MimeMultipart;

/**
 * The MailUtil Class allows the application to send mail using Java Mail API.
 * If the mail could not be sent via Java Mail, the native Unix mailx command is
 * used to send the mail
 * <p>
 * An application cannot create its own instance of this class. All the methods
 * are static and can be invoked directly with the class name.
 * 
 * @author Jayapriyan, Vittobane
 * @since JDK1.7
 */

public class MailUtil {

	/** Don't let anyone else instantiate this class */
	private MailUtil() {
	}

	/**
	 * Sends a mail with the given input parameters
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMail(from, to, subject, message)</tt> behaves in exactly the same
	 * way as the invocation <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, message, null, false, null, null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            Mail message (optional if subject is present).
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMail(String from, String to, String subject,
			String message) throws AddressException, MessagingException,
			IOException {
		return sendMail(from, to, subject, message, null, false, null, null);
	}

	/**
	 * Sends a mail with the given input parameters
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMail(from, to, subject, message, cc)</tt> behaves in exactly the
	 * same way as the invocation
	 * <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, message, cc, false, null, null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            Mail message (optional if subject is present).
	 * 
	 * @param cc
	 *            Carbon Copy address(es) to which mail is required to sent.
	 *            Multiple addresses are separated with commas.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMail(String from, String to, String subject,
			String message, String cc) throws AddressException,
			MessagingException, IOException {
		return sendMail(from, to, subject, message, cc, false, null, null);
	}

	/**
	 * Sends a mail with the given input parameters
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMail(from, to, subject, fileReader)</tt> behaves in exactly the
	 * same way as the invocation
	 * <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, readFile(fileReader), null, false,
				null, null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param fileReader
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMail(String from, String to, String subject,
			FileReader fileReader) throws AddressException, MessagingException,
			IOException {
		return sendMail(from, to, subject, readFile(fileReader), null, false,
				null, null);
	}

	/**
	 * Sends a mail with the given input parameters
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMail(from, to, subject, fileReader, cc)</tt> behaves in exactly
	 * the same way as the invocation
	 * <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, readFile(fileReader), cc, false,
				null, null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param fileReader
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param cc
	 *            Carbon Copy address(es) to which mail is required to sent.
	 *            Multiple addresses are separated with commas.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMail(String from, String to, String subject,
			FileReader fileReader, String cc) throws AddressException,
			MessagingException, IOException {
		return sendMail(from, to, subject, readFile(fileReader), cc, false,
				null, null);
	}

	/**
	 * Sends a mail with the given input parameters attaching the given file
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMailWithAttachment(from, to, subject, message, attachFileName)</tt>
	 * behaves in exactly the same way as the invocation
	 * <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, message, null, true, attachFileName,
				null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param attachFileName
	 *            Name of the file to be attached.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */
	public static String sendMailWithAttachment(String from, String to,
			String subject, String message, String attachFileName)
			throws AddressException, MessagingException, IOException {
		return sendMail(from, to, subject, message, null, true, attachFileName,
				null);
	}

	/**
	 * Sends a mail with the given input parameters attaching the given file
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMailWithAttachment(from, to,
			subject, message, attachFileName, cc)</tt> behaves in exactly the same
	 * way as the invocation <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, message, cc, true, attachFileName,
				null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param attachFileName
	 *            Name of the file to be attached.
	 * 
	 * @param cc
	 *            Carbon Copy address(es) to which mail is required to sent.
	 *            Multiple addresses are separated with commas.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMailWithAttachment(String from, String to,
			String subject, String message, String attachFileName, String cc)
			throws AddressException, MessagingException, IOException {
		return sendMail(from, to, subject, message, cc, true, attachFileName,
				null);
	}

	/**
	 * Sends a mail with the given input parameters attaching the given file
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMailWithAttachment(from, to,
			subject, FileReader fileReader,attachFileName)</tt> behaves in exactly
	 * the same way as the invocation
	 * <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, readFile(fileReader), null, true,
				attachFileName, null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param attachFileName
	 *            Name of the file to be attached.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMailWithAttachment(String from, String to,
			String subject, FileReader fileReader, String attachFileName)
			throws AddressException, MessagingException, IOException {
		return sendMail(from, to, subject, readFile(fileReader), null, true,
				attachFileName, null);
	}

	/**
	 * Sends a mail with the given input parameters attaching the given file
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMailWithAttachment(from, to,
			subject, fileReader, attachFileName,
			cc)</tt> behaves in exactly the same way as the invocation
	 * <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(from, to, subject, readFile(fileReader), cc, true,
				attachFileName, null);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param attachFileName
	 *            Name of the file to be attached.
	 * 
	 * @param cc
	 *            Carbon Copy address(es) to which mail is required to sent.
	 *            Multiple addresses are separated with commas.
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMailWithAttachment(String from, String to,
			String subject, FileReader fileReader, String attachFileName,
			String cc) throws AddressException, MessagingException, IOException {
		return sendMail(from, to, subject, readFile(fileReader), cc, true,
				attachFileName, null);
	}

	/**
	 * Sends a mail with the given input parameters
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMail(properties)</tt> behaves in exactly the same way as the
	 * invocation <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(null, null, null, null, null, false, null, properties);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param attachFileName
	 *            Name of the file to be attached.
	 * 
	 * @param cc
	 *            Carbon Copy address(es) to which mail is required to sent.
	 *            Multiple addresses are separated with commas.
	 * @param properties
	 *            Properties object as input which contain all the required mail
	 *            properties
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 * @throws AddressException
	 *             If an error occurs in the address
	 * @throws MessagingException
	 *             If an Message error occurs
	 * @throws IOException
	 *             If an I/O error occurs
	 * 
	 */

	public static String sendMail(Properties properties)
			throws AddressException, MessagingException, IOException {
		return sendMail(null, null, null, null, null, false, null, properties);
	}

	/**
	 * Core Send mail functionality
	 * 
	 * <p>
	 * This is a convenience method. An invocation of the form
	 * <tt>sendMail(properties)</tt> behaves in exactly the same way as the
	 * invocation <tt>{@link #sendMail(String , String , String ,
			String , String , boolean , String ,
			Properties ) sendMail}(null, null, null, null, null, false, null, properties);</tt>.
	 * 
	 * @param from
	 *            From address from which mail is sent.
	 * 
	 * @param to
	 *            To address(es) to which mail is required to sent. Multiple
	 *            addresses are separated with commas.
	 * 
	 * @param subject
	 *            Mail subject (optional if message is present).
	 * 
	 * @param message
	 *            java.io.FileReader object representing the file to be read.
	 * 
	 * @param cc
	 *            Carbon Copy address(es) to which mail is required to sent.
	 *            Multiple addresses are separated with commas.
	 * 
	 * @param attachment
	 *            Boolean value which specifies whether attachment exist or not.
	 * 
	 * @param attachFileNames
	 *            Name(s) of the file to be attached.
	 * 
	 * @param properties
	 *            Properties object as input which contain all the required mail
	 *            properties
	 * 
	 * @return A {@link java.lang.String} representing the status of the mail
	 *         delivery
	 * 
	 */

	public static String sendMail(String from, String to, String subject,
			String message, String cc, boolean attachment,
			String attachFileNames, Properties properties) {
		String retmessage = "Unable To Send The Mail - Check The Configuration In The Mail Properties File";
		InputStream input = null;
		String host = "localhost";
		String port = "25";

		try {

			if (properties != null) { // Check If User Defined Property File
				host = (properties.getProperty("HOST") != null) ? properties
						.getProperty("HOST") : "";
				port = (properties.getProperty("PORT") != null) ? properties
						.getProperty("PORT") : "";
				from = (properties.getProperty("FROM") != null) ? properties
						.getProperty("FROM") : "";
				to = (properties.getProperty("TO") != null) ? properties
						.getProperty("TO") : "";
				subject = (properties.getProperty("SUBJECT") != null) ? properties
						.getProperty("SUBJECT") : "";
				message = (properties.getProperty("MESSAGE") != null) ? properties
						.getProperty("MESSAGE") : "";
				cc = (properties.getProperty("CC") != null) ? properties
						.getProperty("CC") : "";
				attachFileNames = (properties.getProperty("ATTACHMENT") != null) ? properties
						.getProperty("ATTACHMENT") : "";

				if (attachFileNames != null && !"".equals(attachFileNames))
					attachment = true;

			} else { // Read from mail.properties

				File f = new File("mail.properties");
				if (f.exists() && !f.isDirectory()) {

					properties = new Properties();

					input = new FileInputStream("mail.properties");

					properties.load(input);
					host = properties.getProperty("HOST");
					if (host == null || "".equals(host))
						host = "localhost";
					port = properties.getProperty("PORT");
					if (port == null || "".equals(port))
						port = "25";
				}

			}

			if (from != null && "".equals(from) && !"@".contains(from)) {
				retmessage = "Invalid From Address";
				return retmessage;
			}
			if (to != null && "".equals(to) && !"@".contains(to)) {
				retmessage = "Invalid To Address";
				return retmessage;
			}

			if (subject == null)
				subject = "";

			if (message == null)
				message = "";

			if (cc == null)
				cc = "";

			// Either Message or Subject is required to send a valid mail
			if ("".equals(message) || "".equals(subject)) {
				retmessage = "No Message/Subject Content";
				return retmessage;
			}

			// Get the session object

			properties = System.getProperties();

			properties.setProperty("mail.smtp.host", host);
			properties.put("mail.smtp.port", port);

			Session session = Session.getDefaultInstance(properties);

			MimeMessage mimeMessage = new MimeMessage(session);
			mimeMessage.setFrom(new InternetAddress(from));
			mimeMessage.addRecipients(Message.RecipientType.TO,
					InternetAddress.parse(to));
			if (!"".equals(cc))
				mimeMessage.addRecipients(Message.RecipientType.CC,
						InternetAddress.parse(cc));

			mimeMessage.setSubject(subject);

			/* Attachment */
			if (attachment) {
				String attachFileList[] = attachFileNames.split(",");

				BodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setText(message);

				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);
				messageBodyPart = new MimeBodyPart();
				for (String attachFileName : attachFileList)
					addAttachment(multipart, attachFileName);
				mimeMessage.setContent(multipart);
			} else {
				BodyPart messageBodyPart = new MimeBodyPart();
				messageBodyPart.setText(message);
				Multipart multipart = new MimeMultipart();
				multipart.addBodyPart(messageBodyPart);
				mimeMessage.setText(message);
			}

			Transport.send(mimeMessage);
			retmessage = "Mail Sent Successfully Via Java Mail";
		} catch (FileNotFoundException e) {
			e.printStackTrace();
		} catch (IOException e) {
			e.printStackTrace();
		} catch (MessagingException e) {
			e.printStackTrace();
		} catch (Exception e) {
			retmessage = "Unable To Send The Java Mail";
			e.printStackTrace();
		}

		/* Try to use the Native Mail Support */
		if ("Unable To Send The Java Mail".equals(retmessage)) {

			// Trying to send using mailx Utility, however could not attach the
			// file

			Process process;
			try {
				if ("".equals(cc)) {
					String[] args = { "mailx", "-r " + from, "-s " + subject,
							to };

					process = Runtime.getRuntime().exec(args);

				} else {
					String[] args = { "mailx", "-c " + cc, "-r " + from,
							"-s " + subject, to };
					process = Runtime.getRuntime().exec(args);
				}

				OutputStreamWriter osw = new OutputStreamWriter(
						process.getOutputStream());

				StringBuilder emailBuff = new StringBuilder();
				emailBuff.append(message);
				osw.write(emailBuff.toString());
				osw.close();
				retmessage = "Mail Sent Successfully Via Unix Mailx Utility";
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return retmessage;

	}

	/**
	 * Utility to attach the file
	 * 
	 * @param multipart
	 *            Multipart object to which the file has to attached.
	 * @param filename
	 *            Attachment File name.
	 * @return void
	 * 
	 */
	private static void addAttachment(Multipart multipart, String filename)
			throws MessagingException {
		DataSource source = new FileDataSource(filename);
		BodyPart messageBodyPart = new MimeBodyPart();
		messageBodyPart.setDataHandler(new DataHandler(source));
		messageBodyPart.setFileName(filename);
		multipart.addBodyPart(messageBodyPart);
	}

	/**
	 * Utility method to read the file
	 * 
	 * @param fileReader
	 *            FileReader object from which the file contents has to be read.
	 * @return A {@link java.lang.String} representing the message
	 * 
	 */
	private static String readFile(FileReader fileReader) {
		StringBuilder message = new StringBuilder();
		String line = "";
		BufferedReader bufferedReader = new BufferedReader(fileReader);
		try {
			while ((line = bufferedReader.readLine()) != null)
				message.append(line + "\n");
		} catch (IOException e) {
			e.printStackTrace();
		} finally {
			try {
				bufferedReader.close();
			} catch (IOException e) {
				e.printStackTrace();
			}
		}
		return message.toString();
	}

	/**
	 * Main method
	 * 
	 * @param args
	 *            Command line arguments.
	 * @throws IOException 
	 * @throws MessagingException 
	 * @throws AddressException 
	 * 
	 */
	public static void main(String[] args) throws AddressException, MessagingException, IOException {
	
 
	}
}
