|    @Override
    public void configure(WebSecurity webSecurity) {
      webSecurity.ignoring().antMatchers(HttpMethod.POST, "/v2/session");
    }
