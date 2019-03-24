|    KeyStore ks = KeyStore.getInstance("JKS");
    InputStream readStream = new FileInputStream(filePathToStore);
    ks.load(readStream, keystorePasswordCharArray);
    Key key = ks.getKey("keyAlias", passwordForKeyCharArray);
    readStream.close();
