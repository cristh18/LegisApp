// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.controller;

import com.legis.demo.controller.PublicationController;
import com.legis.demo.dao.CategoryDAO;
import com.legis.demo.dao.PublicationDAO;
import com.legis.demo.domain.Publication;
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

privileged aspect PublicationController_Roo_Controller {
    
    @Autowired
    PublicationDAO PublicationController.publicationDAO;
    
    @Autowired
    CategoryDAO PublicationController.categoryDAO;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String PublicationController.create(@Valid Publication publication, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, publication);
            return "publications/create";
        }
        uiModel.asMap().clear();
        publicationDAO.save(publication);
        return "redirect:/publications/" + encodeUrlPathSegment(publication.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String PublicationController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Publication());
        return "publications/create";
    }
    
    @RequestMapping(value = "/{id_}", produces = "text/html")
    public String PublicationController.show(@PathVariable("id_") Long id_, Model uiModel) {
        uiModel.addAttribute("publication", publicationDAO.findOne(id_));
        uiModel.addAttribute("itemId", id_);
        return "publications/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String PublicationController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("publications", Publication.findPublicationEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) publicationDAO.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("publications", Publication.findAllPublications(sortFieldName, sortOrder));
        }
        return "publications/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String PublicationController.update(@Valid Publication publication, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, publication);
            return "publications/update";
        }
        uiModel.asMap().clear();
        publicationDAO.save(publication);
        return "redirect:/publications/" + encodeUrlPathSegment(publication.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id_}", params = "form", produces = "text/html")
    public String PublicationController.updateForm(@PathVariable("id_") Long id_, Model uiModel) {
        populateEditForm(uiModel, publicationDAO.findOne(id_));
        return "publications/update";
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, produces = "text/html")
    public String PublicationController.delete(@PathVariable("id_") Long id_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Publication publication = publicationDAO.findOne(id_);
        publicationDAO.delete(publication);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/publications";
    }
    
    void PublicationController.populateEditForm(Model uiModel, Publication publication) {
        uiModel.addAttribute("publication", publication);
        uiModel.addAttribute("categorys", categoryDAO.findAll());
    }
    
    String PublicationController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
