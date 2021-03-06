// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.domain.Book;
import java.util.List;
import org.springframework.transaction.annotation.Transactional;

privileged aspect Book_Roo_Jpa_ActiveRecord {
    
    public static final List<String> Book.fieldNames4OrderClauseFilter = java.util.Arrays.asList("");
    
    public static long Book.countBooks() {
        return entityManager().createQuery("SELECT COUNT(o) FROM Book o", Long.class).getSingleResult();
    }
    
    public static List<Book> Book.findAllBooks() {
        return entityManager().createQuery("SELECT o FROM Book o", Book.class).getResultList();
    }
    
    public static List<Book> Book.findAllBooks(String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Book o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Book.class).getResultList();
    }
    
    public static Book Book.findBook(Long id_) {
        if (id_ == null) return null;
        return entityManager().find(Book.class, id_);
    }
    
    public static List<Book> Book.findBookEntries(int firstResult, int maxResults) {
        return entityManager().createQuery("SELECT o FROM Book o", Book.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    public static List<Book> Book.findBookEntries(int firstResult, int maxResults, String sortFieldName, String sortOrder) {
        String jpaQuery = "SELECT o FROM Book o";
        if (fieldNames4OrderClauseFilter.contains(sortFieldName)) {
            jpaQuery = jpaQuery + " ORDER BY " + sortFieldName;
            if ("ASC".equalsIgnoreCase(sortOrder) || "DESC".equalsIgnoreCase(sortOrder)) {
                jpaQuery = jpaQuery + " " + sortOrder;
            }
        }
        return entityManager().createQuery(jpaQuery, Book.class).setFirstResult(firstResult).setMaxResults(maxResults).getResultList();
    }
    
    @Transactional
    public Book Book.merge() {
        if (this.entityManager == null) this.entityManager = entityManager();
        Book merged = this.entityManager.merge(this);
        this.entityManager.flush();
        return merged;
    }
    
}
