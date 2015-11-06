package at.fes.vo;

import java.security.MessageDigest;

public class Encryptor {
	public static String doOneWayEncrypt(String data){
			
			
			 try{
		            MessageDigest digest = MessageDigest.getInstance("SHA-1");
		            byte[] hash = digest.digest(data.getBytes("UTF-8"));
		            StringBuffer hexString = new StringBuffer();
	
		            for (int i = 0; i < hash.length; i++) {
		                String hex = Integer.toHexString(0xff & hash[i]);
		                if(hex.length() == 1) hexString.append('0');
		                hexString.append(hex);
		            }
	
		        return hexString.toString();
		    } catch(Exception ex){
		       throw new RuntimeException(ex);
		    }
		}}

