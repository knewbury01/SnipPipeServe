|    <bean id="ldapAuthenticationProvider" class="org.acegisecurity.providers.ldap.LdapAuthenticationProvider">
        <constructor-arg><ref local="authenticator"/></constructor-arg>
	    <constructor-arg><ref local="populator"/></constructor-arg>
	    <property name="userCache"><ref local="userCache"/></property>
	</bean>
