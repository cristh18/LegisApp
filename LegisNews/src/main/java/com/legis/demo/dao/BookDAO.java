package com.legis.demo.dao;
import com.legis.demo.domain.Book;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Book.class)
public interface BookDAO {
}
