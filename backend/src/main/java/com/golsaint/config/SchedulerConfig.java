package com.golsaint.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.scheduling.concurrent.ThreadPoolTaskScheduler;

/**
 * Configuración del pool de hilos para el programador de tareas automáticas.
 */
/**
 * Clase de configuración para Scheduler.
 *
 * @author Rubiel Andrés Díaz
 */

@Configuration
public class SchedulerConfig {

    @Bean
    public ThreadPoolTaskScheduler taskScheduler() {
        ThreadPoolTaskScheduler scheduler = new ThreadPoolTaskScheduler();
        scheduler.setPoolSize(4);
        scheduler.setThreadNamePrefix("GOSaint-Sync-");
        scheduler.initialize();
        return scheduler;
    }
}
