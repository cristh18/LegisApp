package com.legis.demo.dao;
import com.legis.demo.domain.Favorite;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Favorite.class)
public interface FavoriteDAO {
}
