|    <bean id="myAccessDecisionManager" class="sample.mvc.root.context.services.MyAccessDecisionManager">
        <property name="securityReferenceDataService">
            <bean  class="sample.mvc.root.context.services.SecurityReferenceDataDao"/>
        </property>
    </bean>
