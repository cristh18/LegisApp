package com.legis.demo.domain;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(inheritanceType = "SINGLE_TABLE")
public class Publication {

    /**
     */
    @NotNull
    private Long id;

    /**
     */
    @NotNull
    @Size(max = 20)
    private String publicationName;

    /**
     */
    @NotNull
    private Long publicationNumber;

    /**
     */
    @ManyToOne
    @JoinColumn(name = "ID_CATEGORY")
    private Category category;
}
