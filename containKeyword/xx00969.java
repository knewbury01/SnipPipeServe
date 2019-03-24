|    Jwts.builder()
        //...
        .signWith(SignatureAlgorithm.HS512, base64Encoded)
        .compact();
