package com.legis.demo.dao;
import com.legis.demo.domain.Comment;
import org.springframework.roo.addon.layers.repository.jpa.RooJpaRepository;

@RooJpaRepository(domainType = Comment.class)
public interface CommentDAO {
}
