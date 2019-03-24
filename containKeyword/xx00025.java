|      SecureRandom rnd = new SecureRandom();
      /* Byte array length is multiple of LCM(log2(64), 8) / 8 = 3. */
      byte[] password = new byte[18];
      rnd.nextBytes(password);
      String encoded = Base64.encode(password);
