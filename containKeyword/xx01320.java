|        <beans xmlns="http://www.springframework.org/schema/beans"
    	xmlns:context="http://www.springframework.org/schema/context"
    	xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xmlns:mvc="http://www.springframework.org/schema/mvc"
    	xsi:schemaLocation="
            http://www.springframework.org/schema/beans     
            http://www.springframework.org/schema/beans/spring-beans-3.0.xsd
            http://www.springframework.org/schema/context 
            http://www.springframework.org/schema/context/spring-context-3.0.xsd
            http://www.springframework.org/schema/mvc
            http://www.springframework.org/schema/mvc/spring-mvc-3.0.xsd
            http://www.springframework.org/schema/web-services
            http://www.springframework.org/schema/web-services/web-services-2.0.xsd">
    
    	<context:component-scan base-package="com.yourpackage" />
    	<bean id="messageFactory" class="org.springframework.ws.soap.saaj.SaajSoapMessageFactory" />
    	<bean id="webServiceTemplate" class="org.springframework.ws.client.core.WebServiceTemplate">
    		<constructor-arg ref="messageFactory" />
    		<property name="defaultUri"
    			value="${backend.ip}devices" />
    		<property name="interceptors">
    
    			<list>
    				<ref local="xwsSecurityInterceptor" />
    			</list>
    		</property>
    
    	</bean>
    
    	<bean id="xwsSecurityInterceptor"
    		class="org.springframework.ws.soap.security.xwss.XwsSecurityInterceptor">
    		<property name="policyConfiguration" value="/WEB-INF/securityPolicy.xml" />
    		<property name="callbackHandlers">
    			<list>
    				<ref bean="keyStoreHandler" />
    			</list>
    		</property>
    	</bean>
    
    	<bean id="keyStore"
    		class="org.springframework.ws.soap.security.support.KeyStoreFactoryBean">
    		<property name="password" value="yourpassword" />
    		<property name="location" value="/WEB-INF/yourkeystore.jks" />
    	</bean>
    
    	<bean id="keyStoreHandler"
    		class="org.springframework.ws.soap.security.xwss.callback.KeyStoreCallbackHandler">
    		<property name="keyStore" ref="keyStore" />
    		<property name="privateKeyPassword" value="yourpassword" />
    		<property name="defaultAlias" value="client" />
    	</bean>
    
    	<bean
    		class="org.springframework.web.servlet.view.InternalResourceViewResolver">
    		<property name="prefix">
    			<value>/WEB-INF/pages/</value>
    		</property>
    		<property name="suffix">
    			<value>.jsp</value>
    		</property>
    	</bean>
    
    	<!-- LOAD PROPERTIES -->
    	<context:property-placeholder
    		location="WEB-INF/config.properties"
    		ignore-unresolvable="true" />
    
    	<mvc:resources mapping="/resources/**" location="/resources/" />
    	<mvc:annotation-driven />
    
    </beans>
