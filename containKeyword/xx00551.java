|    <security-constraint>
      <display-name>name</display-name>
      <web-resource-collection>  
        <web-resource-name>Restricted</web-resource-name>
        <url-pattern>/*</url-pattern>
        <http-method>GET</http-method>
        <http-method>POST</http-method>
      </web-resource-collection>
      <auth-constraint>
        <role-name>APP_USER</role-name>
      </auth-constraint>
      <user-data-constraint>
        <transport-guarantee>NONE</transport-guarantee>
      </user-data-constraint>
    </security-constraint>
    <security-constraint><!--Exclude css and images here -->
       <web-resource-collection>
          <web-resource-name>Exclude from Security</web-resource-name>
          <url-pattern>/images/*</url-pattern><!-- No security for images -->
          <url-pattern>/css/*</url-pattern><!-- No security for css -->
       </web-resource-collection>
    </security-constraint>
