package org.hov.config;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.security.config.annotation.authentication.builders.AuthenticationManagerBuilder;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.annotation.web.configuration.WebSecurityConfigurerAdapter;
import org.springframework.security.core.userdetails.UserDetailsService;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.web.servlet.mvc.WebContentInterceptor;

@EnableWebSecurity
public class WebSecurityConfig extends WebSecurityConfigurerAdapter {
	@SuppressWarnings("deprecation")
	@Bean
	public WebContentInterceptor webContentInterceptor() {
	    final WebContentInterceptor interceptor = new WebContentInterceptor();
	    interceptor.setCacheSeconds(0);
	    interceptor.setUseExpiresHeader(true);
	    interceptor.setUseCacheControlHeader(true);
	    interceptor.setUseCacheControlNoStore(true);
	    return interceptor;
	}

	@Autowired
	private UserDetailsService userDetailsService;
  
	@Bean
	public BCryptPasswordEncoder passwordEncoder() {
		return new BCryptPasswordEncoder();
	};
  
	@Override
	protected void configure(AuthenticationManagerBuilder auth) throws Exception {
		auth.userDetailsService(userDetailsService).passwordEncoder(passwordEncoder());
	}

	@Override
	protected void configure(HttpSecurity http) throws Exception {
		http.authorizeRequests()
		.antMatchers("/resources/**").permitAll()
		//.antMatchers("/product/display/**").authenticated()
		//.antMatchers("/product/add/**").authenticated()
		//.antMatchers("/order/**").authenticated()
		.antMatchers("/user/login").anonymous()
		.antMatchers("/user/register").anonymous()
		.antMatchers("/order/**").hasAuthority("BUYER")
		.antMatchers("/product/add/**").hasAuthority("SELLER")
		.antMatchers("/product/delete/**").hasAuthority("SELLER")
		.antMatchers("/product/edit/**").hasAuthority("SELLER")
		.antMatchers("/product/update/**").hasAuthority("SELLER")
		.antMatchers("/brand/add/**").hasAuthority("SELLER")
		.antMatchers("/brand/delete/**").hasAuthority("SELLER")
		.antMatchers("/brand/edit/**").hasAuthority("SELLER")
		.antMatchers("/brand/update/**").hasAuthority("SELLER")
		.antMatchers("/category/add/**").hasAuthority("SELLER")
		.antMatchers("/category/delete/**").hasAuthority("SELLER")
		.antMatchers("/category/edit/**").hasAuthority("SELLER")
		.antMatchers("/category/update/**").hasAuthority("SELLER")
		.antMatchers("/subcategory/add/**").hasAuthority("SELLER")
		.antMatchers("/subcategory/delete/**").hasAuthority("SELLER")
		.antMatchers("/subcategory/edit/**").hasAuthority("SELLER")
		.antMatchers("/subcategory/update/**").hasAuthority("SELLER")
		.and().formLogin()
		  
		.defaultSuccessUrl("/")
		.loginPage("/user/login").loginProcessingUrl("/loginaction").permitAll()
		.and()
		.logout().logoutUrl("/logout")
		.invalidateHttpSession(true)
		.clearAuthentication(true)
		.deleteCookies("JESSIONID")
		.logoutSuccessUrl("/home")
		.and().csrf().disable();
	}
}