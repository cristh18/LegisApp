package com.legis.demo.dao;
import com.legis.demo.domain.Publication;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Publication.class)
public interface PublicationDAO {
}
