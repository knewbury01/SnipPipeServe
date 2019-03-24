|    1: `-Dweblogic.security.TrustKeyStore=JavaStandardTrust` (**We should use when the trusted CAs in the JDK's cacerts, specify this**) 
    2: `-Dweblogic.security.TrustKeyStore=DemoTrust`   (**We should use when the trusted CAs in DemoTrust.jks and in the JDK's cacerts, specify this**) 
    3: `-Dweblogic.security.TrustKeyStore=CustomTrust`  (**We should use when the trusted CAs from another keystore, specify this**).
