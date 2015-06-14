package com.legis.demo.dao;
import com.legis.demo.domain.Autor;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Autor.class)
public interface AutorDAO {
}
