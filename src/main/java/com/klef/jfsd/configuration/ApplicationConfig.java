package com.klef.jfsd.configuration;

import java.util.Properties;

import org.apache.commons.dbcp2.BasicDataSource;
import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.orm.hibernate5.HibernateTemplate;
import org.springframework.orm.hibernate5.HibernateTransactionManager;
import org.springframework.orm.hibernate5.LocalSessionFactoryBean;
import org.springframework.transaction.annotation.EnableTransactionManagement;

import com.klef.jfsd.dao.UserDAO;
import com.klef.jfsd.dao.UserDAOImpl;
import com.klef.jfsd.service.UserService;
import com.klef.jfsd.service.UserServiceImpl;

@Configuration
@EnableTransactionManagement
public class ApplicationConfig 
{
	@Bean
    public BasicDataSource dataSource() 
    {
        BasicDataSource dataSource = new BasicDataSource();
        dataSource.setDriverClassName("com.mysql.cj.jdbc.Driver");  // driver class
        dataSource.setUrl("jdbc:mysql://localhost:3306/hibernatepractice");  // url
        dataSource.setUsername("root");  // user 
        dataSource.setPassword("admin"); // password
        return dataSource;
    }

    @Bean
    public Properties hibernateProperties() 
    {
        Properties hibernateProperties = new Properties();
        hibernateProperties.setProperty("hibernate.show_sql", "true");
        hibernateProperties.setProperty("hibernate.hbm2ddl.auto", "update");
        hibernateProperties.setProperty("hibernate.dialect", "org.hibernate.dialect.MySQL5Dialect");
        return hibernateProperties;
    }

    @Bean
    public LocalSessionFactoryBean localSessionFactoryBean() 
    {
        LocalSessionFactoryBean localSessionFactoryBean = new LocalSessionFactoryBean();
        localSessionFactoryBean.setDataSource(dataSource());  // first bean
        localSessionFactoryBean.setHibernateProperties(hibernateProperties()); // second bean
        localSessionFactoryBean.setPackagesToScan("com.klef.jfsd.model"); // mapping
        return localSessionFactoryBean;
    }

    @Bean
    public HibernateTransactionManager hibernateTransactionManager() 
    {
        HibernateTransactionManager transactionManager = new HibernateTransactionManager();
        transactionManager.setSessionFactory(localSessionFactoryBean().getObject());
        return transactionManager;
    }

    @Bean
    public HibernateTemplate hibernateTemplate() 
    {
        HibernateTemplate hibernateTemplate = new HibernateTemplate();
        hibernateTemplate.setSessionFactory(localSessionFactoryBean().getObject());
        return hibernateTemplate;
    }

    @Bean
    public UserDAO userDAO()
    {
    	UserDAOImpl daoImpl = new UserDAOImpl();
    	daoImpl.setHibernatetemplate(hibernateTemplate());
    	return daoImpl;
    	
    }
    
    @Bean
    public UserService userService()
    {
    	UserServiceImpl serviceImpl = new UserServiceImpl();
    	serviceImpl.setUserdao(userDAO());
    	return serviceImpl;
    }
   

}
