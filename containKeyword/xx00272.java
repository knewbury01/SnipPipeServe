|    for (Realm realm : ((RealmSecurityManager) SecurityUtils.getSecurityManager()).getRealms())
        System.out.println(realm.getName());
