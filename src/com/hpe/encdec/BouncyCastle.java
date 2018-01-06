package com.hpe.encdec;

import java.security.Security; 

import javax.crypto.Cipher;
import javax.crypto.spec.IvParameterSpec;
import javax.crypto.spec.SecretKeySpec;

import org.bouncycastle.jce.provider.BouncyCastleProvider;

public class BouncyCastle {
	
	
	static{
		Security.addProvider(new BouncyCastleProvider());
	}
	
	byte [] key;
	byte [] vector;
		
	public BouncyCastle() {
		super();
	}

	public BouncyCastle(String configkey, String configvector) {
		// TODO Auto-generated constructor stub
		System.out.println(configkey + " : " +  configvector);
		this.key = configkey.getBytes();
		this.vector = configvector.getBytes();
		System.out.println(this.key + " : " +  this.vector);
	}
		
	public String encrypt(String plainText) throws Exception{
				
	      byte[] plaintext = plainText.getBytes();
	    
	      Cipher c3des = Cipher.getInstance("DESede/CBC/PKCS7Padding");
	      SecretKeySpec    myKey = new SecretKeySpec(key, "DESede");
	      IvParameterSpec ivspec = new IvParameterSpec(vector);
	    
	      c3des.init(Cipher.ENCRYPT_MODE, myKey, ivspec);
	      byte[] cipherText = c3des.doFinal(plaintext);
	    
	      return new sun.misc.BASE64Encoder().encode(cipherText);
	}
	
	public String decrypt(String encryptedText) throws Exception{
	      byte[] enctext = new sun.misc.BASE64Decoder().decodeBuffer(encryptedText);

	      Cipher c3des = Cipher.getInstance("DESede/CBC/PKCS7Padding");
	      SecretKeySpec    myKey = new SecretKeySpec(key, "DESede");
	      IvParameterSpec ivspec = new IvParameterSpec(vector);

	      c3des.init(Cipher.DECRYPT_MODE, myKey, ivspec);
	      byte[] cipherText = c3des.doFinal(enctext);

	      return new String(cipherText);
	}
	
	public static void main(String[] args) throws Exception {
		
		BouncyCastle b = new BouncyCastle("4%qUC@/nWbF|>HfZ)}fFh{^,","xNr7FC{T");
		System.out.println(b.decrypt("zjKjKARQMDn9tfI4jlHgKA=="));
		
	}
}
