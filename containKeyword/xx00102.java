|     SecurityManager security = System.getSecurityManager();
     if (security != null) {
         security.checkXXX(argument,  . . . );
     }
