|     KeyFactory keyFactory = KeyFactory.getInstance("RSA");
     X509EncodedKeySpec pubKeySpec 
         = new X509EncodedKeySpec(keyBytes);
     PublicKey pubKey = keyFactory.generatePublic(pubKeySpec);
