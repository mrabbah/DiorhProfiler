package com.rabbahsoft.diorhprofiler

/**
 * MailTemplate
 * A domain class describes the data object and it's mapping to the database
 */
class MailTemplate {

    String code	
    String description
    String template
    
    static	mapping = {
        template type : 'text'
    }
    
    static	constraints = {
        code blank :false , unique : true
        description nullable: true, maxSize: 65535
        template nullable: true, maxSize: 65535
    }
	
}
