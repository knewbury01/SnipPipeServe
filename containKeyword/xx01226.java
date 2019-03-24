|        KeyManagerFactory kmf = //... Initialise a KMF with your server's keystore
        TrustManagerFactory tmf = TrustManagerFactory
            .getInstance(TrustManagerFactory.getDefaultAlgorithm());
        tmf.init((KeyStore) null); // Use the default trust store
        TrustManager[] trustManagers = tmf.getTrustManagers();
        final X509TrustManager origTrustManager = (X509TrustManager) trustManagers[0];
        final X509Certificate caCert = // Load your test CA certificate here.
        X509TrustManager fakeTrustManager = new X509TrustManager() {
            public void checkClientTrusted(X509Certificate[] chain,
                    String authType) throws CertificateException {
                // Key the behaviour of the default trust manager.
                origTrustManager.checkClientTrusted(chain, authType);
            }
            public void checkServerTrusted(X509Certificate[] chain,
                    String authType) throws CertificateException {
                // Key the behaviour of the default trust manager.
                origTrustManager.checkServerTrusted(chain, authType);
            }
            public X509Certificate[] getAcceptedIssuers() {
                // This is only used for sending the list of acceptable CA DNs.
                return new X509Certificate[] { caCert };
            }
        };
        trustManagers = new X509TrustManager[] { fakeTrustManager };
        SSLContext sslContext = SSLContext.getInstance("TLS");
        sslContext.init(kmf.getKeyManagers(), trustManagers, null);
    In this case, the `Certificate Request` message sent by the server should contain the your test CA's DN. However, that CA isn't actually trusted by the trust manager, which still uses the default values.
    The client will send its certificate, but the server will reject it, saying "javax.net.ssl.SSLHandshakeException: sun.security.validator.ValidatorException: PKIX path validation failed", and this will end the connection. This is at least the implementation using the SunJSSE provider, using the PKIX or SunX509 trust managers. This is also consistent with the [JSSE specification of the trust manager](http://docs.oracle.com/javase/7/docs/technotes/guides/security/jsse/JSSERefGuide.html#TrustManager): "*The primary responsibility of the TrustManager is to determine whether the presented authentication credentials should be trusted. If the credentials are not trusted, the connection will be terminated.*"
