|    ByteBuffer bb = ByteBuffer.allocate(bm.getByteCount());
    bm.copyPixelsToBuffer(bb);
    byte[] b = bb.array();
    bm.copyPixelsFromBuffer(ByteBuffer.wrap(Security.encrypt(key,b)));
