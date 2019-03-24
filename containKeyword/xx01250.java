|    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring().antMatchers(HttpMethod.POST, SecurityConstants.SIGN_UP_URL);
    }
