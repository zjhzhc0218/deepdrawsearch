package com.deepdraw.deepsearch.config;

import org.mybatis.spring.SqlSessionFactoryBean;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.core.io.ClassPathResource;
import org.springframework.core.io.support.PathMatchingResourcePatternResolver;

import javax.sql.DataSource;
import java.io.IOException;

@Configuration
public class SessionFactoryConfiguration {


    @Value("${mybatis_config_file}")
    private String mybatisConfigPath;
    @Autowired
    @Qualifier("dataSource")
    private DataSource dataSource;
    @Value("${entity_package}")
    private String entityPackage;
    @Value("${mapper_path}")
    private String mapperPath;

    @Bean(name = "sqlSessionFactory")
    public SqlSessionFactoryBean createSess() throws IOException {
        SqlSessionFactoryBean s = new SqlSessionFactoryBean();
        s.setConfigLocation(new ClassPathResource(mybatisConfigPath));
        PathMatchingResourcePatternResolver pathMatching = new PathMatchingResourcePatternResolver();
        String packagrPath = PathMatchingResourcePatternResolver.CLASSPATH_ALL_URL_PREFIX+mapperPath;
        s.setMapperLocations(pathMatching.getResources(packagrPath));
        s.setDataSource(dataSource);
        s.setTypeAliasesPackage(entityPackage);
        return s;




    }
}
