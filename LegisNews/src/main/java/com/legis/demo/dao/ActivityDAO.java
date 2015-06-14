package com.legis.demo.dao;
import com.legis.demo.domain.Activity;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Activity.class)
public interface ActivityDAO {
}
