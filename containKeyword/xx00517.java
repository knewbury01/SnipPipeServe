|    KeyStore ks = KeyStore.getInstance("JKS");
    ks.setKeyEntry("keyAlias", key, passwordForKeyCharArray, certChain);
    OutputStream writeStream = new FileOutputStream(filePathToStore);
    ks.store(writeStream, keystorePasswordCharArray);
    writeStream.close();
