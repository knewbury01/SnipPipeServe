|    public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
        protected void configure(HttpSecurity http) {
            http.requiresChannel().anyRequest().requiresSecure();
        }
    }
