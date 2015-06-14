package com.legis.demo.controller;
import com.legis.demo.domain.Favorite;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

@RequestMapping("/favorites")
@Controller
@RooWebScaffold(path = "favorites", formBackingObject = Favorite.class)
public class FavoriteController {
}
