package utils;

import java.util.Random;

public class VerificationCodeUtils {
	private static final int CODE_LENGTH = 6;

	private VerificationCodeUtils() {
	}

	public static String generateVerificationCode() {
		StringBuilder code = new StringBuilder(CODE_LENGTH);
		Random random = new Random();

		for (int i = 0; i < CODE_LENGTH; i++) {
			int digit = random.nextInt(10);
			code.append(digit);
		}
		return code.toString();
	}

	public static boolean verifyCode(String userInput, String generatedCode) {
		return userInput.equals(generatedCode);
	}
}
