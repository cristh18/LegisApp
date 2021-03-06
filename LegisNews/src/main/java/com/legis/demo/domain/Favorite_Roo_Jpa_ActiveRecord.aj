// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.domain.Favorite;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Favorite_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Favorite.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static long Favorite.countFavorites() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Favorite o", Long.class).getSingleResult();
    }
    
    public static List<Favorite> Favorite.findAllFavorites() {
        return entityManager().createQuery("SELECT o FROM Favorite o", Favorite.class).getResultList();
    }
    
    public static List<Favorite> Favorite.findAllFavorites(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Favorite o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Favorite.class).getResultList();
    }
    
    public static Favorite Favorite.findFavorite(Long id_) {
        if (id_ == null) return null;
        return entityManager().find(Favorite.class, id_);
    }
    
    public static List<Favorite> Favorite.findFavoriteEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Favorite o", Favorite.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Favorite> Favorite.findFavoriteEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Favorite o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Favorite.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Favorite Favorite.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Favorite merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
