|    SecureRandom rnd = new SecureRandom();
    /* Bit length is multiple of log2(32) = 5. */
    String encoded = new BigInteger(130, rnd).toString(32); 
