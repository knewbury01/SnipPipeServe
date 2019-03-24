|		SecretKey key = KeyGenerator.getInstance("DES").generateKey();
		byte[] data = key.getEncoded();
		SecretKey key2 = new SecretKeySpec(data, 0, data.length, "DES");
