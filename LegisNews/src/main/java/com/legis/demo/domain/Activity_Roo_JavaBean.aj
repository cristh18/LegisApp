// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.domain.Activity;
import com.legis.demo.domain.Publication;

privileged aspect Activity_Roo_JavaBean {
    
    public Long Activity.getId() {
        return this.id;
    }
    
    public void Activity.setId(Long id) {
        this.id = id;
    }
    
    public String Activity.getActivityName() {
        return this.activityName;
    }
    
    public void Activity.setActivityName(String activityName) {
        this.activityName = activityName;
    }
    
    public Publication Activity.getPublication() {
        return this.publication;
    }
    
    public void Activity.setPublication(Publication publication) {
        this.publication = publication;
    }
    
}
