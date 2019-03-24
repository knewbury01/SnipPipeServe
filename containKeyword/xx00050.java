|    [ req ]
    default_bits        = 2048
    default_keyfile     = server-key.pem
    distinguished_name  = subject
    req_extensions      = req_extensions
    x509_extensions     = cert_extensions
    string_mask         = utf8only
    
    [ subject ]
    countryName         = Country Name (2 letter code)
    countryName_default     = US
    
    stateOrProvinceName     = State or Province Name (full name)
    stateOrProvinceName_default = NY
    
    localityName            = Locality Name (eg, city)
    localityName_default        = New York
    
    organizationName         = Organization Name (eg, company)
    organizationName_default    = Example, LLC
    
    # Use a friendly name here. Its presented to the user.
    #   The server's DNS name show up in Subject Alternate Names. Plus, 
    #   DNS names here is deprecated by both IETF and CA/Browser Forums.
    commonName          = Common Name (e.g. server FQDN or YOUR name)
    commonName_default      = Example Company
    
    emailAddress            = Email Address
    emailAddress_default        = test@example.com
    
    [ cert_extensions ]
    
    subjectKeyIdentifier        = hash
    authorityKeyIdentifier	= keyid,issuer
    
    basicConstraints        = CA:FALSE
    keyUsage            = digitalSignature, keyEncipherment
    # extendedKeyUsage	= serverAuth
    subjectAltName          = @alternate_names
    nsComment           = "OpenSSL Generated Certificate"
    
    [ req_extensions ]
    
    subjectKeyIdentifier        = hash
    
    basicConstraints        = CA:FALSE
    keyUsage            = digitalSignature, keyEncipherment
    # extendedKeyUsage	= serverAuth
    subjectAltName          = @alternate_names
    nsComment           = "OpenSSL Generated Certificate"
    
    [ alternate_names ]
    
    DNS.1       = example.com
    DNS.2       = www.example.com
    DNS.3       = mail.example.com
    DNS.4       = ftp.example.com
    
    # Add these if you need them. But usually you don't want them or
    #   need them in production. You may need them for development.
    # DNS.5       = localhost
    # DNS.6       = localhost.localdomain
    # DNS.7       = 127.0.0.1
