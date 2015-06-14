package com.legis.demo.dao;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = com.legis.demo.domain.News.class)
public interface NewsDAO {
}
