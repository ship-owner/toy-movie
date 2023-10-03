package com.toy.movie.config;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;


/**
 * packageName    : com.toy.movie.config
 * fileName       : PropertiesConfig
 * author         : shipowner
 * date           : 2023-09-11
 * description    : 외부 환경 변수 불러오는 설정
 */
@Configuration
public class PropertiesConfig {

    @Bean(name = "movieProp")
    public PropertiesFactoryBean movieProperties() {
        PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
        propertiesFactoryBean.setLocation(new FileSystemResource("C:/java/workspace/study/config/movie.properties"));
        return propertiesFactoryBean;
    }

}
