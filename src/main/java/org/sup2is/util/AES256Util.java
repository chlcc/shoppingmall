package org.sup2is.util;

import java.nio.charset.Charset;
import java.security.InvalidAlgorithmParameterException;
import java.security.InvalidKeyException;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

import javax.crypto.BadPaddingException;
import javax.crypto.Cipher;
import javax.crypto.IllegalBlockSizeException;
import javax.crypto.NoSuchPaddingException;
import javax.crypto.SecretKey;
import javax.crypto.spec.IvParameterSpec;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

public class AES256Util {
    private static final Logger logger = LoggerFactory.getLogger(AES256Util.class);
    private static Cipher cipher;
    private static Cipher decipher;

    static {
        try {
            final String algorithm = "AES/CBC/PKCS5Padding";
            final byte[] iv = Base64.getDecoder().decode("8n2cmSdya87+dRCxvdPRNw==");
            final IvParameterSpec spec = new IvParameterSpec(iv);

            final SecretKey secretKey = new SecretKey() {
                final byte[] keyBytes = Base64.getDecoder().decode("iR+nEJ0On0HzMWofvbo7Xg==");

                @Override
                public String getAlgorithm() {
                    return "AES";
                }

                @Override
                public String getFormat() {
                    return "RAW";
                }

                @Override
                public byte[] getEncoded() {
                    return keyBytes;
                }
            };

            cipher = Cipher.getInstance(algorithm);
            cipher.init(Cipher.ENCRYPT_MODE, secretKey, spec);

            decipher = Cipher.getInstance(algorithm);
            decipher.init(Cipher.DECRYPT_MODE, secretKey, spec);

        } catch (NoSuchAlgorithmException | NoSuchPaddingException | InvalidKeyException | InvalidAlgorithmParameterException e) {
            logger.error(e.getMessage(), e);
        }
    }

    public static String encrypt(String plainText) throws BadPaddingException, IllegalBlockSizeException {
        byte[] bytes = cipher.doFinal(plainText.getBytes(Charset.defaultCharset()));
        return Base64.getEncoder().encodeToString(bytes);
    }

    public static String decrypt(String cipherText) throws BadPaddingException, IllegalBlockSizeException {
    	
        byte[] bytes = decipher.doFinal(Base64.getDecoder().decode(cipherText));
        return new String(bytes, Charset.defaultCharset());
    }
}
