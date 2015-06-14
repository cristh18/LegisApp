package com.legis.demo.controller;
import com.legis.demo.domain.Autor;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/autors")
@Controller
@RooWebScaffold(path = "autors", formBackingObject = Autor.class)
public class AutorController {
}
