package co.four.study.common;

import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;

public class Sha256 {
	public static String encrypt(String text) {
		MessageDigest md = null;
		try {
			md = MessageDigest.getInstance("SHA-256");
			md.update(text.getBytes());
		} catch (NoSuchAlgorithmException e) {
			e.printStackTrace();
		}
		return bytesToHex(md.digest());
	}

	private static String bytesToHex(byte[] digest) {
		StringBuilder builder = new StringBuilder();
		for (byte b : digest) {
			builder.append(String.format("%02x", b));
		}
		return builder.toString();
	}
}