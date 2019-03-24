|    CertificateFactory f = CertificateFactory.getInstance("X.509");
        X509Certificate loadedCaCert = (X509Certificate) f
                .generateCertificate(CertificateGenerator.class.getResourceAsStream("/ca.pem"));
