|    /subsystem=security/security-domain=other/mapping=classic:add
    /subsystem=security/security-domain=other/mapping=classic/mapping-module=mapRoleToAllUsers:add(code="org.jboss.security.mapping.providers.role.DatabaseRolesMappingProvider", type="role", module-options=[("dsJndiName"=>"java:jboss/datasources/ExampleDS"), ("rolesQuery"=>"SELECT 'ApplicationRealm' FROM Dual WHERE ?!=''")])
    reload
