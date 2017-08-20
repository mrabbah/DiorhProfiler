dataSource {
    pooled = true
    driverClassName = "org.h2.Driver"
    username = "sa"
    password = ""
}
hibernate {
    cache.use_second_level_cache = true
    cache.use_query_cache = false
    cache.region.factory_class = 'net.sf.ehcache.hibernate.EhCacheRegionFactory' // Hibernate 3
    //    cache.region.factory_class = 'org.hibernate.cache.ehcache.EhCacheRegionFactory' // Hibernate 4
}

// environment specific settings
environments {
    development {
        dataSource {
            // dbCreate = "create-drop" // one of 'create', 'create-drop', 'update', 'validate', ''
            // url = "jdbc:h2:mem:devDb;MVCC=TRUE;LOCK_TIMEOUT=10000;DB_CLOSE_ON_EXIT=FALSE"
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "root"
            password = "root"
            url = "jdbc:postgresql://localhost/profiler_30_03_2015"
            //dbCreate = "create-drop"
           // logSql = true
        }
    }
    dbdiff {
        dataSource {   
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "profiler"
            password = "profiler"
            url = "jdbc:postgresql://localhost/profiler_diff"  
            dbCreate = "create-drop"
        }
    }
    test {
        dataSource {            
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "profiler"
            password = "profiler"
            url = "jdbc:postgresql://localhost/profiler_test"          
        }
    }
    production {
        dataSource {            
            driverClassName = "org.postgresql.Driver"
            dialect = org.hibernate.dialect.PostgreSQLDialect
            username = "profiler"
            password = "profiler"
            url = "jdbc:postgresql://localhost/profiler"     
            
        }
    }
}
