|    	    KeyStore clientTrustedKeyStore = KeyStore.getInstance(KeyStore.getDefaultType());
	        clientTrustedKeyStore.load(null, "password".toCharArray());
	        KeyStore.Entry entry = new KeyStore.TrustedCertificateEntry(cert);
	        clientTrustedKeyStore.setEntry("alias", entry, null);
