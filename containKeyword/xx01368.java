|roleHierarchy.setHierarchy("ROLE_ADMIN > ROLE_USER > ROLE_DEFAULT");
I don't remember why I wrote the hierarchy like that but it's not correct. The [API for that method][1] handles the same situation thusly:
> **Role hierarchy:** ROLE_A > ROLE_B and ROLE_B > ROLE_C.<br>
> **Directly assigned authority:** ROLE_A.<br>
> **Reachable authorities:** ROLE_A, ROLE_B, ROLE_C.
  Eventually it became clear that a hierarchical model didn't fit our roles so we instead implemented a finer-grained set of authorities mapped to roles, as mentioned in the [Spring Security Reference][2]:
>For more complex requirements you may wish to define a logical mapping between the specific access-rights your application requires and the roles that are assigned to users, translating between the two when loading the user information. 
  [1]: http://docs.spring.io/spring-security/site/docs/4.0.0.RELEASE/apidocs/org/springframework/security/access/hierarchicalroles/RoleHierarchyImpl.html#setHierarchy%28java.lang.String%29
  [2]: https://docs.spring.io/spring-security/site/docs/current/reference/htmlsingle/#authz-hierarchical-roles
