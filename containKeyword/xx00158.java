|    <bean id="authenticationManager" class="org.acegisecurity.providers.ProviderManager">
        <property name="providers">
            <list>
                <ref local="ldapAuthenticationProvider"/>
            </list>
        </property>	
    </bean>
