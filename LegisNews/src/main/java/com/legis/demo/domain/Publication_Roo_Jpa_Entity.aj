// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.domain;

import com.legis.demo.domain.Publication;
import javax.persistence.Column;
import javax.persistence.DiscriminatorColumn;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Inheritance;
import javax.persistence.InheritanceType;
import javax.persistence.Version;

privileged aspect Publication_Roo_Jpa_Entity {
    
    declare @type: Publication: @Entity;
    
    declare @type: Publication: @Inheritance(strategy = InheritanceType.SINGLE_TABLE);
    
    declare @type: Publication: @DiscriminatorColumn;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id_")
    private Long Publication.id_;
    
    @Version
    @Column(name = "version")
    private Integer Publication.version;
    
    public Long Publication.getId_() {
        return this.id_;
    }
    
    public void Publication.setId_(Long id) {
        this.id_ = id;
    }
    
    public Integer Publication.getVersion() {
        return this.version;
    }
    
    public void Publication.setVersion(Integer version) {
        this.version = version;
    }
    
}
