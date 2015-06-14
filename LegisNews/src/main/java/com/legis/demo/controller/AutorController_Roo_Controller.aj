// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.controller;

import com.legis.demo.controller.AutorController;
import com.legis.demo.dao.AutorDAO;
import com.legis.demo.dao.PublicationDAO;
import com.legis.demo.domain.Autor;
import java.io.UnsupportedEncodingException;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect AutorController_Roo_Controller {
    
    @Autowired
    AutorDAO AutorController.autorDAO;
    
    @Autowired
    PublicationDAO AutorController.publicationDAO;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String AutorController.create(@Valid Autor autor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, autor);
            return "autors/create";
        }
        uiModel.asMap().clear();
        autorDAO.save(autor);
        return "redirect:/autors/" + encodeUrlPathSegment(autor.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String AutorController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Autor());
        return "autors/create";
    }
    
    @RequestMapping(value = "/{id_}", produces = "text/html")
    public String AutorController.show(@PathVariable("id_") Long id_, Model uiModel) {
        uiModel.addAttribute("autor", autorDAO.findOne(id_));
        uiModel.addAttribute("itemId", id_);
        return "autors/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String AutorController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("autors", Autor.findAutorEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) autorDAO.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("autors", Autor.findAllAutors(sortFieldName, sortOrder));
        }
        return "autors/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String AutorController.update(@Valid Autor autor, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, autor);
            return "autors/update";
        }
        uiModel.asMap().clear();
        autorDAO.save(autor);
        return "redirect:/autors/" + encodeUrlPathSegment(autor.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id_}", params = "form", produces = "text/html")
    public String AutorController.updateForm(@PathVariable("id_") Long id_, Model uiModel) {
        populateEditForm(uiModel, autorDAO.findOne(id_));
        return "autors/update";
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, produces = "text/html")
    public String AutorController.delete(@PathVariable("id_") Long id_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Autor autor = autorDAO.findOne(id_);
        autorDAO.delete(autor);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/autors";
    }
    
    void AutorController.populateEditForm(Model uiModel, Autor autor) {
        uiModel.addAttribute("autor", autor);
        uiModel.addAttribute("publications", publicationDAO.findAll());
    }
    
    String AutorController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}
