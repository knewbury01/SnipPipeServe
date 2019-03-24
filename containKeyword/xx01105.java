|      private static String decryptedString(byte[] blob) {
        // here getSecretKey() should be the one used on encryption
        byte[] decrypted =  AppSecurity.decrypt(YourApplication.getSecretKey(),blob);
        return toString(decrypted);
