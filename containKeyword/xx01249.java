|    public static void main(String[] args) throws UnsupportedEncodingException {
       AESKeyGenerator aes = new AESKeyGenerator();
       String sharedKey = "Bar12345Bar12345Bar12345Bar12345";
       aes.generate_r(sharedKey.getBytes("US-ASCII"), "Hello World");
    }
