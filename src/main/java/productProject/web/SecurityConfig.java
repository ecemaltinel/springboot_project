package productProject.web;

import org.springframework.context.annotation.Configuration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;

@Configuration
public class SecurityConfig extends WebSecurityConfigurerAdapter  {

    @Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests().antMatchers("/css/**", "/img/**", "/login.html").permitAll();
		http.authorizeRequests().anyRequest().authenticated();
		http.formLogin().loginPage("/login.html");
		http.formLogin().loginProcessingUrl("/login");
		http.formLogin().failureUrl("/login.html?loginFailed=true");
	}

    
}