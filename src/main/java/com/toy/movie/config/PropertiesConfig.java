package com.toy.movie.config;

import org.springframework.beans.factory.config.PropertiesFactoryBean;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.FileSystemResource;

@Configuration
public class PropertiesConfig {

    @Bean(name = "movieProp")
    public PropertiesFactoryBean movieProperties() {
        PropertiesFactoryBean propertiesFactoryBean = new PropertiesFactoryBean();
        propertiesFactoryBean.setLocation(new FileSystemResource("C:/java/workspace/study/config/movie.properties"));
        return propertiesFactoryBean;
    }

}
