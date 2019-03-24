|    String desKey = "0123456789abcdef0123456789abcdef0123456789abcdef"; // user value (24 bytes)  
    byte[] keyBytes = DatatypeConverter.parseHexBinary(desKey);
    SecretKeyFactory factory = SecretKeyFactory.getInstance("DESede");
    SecretKey key = factory.generateSecret(new DESedeKeySpec(keyBytes));
