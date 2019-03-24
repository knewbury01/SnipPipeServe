|    String desKey = "0123456789abcdef"; // value from user  
    byte[] keyBytes = DatatypeConverter.parseHexBinary(desKey);
    SecretKeyFactory factory = SecretKeyFactory.getInstance("DES");
    SecretKey key = factory.generateSecret(new DESKeySpec(keyBytes));
