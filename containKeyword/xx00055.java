|    if (!JceSecurityManager.INSTANCE.isCallerTrusted()) {
        throw new NullPointerException();
    }
