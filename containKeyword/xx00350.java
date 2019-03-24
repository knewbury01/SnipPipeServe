|    @Autowired
	public void configureGlobal(AuthenticationManagerBuilder auth) throws Exception {
		auth.authenticationProvider(new ApiCustomAuthenticationProvider());
	}
