|    Factory<SecurityManager> factory = new IniSecurityManagerFactory();
    SecurityManager securityManager = factory.getInstance();
    SecurityUtils.setSecurityManager(securityManager);
