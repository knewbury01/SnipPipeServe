|    @Override
    public void configure(WebSecurity web) throws Exception {
        web.ignoring()
           .antMatchers("/assets/**" ,"/showReg", "/", "/index.html", "/registerUser", "/login", "/showLogin", "/login/*", "/reservations/*");
    }
