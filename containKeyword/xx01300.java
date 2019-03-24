|    <security-domain name="other" cache-type="default">
        <authentication>
            <login-module code="Remoting" flag="optional">
                <module-option name="password-stacking" value="useFirstPass"/>
            </login-module>
            <login-module code="RealmDirect" flag="required">
                <module-option name="password-stacking" value="useFirstPass"/>
            </login-module>
        </authentication>
        <mapping>
            <mapping-module name="mapRoleToAllUsers" code="org.jboss.security.mapping.providers.role.DatabaseRolesMappingProvider" type="role">
                <module-option name="dsJndiName" value="java:jboss/datasources/ExampleDS"/>
                <module-option name="rolesQuery" value="SELECT 'ApplicationRealm' FROM Dual WHERE ?!=''"/>
            </mapping-module>
        </mapping>
    </security-domain>
