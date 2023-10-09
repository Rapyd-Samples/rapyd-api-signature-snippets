public static String generateSignature(String httpMethod, String urlPath, String salt, String timestamp, String accessKey, String secretKey, String body) {
        try {
            String toSign = httpMethod + urlPath + salt + timestamp + accessKey + secretKey + body;

            String StrhashCode = hmacDigest(toSign, secretKey, "HmacSHA256");

            String signature = Base64.getEncoder().encodeToString(StrhashCode.getBytes());

            return signature;
        } catch (Exception e) {
            e.printStackTrace();
        }

        return null;
    }

public static String hmacDigest(String msg, String keyString, String algo) {
    String digest = null;
    try {
        SecretKeySpec key = new SecretKeySpec((keyString).getBytes("ASCII"), algo);
        Mac mac = Mac.getInstance(algo);
        mac.init(key);

        byte[]bytes = mac.doFinal(msg.getBytes("UTF-8"));

        StringBuffer hash = new StringBuffer();
        for (int i = 0; i < bytes.length; i++) {
            String hex = Integer.toHexString(0xFF & bytes[i]);
            if (hex.length() == 1) {
                hash.append('0');
            }
            hash.append(hex);
        }
        digest = hash.toString();
    } catch (Exception e) {
        e.printStackTrace();
    }

    return digest;
}
