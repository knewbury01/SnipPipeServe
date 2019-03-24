|     private static byte[] encryptedByte(String s) {
        return AppSecurity.encrypt(YourApplication.getSecretKey(),toBytes(s));
     }
