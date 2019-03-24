|    X509Certificate2 cert = new X509Certificate2(certificateFile, certificatePassword, X509KeyStorageFlags.Exportable | X509KeyStorageFlags.PersistKeySet);
    RSACryptoServiceProvider provider1 = (RSACryptoServiceProvider)cert.PublicKey.Key;
    RSACryptoServiceProvider provider2 = (RSACryptoServiceProvider)cert.PrivateKey;
