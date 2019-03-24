|    String aesKey = "0123456789abcdef0123456789abcdef"; // user value (16/24/32 bytes)
    byte[] keyBytes = DatatypeConverter.parseHexBinary(aesKey);
    SecretKey key = new SecretKeySpec(keyBytes, "AES"); 
