// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.domain.Category;
import com.legis.demo.domain.Publication;

privileged aspect Publication_Roo_JavaBean {
    
    public Long Publication.getId() {
        return this.id;
    }
    
    public void Publication.setId(Long id) {
        this.id = id;
    }
    
    public String Publication.getPublicationName() {
        return this.publicationName;
    }
    
    public void Publication.setPublicationName(String publicationName) {
        this.publicationName = publicationName;
    }
    
    public Long Publication.getPublicationNumber() {
        return this.publicationNumber;
    }
    
    public void Publication.setPublicationNumber(Long publicationNumber) {
        this.publicationNumber = publicationNumber;
    }
    
    public Category Publication.getCategory() {
        return this.category;
    }
    
    public void Publication.setCategory(Category category) {
        this.category = category;
    }
    
}
