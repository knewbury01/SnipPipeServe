|    byte[] key = pbkdf2(password, salt, 1000, 16)
    Mac mac = Mac.getInstance("HmacSHA1");
    mac.init(new SecretKeySpec(key, "HmacSHA1");
       
    byte[] macResult = mac.doFinal(...);
