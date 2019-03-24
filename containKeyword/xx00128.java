|    <beans:bean id="daoAuthenticationProvider" class="org.springframework.security.authentication.dao.DaoAuthenticationProvider">
      <beans:property name="userDetailsService" ref="userDetailsService"/>
      <beans:property name="passwordEncoder" ref="encoder" />
    </beans:bean>
    <bean id="encoder" class="org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder"/>
