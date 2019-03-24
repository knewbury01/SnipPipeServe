|    //creates a 256-bit secure-random key:
    MacProvider.generateKey(SignatureAlgorithm.HS256);
    
    //creates a 384-bit secure-random key:
    MacProvider.generateKey(SignatureAlgorithm.HS384);
    
    //creates a 512-bit secure-random key (the default):
    MacProvider.generateKey();
