|    import java.io.FileOutputStream;
    import java.security.KeyStore;
    import java.security.cert.X509Certificate;
    
    ....
    
    X509Certificate cert = // your certificate...
    // generate a keystore instance
    KeyStore ks = KeyStore.getInstance("PKCS12");
    // save your cert inside the keystore
    ks.setCertificateEntry("YourCertAlias", cert);
    // create the outputstream to store the keystore
    FileOutputStream fos = new FileOutputStream("/your_path/keystore.pfx");
    // store the keystore protected with password
    ks.store(fos, "yourPassword".toCharArray());
    
    ....
