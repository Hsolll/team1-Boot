package com.omb.user.config;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;
import org.springframework.web.servlet.config.annotation.InterceptorRegistry;
import org.springframework.web.servlet.config.annotation.WebMvcConfigurer;
 
@Configuration // 스프링 컨테이너에 새로운 빈 객체를 제공
public class InterceptorConfig implements WebMvcConfigurer {
 
    @Autowired
    @Qualifier(value = "loginInterceptor")
    private HandlerInterceptor loginInterceptor;
 
    @Value("${resources.notload.list}") // application.properties에 설정된 값을 가지고 오기
    private List<String> notLoadList;
    
    @Override
    public void addInterceptors(InterceptorRegistry registry) {
        /*
        notLoadList.add("/login");
        notLoadList.add("/admin");
        notLoadList.add("/admin/main");
        notLoadList.add("/admin/login");
        notLoadList.add("/socialLogin");
        notLoadList.add("/callback");
        notLoadList.add("/kakaoCallback");
        notLoadList.add("/member/signUp");
        notLoadList.add("/member/signUpForm");
        notLoadList.add("/member/naverSignUp");
        notLoadList.add("/member/kakaoSignUp");
        notLoadList.add("/member/signUpAgree");
        notLoadList.add("/logout");
        notLoadList.add("/member/findId");
        notLoadList.add("/member/findPw");
        notLoadList.add("/member/idChk");
        notLoadList.add("/member/nickChk");
        notLoadList.add("/member/emailChk");
        notLoadList.add("/member/phoneChk");
        notLoadList.add("/member/mailCheck");
        notLoadList.add("/member/findPwMailCheck");
        notLoadList.add("/socialChk");
        notLoadList.add("/member/findPwMailCheck");
        notLoadList.add("/member/findPwChk");
        notLoadList.add("/member/findPwUpdate");
        notLoadList.add("/member/findPwUpdateForm");
        notLoadList.add("/");
        
        
        registry.addInterceptor(loginInterceptor).addPathPatterns("/**").excludePathPatterns(notLoadList);        
        
        /*
         * registry.addInterceptor(commonInterceptor) .addPathPatterns("/**") // 추가할 url
         * 패턴 .excludePathPatterns("/user/**"); // 제외할 url 패턴
         */
    }
}