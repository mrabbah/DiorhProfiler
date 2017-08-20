package com.rabbahsoft.diorhprofiler

class ConnaissanceLinguistique {

    String intituleLangue
	
    static mapping = {
        sort "intituleLangue"
    }

    static constraints = {
        intituleLangue blank : false, maxSize: 40, unique : true
    }
        
    @Override	
    public String toString() {
        return "${intituleLangue}";
    }
}
