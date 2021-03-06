package com.legis.demo.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
public class Category {

    /**
     */
    @NotNull
    private Long id;

    /**
     */
    @NotNull
    @Size(max = 20)
    private String categoryName;
}
