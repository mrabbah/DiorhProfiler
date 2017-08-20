package com.rabbahsoft.diorhprofiler.util;

import java.io.File;
import java.io.InputStream;


/**
 *
 * @author RABBAH
 */
public class Utilitaire {

    public static String pathToDocumentSubReport_candidat_formations = "/var/lib/tomcat7/webapps/DiorhProfiler/reports/subReport_candidat_formations.jrxml";
    private static String pathToDocumentSubReport_candidat_experiences = "/var/lib/tomcat7/webapps/DiorhProfiler/reports/subReport_candidat_experiences.jrxml";
    private static String pathToDocumentSubReport_candidat_langues = "/var/lib/tomcat7/webapps/DiorhProfiler/reports/subReport_candidat_langues.jrxml";
    private static String pathToDocumentSubReport_candidat_informatiques = "/var/lib/tomcat7/webapps/DiorhProfiler/reports/subReport_candidat_informatiques.jrxml";


    public static File getDocumentSubReportt(Class clazz,String path) throws Exception {
        ClassLoader cl = clazz.getClassLoader();
        File is;
        try {
            is = new File(cl.getResource(path).getPath());
        } catch (Exception e) {
            throw new Exception("Impossible d obtenir le rapport", e);
        }
        return is;
    }

    public static int getNbApresLaVergule(double nombre) {

        int intNb = (int) nombre;
        nombre = nombre - intNb;
        double res = nombre * 100;
        int resultat = (int) res;
        return resultat;

    }
}
