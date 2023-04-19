package com.wqtang.oauth;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.config.annotation.authentication.configuration.AuthenticationConfiguration;
import org.springframework.security.config.annotation.web.builders.HttpSecurity;
import org.springframework.security.config.annotation.web.configuration.EnableWebSecurity;
import org.springframework.security.config.http.SessionCreationPolicy;
import org.springframework.security.crypto.factory.PasswordEncoderFactories;
import org.springframework.security.crypto.password.PasswordEncoder;
import org.springframework.security.web.SecurityFilterChain;
import org.springframework.security.web.authentication.UsernamePasswordAuthenticationFilter;
import org.springframework.web.cors.CorsConfiguration;
import org.springframework.web.cors.UrlBasedCorsConfigurationSource;
import org.springframework.web.filter.CorsFilter;

import javax.annotation.Resource;

/**
 * @author Wenqian Tang
 * @date 2023/04/16
 */
@Configuration
@EnableWebSecurity
public class SecurityConfig {

    public static final String AUTHORITY_PREFIX = "ROLE_";

    @Resource(name = "userDetailsService")
    private UserDetailsService userDetailsService;
    @Resource(name = "jwtAuthenticationTokenFilter")
    private JwtAuthenticationTokenFilter jwtAuthenticationTokenFilter;

    @Bean
    public PasswordEncoder passwordEncoder() {
        return PasswordEncoderFactories.createDelegatingPasswordEncoder();
    }

    @Bean
    public AuthenticationManager authenticationManager(AuthenticationConfiguration authenticationConfiguration) throws Exception {
        return authenticationConfiguration.getAuthenticationManager();
    }

    @Bean
    public CorsFilter corsFilter() {
        CorsConfiguration config = new CorsConfiguration();
        config.setAllowCredentials(true);
        // 设置访问源地址
        config.addAllowedOriginPattern("*");
        // 设置访问源请求头
        config.addAllowedHeader("*");
        // 设置访问源请求方法
        config.addAllowedMethod("*");
        // 有效期 1800秒
        config.setMaxAge(1800L);
        // 添加映射路径，拦截一切请求
        UrlBasedCorsConfigurationSource source = new UrlBasedCorsConfigurationSource();
        source.registerCorsConfiguration("/**", config);
        // 返回新的CorsFilter
        return new CorsFilter(source);
    }

    /**
     * anyRequest          |   匹配所有请求路径
     * access              |   SpringEl表达式结果为true时可以访问
     * anonymous           |   匿名可以访问
     * denyAll             |   用户不能访问
     * fullyAuthenticated  |   用户完全认证可以访问（非remember-me下自动登录）
     * hasAnyAuthority     |   如果有参数，参数表示权限，则其中任何一个权限可以访问
     * hasAnyRole          |   如果有参数，参数表示角色，则其中任何一个角色可以访问
     * hasAuthority        |   如果有参数，参数表示权限，则其权限可以访问
     * hasIpAddress        |   如果有参数，参数表示IP地址，如果用户IP和参数匹配，则可以访问
     * hasRole             |   如果有参数，参数表示角色，则其角色可以访问
     * permitAll           |   用户可以任意访问
     * rememberMe          |   允许通过remember-me登录的用户访问
     * authenticated       |   用户登录后可访问
     *
     * @param httpSecurity
     */
    @Bean
    public SecurityFilterChain securityFilterChain(HttpSecurity httpSecurity) throws Exception {
        return httpSecurity
                // 基于token, 不需要开启csrf
                .csrf().disable()
                // 基于token, 不需要创建session
                .sessionManagement().sessionCreationPolicy(SessionCreationPolicy.STATELESS).and()
                // 验证失败的处理类
//                .exceptionHandling().authenticationEntryPoint(exceptionHandler).and()
                // 请求权限设置
                .authorizeRequests(authorize -> authorize
                        // 以下资源路径允许任意状态时访问(登录或未登录均可)
                        .antMatchers(
                                "/",
                                "/*.html",
                                "/**/*.html",
                                "/**/*.css",
                                "/**/*.js").permitAll()
                        // fixme: 仅用于测试, 需要记得事后删除!
                        .antMatchers("/repair/**", "system/**").permitAll()
                        // 以下资源路径仅允许未登录状态时访问(无需token)
                        .antMatchers(
                                "/system/user/login",
                                "/system/user/register",
                                "/system/user/emailVerification",
                                "/system/user/modifyPassword",
                                "/system/user/getEmail",
                                "/captcha/image",
                                "/file/upload").anonymous()
                        // 除上面以外的所有资源路径都需要在登录状态时访问
                        .anyRequest().authenticated())
                // 在用户名密码认证过滤器之前, 添加一个JWT过滤器
                .addFilterBefore(jwtAuthenticationTokenFilter, UsernamePasswordAuthenticationFilter.class)
                // 在JWT过滤器之前, 添加一个跨域过滤器
                .addFilterBefore(corsFilter(), JwtAuthenticationTokenFilter.class)
                // 认证用户时, 通过username加载用户详细信息的逻辑
                .userDetailsService(userDetailsService)
                .build();
    }

}
