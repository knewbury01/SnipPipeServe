|    String password = "BestPasswordEver123!!";
    SecurityManager.HashMethod hashMethod = SecurityManager.getAppropriateHash();
    SecurityManager.getHashedPassword( hashMethod, password )
