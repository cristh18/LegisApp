package com.legis.demo.dao;
import com.legis.demo.domain.Category;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Category.class)
public interface CategoryDAO {
}
