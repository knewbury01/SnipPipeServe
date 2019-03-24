|    Keycloak kc = KeycloakBuilder.builder()
    .realm("master")
    .clientId("admin-cli")
    .username("admin")
    .password("password")
    .serverUrl("http://localhost:8880/auth")
    .resteasyClient(new ResteasyClientBuilder().connectionPoolSize(10).register(new CustomJacksonProvider()).build())
    .build();
