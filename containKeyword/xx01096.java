|    FileInputStream fin = new FileInputStream("PathToCertificate");
    CertificateFactory f = CertificateFactory.getInstance("X.509");
    X509Certificate certificate = (X509Certificate)f.generateCertificate(fin);
    PublicKey pk = certificate.getPublicKey();
  
