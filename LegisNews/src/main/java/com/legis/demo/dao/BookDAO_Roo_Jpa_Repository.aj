// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.dao;

import com.legis.demo.dao.BookDAO;
import com.legis.demo.domain.Book;
import org.springframework.data.jpa.repository.JpaRepository;
import org.springframework.data.jpa.repository.JpaSpecificationExecutor;
import org.springframework.stereotype.Repository;

privileged aspect BookDAO_Roo_Jpa_Repository {
    
    declare parents: BookDAO extends JpaRepository<Book, Long>;
    
    declare parents: BookDAO extends JpaSpecificationExecutor<Book>;
    
    declare @type: BookDAO: @Repository;
    
}
