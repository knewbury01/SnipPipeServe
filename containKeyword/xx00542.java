|    public bool isUnlimitedKeyStrength() {
        return Cipher.getMaxAllowedKeyLength("AES") == Integer.MAX_VALUE;
    }
