|    // salt and masterHash can be cached for multiple requests
    salt = SecureRandom().nextBytes(8 bytes)
    // adjust iterations (65336) according to appropriate performance:
    masterHash = pbkdf2(password, salt, 65336)
    iv = SecureRandom().nextBytes(16 bytes)
    sessionKey = SecureRandom().nextBytes(16 bytes)
    encKey = hmacSha256(masterHash, "enc") // crop according to intended AES key size
    macKey = hmacSha256(masterHash, "mac")
    ciphertext = AES(encKey, iv, sessionKey + ts.length + ts)
    tag = hmacSha256(macKey, username + salt + iv + ciphertext)
    return salt + iv + ciphertext + tag
