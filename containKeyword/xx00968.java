|    SecretKey key = MacProvider.generateKey();
    byte[] keyBytes = key.getEncoded();
    
    String base64Encoded = TextCodec.BASE64.encode(keyBytes);
