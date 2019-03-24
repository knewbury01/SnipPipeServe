|    [
    [
      Version: V1
      Subject: CN=Simple Test Http Server, OU=Jakarta HttpClient Project, O=Apache Software Foundation, L=Unknown, ST=Unknown, C=Unknown
      Signature Algorithm: SHA1withDSA, OID = 1.2.840.10040.4.3
    
      Key:  Sun DSA Public Key
        Parameters:DSA
    	p:     fd7f5381 1d751229 52df4a9c 2eece4e7 f611b752 3cef4400 c31e3f80 b6512669
        455d4022 51fb593d 8d58fabf c5f5ba30 f6cb9b55 6cd7813b 801d346f f26660b7
        6b9950a5 a49f9fe8 047b1022 c24fbba9 d7feb7c6 1bf83b57 e7c6a8a6 150f04fb
        83f6d3c5 1ec30235 54135a16 9132f675 f3ae2b61 d72aeff2 2203199d d14801c7
    	q:     9760508f 15230bcc b292b982 a2eb840b f0581cf5
    	g:     f7e1a085 d69b3dde cbbcab5c 36b857b9 7994afbb fa3aea82 f9574c0b 3d078267
        5159578e bad4594f e6710710 8180b449 167123e8 4c281613 b7cf0932 8cc8a6e1
        3c167a8b 547c8d28 e0a3ae1e 2bb3a675 916ea37f 0bfa2135 62f1fb62 7a01243b
        cca4f1be a8519089 a883dfe1 5ae59f06 928b665e 807b5525 64014c3b fecf492a
    
      y:
        f0cc639f 702fd3b1 03fa8fa6 676c3756 ea505448 23cd1147 fdfa2d7f 662f7c59
        a02ddc1a fd76673e 25210344 cebbc0e7 6250fff1 a814a59f 30ff5c7e c4f186d8
        f0fd346c 29ea270d b054c040 c74a9fc0 55a7020f eacf9f66 a0d86d04 4f4d23de
        7f1d681f 45c4c674 5762b71b 808ded17 05b74baf 8de3c4ab 2ef662e3 053af09e
    
      Validity: [From: Sat Dec 11 14:48:35 CET 2004,
                   To: Tue Dec 09 14:48:35 CET 2014]
      Issuer: CN=Simple Test Http Server, OU=Jakarta HttpClient Project, O=Apache Software Foundation, L=Unknown, ST=Unknown, C=Unknown
      SerialNumber: [    41bafab3]
    
    ]
      Algorithm: [SHA1withDSA]
      Signature:
    0000: 30 2D 02 15 00 85 BE 6B   D0 91 EF 34 72 05 FF 1A  0-.....k...4r...
    0010: DB F6 DE BF 92 53 9B 14   27 02 14 37 8D E8 CB AC  .....S..'..7....
    0020: 4E 6C 93 F2 1F 7D 20 A1   2D 6F 80 5F 58 AE 33     Nl.... .-o._X.3
    
    ]
    HTTP/1.1 200 OK
    [
    [
      Version: V3
      Subject: CN=www.verisign.com, OU=" Production Security Services", O="VeriSign, Inc.", STREET=487 East Middlefield Road, L=Mountain View, ST=California, OID.2.5.4.17=94043, C=US, SERIALNUMBER=2497886, OID.2.5.4.15="V1.0, Clause 5.(b)", OID.1.3.6.1.4.1.311.60.2.1.2=Delaware, OID.1.3.6.1.4.1.311.60.2.1.3=US
      Signature Algorithm: SHA1withRSA, OID = 1.2.840.113549.1.1.5
    
      Key:  Sun RSA public key, 2048 bits
      modulus: 20699622354183393041832954221256409980425015218949582822286196083815087464214375375678538878841956356687753084333860738385445545061253653910861690581771234068858443439641948884498053425403458465980515883570440998475638309355278206558031134532548167239684215445939526428677429035048018486881592078320341210422026566944903775926801017506416629554190534665876551381066249522794321313235316733139718653035476771717662585319643139144923795822646805045585537550376512087897918635167815735560529881178122744633480557211052246428978388768010050150525266771462988042507883304193993556759733514505590387262811565107773578140271
      public exponent: 65537
      Validity: [From: Wed May 26 02:00:00 CEST 2010,
                   To: Sat May 26 01:59:59 CEST 2012]
      Issuer: CN=VeriSign Class 3 Extended Validation SSL SGC CA, OU=Terms of use at https://www.verisign.com/rpa (c)06, OU=VeriSign Trust Network, O="VeriSign, Inc.", C=US
      SerialNumber: [    53d2bef9 24a7245e 83ca01e4 6caa2477]
    
    Certificate Extensions: 10
    [1]: ObjectId: 1.3.6.1.5.5.7.1.1 Criticality=false
    AuthorityInfoAccess [
      [accessMethod: 1.3.6.1.5.5.7.48.1
       accessLocation: URIName: http://EVIntl-ocsp.verisign.com, accessMethod: 1.3.6.1.5.5.7.48.2
       accessLocation: URIName: http://EVIntl-aia.verisign.com/EVIntl2006.cer]
    ]
    
    ...
    
    ]
    Exception in thread "main" javax.net.ssl.SSLPeerUnverifiedException: peer not authenticated
    	at com.sun.net.ssl.internal.ssl.SSLSessionImpl.getPeerCertificates(SSLSessionImpl.java:345)
    	at org.apache.http.conn.ssl.AbstractVerifier.verify(AbstractVerifier.java:128)
    	at org.apache.http.conn.ssl.SSLSocketFactory.createLayeredSocket(SSLSocketFactory.java:446)
    ...
