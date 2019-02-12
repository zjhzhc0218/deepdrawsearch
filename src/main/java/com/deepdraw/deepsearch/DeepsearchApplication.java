package com.deepdraw.deepsearch;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.scheduling.annotation.EnableScheduling;

@SpringBootApplication
@EnableScheduling
public class DeepsearchApplication {
//    private static Logger logger = LoggerFactory.getLogger(MySpringBootApplication.class);
    public static void main(String[] args) {
        SpringApplication.run(DeepsearchApplication.class, args);
    }
}

