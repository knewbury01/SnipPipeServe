|    <security:http use-expressions="true"
	 access-decision-manager-ref="httpAccessDecisionManager" ...>
          ...
        <security:intercept-url pattern="/restricted/**"
                  access="myCustomAuthenticatedExpression" />         
          ...
    </security:http>
    <bean id="httpAccessDecisionManager"
          class="org.springframework.security.access.vote.AffirmativeBased">
        <constructor-arg name="decisionVoters">
                <list>
                    <ref bean="webExpressionVoter" />
                </list>
        </constructor-arg>
    </bean>
    <bean id="webExpressionVoter"
          class="org.springframework.security.web.access.expression.WebExpressionVoter">
        <property name="expressionHandler"
                  ref="myCustomWebSecurityExpressionHandler" />
    </bean>
  
    <bean id="myCustomWebSecurityExpressionHandler"
        class="MyCustomWebSecurityExpressionHandler" />
     
