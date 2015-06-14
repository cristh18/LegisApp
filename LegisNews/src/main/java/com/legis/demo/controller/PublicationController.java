package com.legis.demo.controller;
import com.legis.demo.domain.Publication;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/publications")
@Controller
@RooWebScaffold(path = "publications", formBackingObject = Publication.class)
public class PublicationController {
}
