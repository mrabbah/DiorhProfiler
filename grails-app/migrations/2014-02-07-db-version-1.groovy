databaseChangeLog = {

    changeSet(author: "rabbah (generated)", id: "1392086092673-1") {
        createTable(tableName: "attachment") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "attachmentPK")
            }

            column(name: "version", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "content_type", type: "varchar(255)")

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "ext", type: "varchar(255)")

            column(name: "input_name", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "length", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "lnk_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "name", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "poster_class", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "poster_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-2") {
        createTable(tableName: "attachment_link") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "attachment_liPK")
            }

            column(name: "version", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "reference_class", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "reference_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-3") {
        createTable(tableName: "audit_log") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "audit_logPK")
            }

            column(name: "actor", type: "varchar(255)")

            column(name: "class_name", type: "varchar(255)")

            column(name: "date_created", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "event_name", type: "varchar(255)")

            column(name: "last_updated", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "new_value", type: "varchar(255)")

            column(name: "old_value", type: "varchar(255)")

            column(name: "persisted_object_id", type: "varchar(255)")

            column(name: "persisted_object_version", type: "int8")

            column(name: "property_name", type: "varchar(255)")

            column(name: "uri", type: "varchar(255)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-4") {
        createTable(tableName: "authentification") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "authentificatPK")
            }

            column(name: "version", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "email", type: "varchar(100)") {
                constraints(nullable: "false")
            }

            column(name: "nom", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "password", type: "varchar(50)")

            column(name: "prenom", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "class", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "adresse", type: "varchar(65535)")

            column(name: "annotation_commentaire", type: "varchar(65535)")

            column(name: "annotation_note_id", type: "int8")

            column(name: "annotation_profil_id", type: "int8")

            column(name: "annote", type: "bool")

            column(name: "civilite_id", type: "int8")

            column(name: "connaissance_info", type: "varchar(65535)")

            column(name: "date_naissance", type: "timestamp")

            column(name: "fichier_cv", type: "varchar(255)")

            column(name: "fichier_photo", type: "varchar(255)")

            column(name: "lieu_naissance", type: "varchar(50)")

            column(name: "mobilite", type: "bool")

            column(name: "mobilite_localisation", type: "varchar(60)")

            column(name: "nationalite", type: "varchar(50)")

            column(name: "niveau_etude_id", type: "int8")

            column(name: "nom_stockage", type: "varchar(50)")

            column(name: "plage_experience_id", type: "int8")

            column(name: "preavis", type: "int4")

            column(name: "prenom_stockage", type: "varchar(50)")

            column(name: "remun_avantages", type: "varchar(80)")

            column(name: "remun_montant_net", type: "varchar(20)")

            column(name: "remun_nbr_mois", type: "float8")

            column(name: "remun_pretention", type: "varchar(80)")

            column(name: "situation_familiale_id", type: "int8")

            column(name: "tel_fix", type: "varchar(20)")

            column(name: "tel_portable", type: "varchar(20)")

            column(name: "ville", type: "varchar(50)")

            column(name: "actif", type: "bool")

            column(name: "profil_id", type: "int8")

            column(name: "typage_id", type: "int8")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-5") {
        createTable(tableName: "candidature") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "candidaturePK")
            }

            column(name: "version", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "date_candidature", type: "timestamp")

            column(name: "etape_avancement_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "evaluation_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "evaluation_commentaire", type: "varchar(65535)")

            column(name: "lettre_motivation", type: "varchar(65535)")

            column(name: "mission_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "old_statut", type: "varchar(255)")

            column(name: "source_candidature", type: "varchar(50)")

            column(name: "spontanee", type: "bool")

            column(name: "statut_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-6") {
        createTable(tableName: "connaissance_linguistique") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "connaissance_PK")
            }

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "intitule_langue", type: "varchar(40)")

            column(name: "mission_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "typage_by_fk_langue_id_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "typage_by_fk_niveau_id_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-7") {
        createTable(tableName: "contact") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "contactPK")
            }

            column(name: "adresse1", type: "varchar(100)")

            column(name: "adresse2", type: "varchar(100)")

            column(name: "adresse3", type: "varchar(100)")

            column(name: "chiffre_affaire", type: "varchar(20)")

            column(name: "code_postal", type: "int8")

            column(name: "date_creation", type: "timestamp")

            column(name: "date_creation_entrep", type: "timestamp")

            column(name: "directeur_general", type: "varchar(50)")

            column(name: "effectif", type: "int4")

            column(name: "effectif_cadre", type: "int4")

            column(name: "fax", type: "varchar(30)")

            column(name: "first_interlocuteur", type: "varchar(30)")

            column(name: "raison_sociale", type: "varchar(60)") {
                constraints(nullable: "false")
            }

            column(name: "secteur_activite_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "telephone", type: "varchar(30)")

            column(name: "type", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "type_entreprise_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "ville", type: "varchar(50)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-8") {
        createTable(tableName: "encrypted_data") {
            column(name: "id", type: "varchar(32)") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "encrypted_datPK")
            }

            column(name: "version", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "data_item", type: "varchar(512)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-9") {
        createTable(tableName: "evenement_candidat") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "evenement_canPK")
            }

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "contact_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "date_event", type: "timestamp")

            column(name: "responsable", type: "varchar(50)")

            column(name: "typage_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-10") {
        createTable(tableName: "evenement_candidature") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "evenement_canturePK")
            }

            column(name: "candidature_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "date_evt_candidature", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "typage_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-11") {
        createTable(tableName: "experience") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "experiencePK")
            }

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "date_debut", type: "timestamp")

            column(name: "date_fin", type: "timestamp")

            column(name: "entreprise", type: "varchar(100)")

            column(name: "intitule_poste", type: "varchar(100)")

            column(name: "mission", type: "varchar(65535)")

            column(name: "nbr_personne_encadre", type: "int4")

            column(name: "poste_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "rattachement", type: "varchar(50)")

            column(name: "secteur_activite_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "type_entreprise_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "ville", type: "varchar(255)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-12") {
        createTable(tableName: "fonctionnalite") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "fonctionnalitPK")
            }

            column(name: "code", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "code_libelle", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "module_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "ordre", type: "int4")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-13") {
        createTable(tableName: "formation") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "formationPK")
            }

            column(name: "annee", type: "varchar(255)")

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "description", type: "varchar(65535)")

            column(name: "diplome_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "etablissement", type: "varchar(100)")

            column(name: "intitule_diplome", type: "varchar(100)")

            column(name: "option_formation", type: "varchar(100)")

            column(name: "pays", type: "varchar(50)")

            column(name: "type_etablissement_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "ville", type: "varchar(50)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-14") {
        createTable(tableName: "interlocuteur_contact") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "interlocuteurPK")
            }

            column(name: "contact_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "email", type: "varchar(100)") {
                constraints(nullable: "false")
            }

            column(name: "fonction", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "nom", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "prenom", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "telephone_fixe", type: "varchar(30)") {
                constraints(nullable: "false")
            }

            column(name: "telephone_portable", type: "varchar(30)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-15") {
        createTable(tableName: "mission") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "missionPK")
            }

            column(name: "annee_sequence", type: "varchar(255)")

            column(name: "approche", type: "varchar(255)")

            column(name: "assistant_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "budget", type: "varchar(255)")

            column(name: "charge_recherche_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "code", type: "varchar(255)")

            column(name: "comportement", type: "varchar(65535)")

            column(name: "connaissance_infos", type: "varchar(65535)")

            column(name: "consultant_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "contact_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "contexte", type: "varchar(255)")

            column(name: "date_demarrage", type: "timestamp")

            column(name: "date_fin_garantie", type: "timestamp")

            column(name: "date_publication", type: "timestamp")

            column(name: "delais_realisation", type: "int4")

            column(name: "deplacement", type: "varchar(255)")

            column(name: "deplacement_localisation", type: "varchar(60)")

            column(name: "descriptif_poste", type: "varchar(65535)")

            column(name: "descriptif_societe", type: "varchar(65535)")

            column(name: "description", type: "varchar(65535)")

            column(name: "duree_garantie", type: "int4")

            column(name: "effectif_equipe", type: "int4")

            column(name: "email_interlocuteur", type: "varchar(255)")

            column(name: "entreprise", type: "varchar(255)")

            column(name: "etape_avancement_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "formation_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "interlocuteur", type: "varchar(255)")

            column(name: "localisation", type: "varchar(255)")

            column(name: "nbr_annee_experience", type: "int4")

            column(name: "niveau_etude_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "plage_experience_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "poste", type: "varchar(255)")

            column(name: "profil_candidat", type: "varchar(65535)")

            column(name: "profil_equipe", type: "varchar(65535)")

            column(name: "publier_annonce", type: "bool")

            column(name: "rattachement_fonctionnel", type: "varchar(255)")

            column(name: "rattachement_hierarchique", type: "varchar(255)")

            column(name: "reference", type: "varchar(255)")

            column(name: "remuneration_avantages", type: "varchar(65535)")

            column(name: "replanifier", type: "bool")

            column(name: "secteur_activite_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "sequence", type: "int4")

            column(name: "statut_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "type_fonction_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "type_formation", type: "varchar(255)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-16") {
        createTable(tableName: "module") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "modulePK")
            }

            column(name: "code", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "code_libelle", type: "varchar(255)") {
                constraints(nullable: "false")
            }

            column(name: "ordre", type: "varchar(255)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-17") {
        createTable(tableName: "planification") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "planificationPK")
            }

            column(name: "applicable", type: "bool")

            column(name: "date_debut", type: "timestamp")

            column(name: "date_debut_replanifie", type: "timestamp")

            column(name: "date_fin", type: "timestamp")

            column(name: "date_fin_replanifie", type: "timestamp")

            column(name: "mission_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "typage_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-18") {
        createTable(tableName: "profil") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "profilPK")
            }

            column(name: "code", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "code_libelle", type: "varchar(40)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-19") {
        createTable(tableName: "profil_fonctionnalites") {
            column(name: "fonctionnalite_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "profil_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-20") {
        createTable(tableName: "rendez_vous") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "rendez_vousPK")
            }

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "commentaire", type: "varchar(65535)")

            column(name: "contact_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "date_rdv", type: "timestamp") {
                constraints(nullable: "false")
            }

            column(name: "emplacement", type: "varchar(400)")

            column(name: "heure", type: "varchar(10)") {
                constraints(nullable: "false")
            }

            column(name: "typage_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "utilisateur_id", type: "int8") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-21") {
        createTable(tableName: "requete_recherche_candidat") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "requete_rechePK")
            }

            column(name: "annote", type: "bool")

            column(name: "date_creation_max", type: "timestamp")

            column(name: "date_creation_min", type: "timestamp")

            column(name: "date_modification_max", type: "timestamp")

            column(name: "date_modification_min", type: "timestamp")

            column(name: "date_naissance_max", type: "timestamp")

            column(name: "date_naissance_min", type: "timestamp")

            column(name: "diplome_id", type: "int8")

            column(name: "libelle", type: "varchar(200)") {
                constraints(nullable: "false")
            }

            column(name: "mot_cle", type: "varchar(255)")

            column(name: "nbr_annees_experiences_id", type: "int8")

            column(name: "niveau_etude_id", type: "int8")

            column(name: "nom_candidat", type: "varchar(255)")

            column(name: "prenom_candidat", type: "varchar(255)")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-22") {
        createTable(tableName: "requete_recherche_candidat_typage") {
            column(name: "requete_recherche_candidat_typages_id", type: "int8")

            column(name: "typage_id", type: "int8")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-23") {
        createTable(tableName: "test") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "testPK")
            }

            column(name: "candidat_id", type: "int8") {
                constraints(nullable: "false")
            }

            column(name: "commentaire", type: "varchar(65535)")

            column(name: "date_test", type: "timestamp")

            column(name: "titre", type: "varchar(20)") {
                constraints(nullable: "false")
            }
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-24") {
        createTable(tableName: "typage") {
            column(name: "id", type: "int8") {
                constraints(nullable: "false", primaryKey: "true", primaryKeyName: "typagePK")
            }

            column(name: "code", type: "varchar(50)")

            column(name: "code_type", type: "varchar(50)") {
                constraints(nullable: "false")
            }

            column(name: "libelle", type: "varchar(200)") {
                constraints(nullable: "false")
            }

            column(name: "ordre", type: "int4")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-25") {
        addPrimaryKey(columnNames: "profil_id, fonctionnalite_id", tableName: "profil_fonctionnalites")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-82") {
        createIndex(indexName: "email_uniq_1392086092447", tableName: "authentification", unique: "true") {
            column(name: "email")
        }
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-83") {
        createSequence(sequenceName: "hibernate_sequence")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-26") {
        addForeignKeyConstraint(baseColumnNames: "lnk_id", baseTableName: "attachment", constraintName: "FK8AF75923BE8D343C", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "attachment_link", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-27") {
        addForeignKeyConstraint(baseColumnNames: "annotation_note_id", baseTableName: "authentification", constraintName: "FK109DA77BC083D812", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-28") {
        addForeignKeyConstraint(baseColumnNames: "annotation_profil_id", baseTableName: "authentification", constraintName: "FK109DA77B843C3188", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-29") {
        addForeignKeyConstraint(baseColumnNames: "civilite_id", baseTableName: "authentification", constraintName: "FK109DA77B8A9C732D", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-30") {
        addForeignKeyConstraint(baseColumnNames: "niveau_etude_id", baseTableName: "authentification", constraintName: "FK109DA77BD71ED00E", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-31") {
        addForeignKeyConstraint(baseColumnNames: "plage_experience_id", baseTableName: "authentification", constraintName: "FK109DA77BC14872EE", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-32") {
        addForeignKeyConstraint(baseColumnNames: "profil_id", baseTableName: "authentification", constraintName: "FK109DA77B8321D240", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "profil", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-33") {
        addForeignKeyConstraint(baseColumnNames: "situation_familiale_id", baseTableName: "authentification", constraintName: "FK109DA77BE646236F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-34") {
        addForeignKeyConstraint(baseColumnNames: "typage_id", baseTableName: "authentification", constraintName: "FK109DA77BDED0D340", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-35") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "candidature", constraintName: "FKD0428B063C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-36") {
        addForeignKeyConstraint(baseColumnNames: "etape_avancement_id", baseTableName: "candidature", constraintName: "FKD0428B065A56157A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-37") {
        addForeignKeyConstraint(baseColumnNames: "evaluation_id", baseTableName: "candidature", constraintName: "FKD0428B06B6E4D198", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-38") {
        addForeignKeyConstraint(baseColumnNames: "mission_id", baseTableName: "candidature", constraintName: "FKD0428B066F6ADCF4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "mission", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-39") {
        addForeignKeyConstraint(baseColumnNames: "statut_id", baseTableName: "candidature", constraintName: "FKD0428B064AE13981", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-40") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "connaissance_linguistique", constraintName: "FK4D8D46DF3C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-41") {
        addForeignKeyConstraint(baseColumnNames: "mission_id", baseTableName: "connaissance_linguistique", constraintName: "FK4D8D46DF6F6ADCF4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "mission", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-42") {
        addForeignKeyConstraint(baseColumnNames: "typage_by_fk_langue_id_id", baseTableName: "connaissance_linguistique", constraintName: "FK4D8D46DF1467BDB5", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-43") {
        addForeignKeyConstraint(baseColumnNames: "typage_by_fk_niveau_id_id", baseTableName: "connaissance_linguistique", constraintName: "FK4D8D46DF757F7C15", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-44") {
        addForeignKeyConstraint(baseColumnNames: "secteur_activite_id", baseTableName: "contact", constraintName: "FK38B72420A7A4B1D9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-45") {
        addForeignKeyConstraint(baseColumnNames: "type_entreprise_id", baseTableName: "contact", constraintName: "FK38B72420CF704694", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-46") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "evenement_candidat", constraintName: "FKB3B8DC383C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-47") {
        addForeignKeyConstraint(baseColumnNames: "contact_id", baseTableName: "evenement_candidat", constraintName: "FKB3B8DC387652E474", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "contact", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-48") {
        addForeignKeyConstraint(baseColumnNames: "typage_id", baseTableName: "evenement_candidat", constraintName: "FKB3B8DC38DED0D340", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-49") {
        addForeignKeyConstraint(baseColumnNames: "candidature_id", baseTableName: "evenement_candidature", constraintName: "FK7564DE30F253C5B4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "candidature", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-50") {
        addForeignKeyConstraint(baseColumnNames: "typage_id", baseTableName: "evenement_candidature", constraintName: "FK7564DE30DED0D340", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-51") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "experience", constraintName: "FKFAE6596A3C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-52") {
        addForeignKeyConstraint(baseColumnNames: "poste_id", baseTableName: "experience", constraintName: "FKFAE6596AF36C246F", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-53") {
        addForeignKeyConstraint(baseColumnNames: "secteur_activite_id", baseTableName: "experience", constraintName: "FKFAE6596AA7A4B1D9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-54") {
        addForeignKeyConstraint(baseColumnNames: "type_entreprise_id", baseTableName: "experience", constraintName: "FKFAE6596ACF704694", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-55") {
        addForeignKeyConstraint(baseColumnNames: "module_id", baseTableName: "fonctionnalite", constraintName: "FK541BB7B35D3EA440", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "module", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-56") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "formation", constraintName: "FK6BFA88B13C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-57") {
        addForeignKeyConstraint(baseColumnNames: "diplome_id", baseTableName: "formation", constraintName: "FK6BFA88B18A45232E", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-58") {
        addForeignKeyConstraint(baseColumnNames: "type_etablissement_id", baseTableName: "formation", constraintName: "FK6BFA88B1E4566F43", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-59") {
        addForeignKeyConstraint(baseColumnNames: "contact_id", baseTableName: "interlocuteur_contact", constraintName: "FK830C2C407652E474", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "contact", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-60") {
        addForeignKeyConstraint(baseColumnNames: "assistant_id", baseTableName: "mission", constraintName: "FK3FBE818C37D55759", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-61") {
        addForeignKeyConstraint(baseColumnNames: "charge_recherche_id", baseTableName: "mission", constraintName: "FK3FBE818CD616BEC7", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-62") {
        addForeignKeyConstraint(baseColumnNames: "consultant_id", baseTableName: "mission", constraintName: "FK3FBE818C13CD629C", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-63") {
        addForeignKeyConstraint(baseColumnNames: "contact_id", baseTableName: "mission", constraintName: "FK3FBE818C7652E474", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "contact", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-64") {
        addForeignKeyConstraint(baseColumnNames: "etape_avancement_id", baseTableName: "mission", constraintName: "FK3FBE818C5A56157A", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-65") {
        addForeignKeyConstraint(baseColumnNames: "formation_id", baseTableName: "mission", constraintName: "FK3FBE818C5E2FE003", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-66") {
        addForeignKeyConstraint(baseColumnNames: "niveau_etude_id", baseTableName: "mission", constraintName: "FK3FBE818CD71ED00E", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-67") {
        addForeignKeyConstraint(baseColumnNames: "plage_experience_id", baseTableName: "mission", constraintName: "FK3FBE818CC14872EE", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-68") {
        addForeignKeyConstraint(baseColumnNames: "secteur_activite_id", baseTableName: "mission", constraintName: "FK3FBE818CA7A4B1D9", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-69") {
        addForeignKeyConstraint(baseColumnNames: "statut_id", baseTableName: "mission", constraintName: "FK3FBE818C4AE13981", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-70") {
        addForeignKeyConstraint(baseColumnNames: "type_fonction_id", baseTableName: "mission", constraintName: "FK3FBE818CCFC0F3D", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-71") {
        addForeignKeyConstraint(baseColumnNames: "mission_id", baseTableName: "planification", constraintName: "FK8F2FA9556F6ADCF4", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "mission", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-72") {
        addForeignKeyConstraint(baseColumnNames: "typage_id", baseTableName: "planification", constraintName: "FK8F2FA955DED0D340", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-73") {
        addForeignKeyConstraint(baseColumnNames: "fonctionnalite_id", baseTableName: "profil_fonctionnalites", constraintName: "FK63A9DB1D8E39E4E0", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "fonctionnalite", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-74") {
        addForeignKeyConstraint(baseColumnNames: "profil_id", baseTableName: "profil_fonctionnalites", constraintName: "FK63A9DB1D8321D240", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "profil", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-75") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "rendez_vous", constraintName: "FKACA51D183C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-76") {
        addForeignKeyConstraint(baseColumnNames: "contact_id", baseTableName: "rendez_vous", constraintName: "FKACA51D187652E474", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "contact", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-77") {
        addForeignKeyConstraint(baseColumnNames: "typage_id", baseTableName: "rendez_vous", constraintName: "FKACA51D18DED0D340", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-78") {
        addForeignKeyConstraint(baseColumnNames: "utilisateur_id", baseTableName: "rendez_vous", constraintName: "FKACA51D18AA0B9894", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-79") {
        addForeignKeyConstraint(baseColumnNames: "requete_recherche_candidat_typages_id", baseTableName: "requete_recherche_candidat_typage", constraintName: "FKB245C26DF99B4E38", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "requete_recherche_candidat", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-80") {
        addForeignKeyConstraint(baseColumnNames: "typage_id", baseTableName: "requete_recherche_candidat_typage", constraintName: "FKB245C26DDED0D340", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "typage", referencesUniqueColumn: "false")
    }

    changeSet(author: "rabbah (generated)", id: "1392086092673-81") {
        addForeignKeyConstraint(baseColumnNames: "candidat_id", baseTableName: "test", constraintName: "FK3644923C61F700", deferrable: "false", initiallyDeferred: "false", referencedColumnNames: "id", referencedTableName: "authentification", referencesUniqueColumn: "false")
    }
}
