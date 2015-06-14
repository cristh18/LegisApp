// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.controller;

import com.legis.demo.controller.CommentController;
import com.legis.demo.dao.CommentDAO;
import com.legis.demo.dao.PublicationDAO;
import com.legis.demo.domain.Comment;
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

privileged aspect CommentController_Roo_Controller {
    
    @Autowired
    CommentDAO CommentController.commentDAO;
    
    @Autowired
    PublicationDAO CommentController.publicationDAO;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String CommentController.create(@Valid Comment comment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, comment);
            return "comments/create";
        }
        uiModel.asMap().clear();
        commentDAO.save(comment);
        return "redirect:/comments/" + encodeUrlPathSegment(comment.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String CommentController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Comment());
        return "comments/create";
    }
    
    @RequestMapping(value = "/{id_}", produces = "text/html")
    public String CommentController.show(@PathVariable("id_") Long id_, Model uiModel) {
        uiModel.addAttribute("comment", commentDAO.findOne(id_));
        uiModel.addAttribute("itemId", id_);
        return "comments/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String CommentController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("comments", Comment.findCommentEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) commentDAO.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("comments", Comment.findAllComments(sortFieldName, sortOrder));
        }
        return "comments/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String CommentController.update(@Valid Comment comment, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, comment);
            return "comments/update";
        }
        uiModel.asMap().clear();
        commentDAO.save(comment);
        return "redirect:/comments/" + encodeUrlPathSegment(comment.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id_}", params = "form", produces = "text/html")
    public String CommentController.updateForm(@PathVariable("id_") Long id_, Model uiModel) {
        populateEditForm(uiModel, commentDAO.findOne(id_));
        return "comments/update";
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, produces = "text/html")
    public String CommentController.delete(@PathVariable("id_") Long id_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Comment comment = commentDAO.findOne(id_);
        commentDAO.delete(comment);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/comments";
    }
    
    void CommentController.populateEditForm(Model uiModel, Comment comment) {
        uiModel.addAttribute("comment", comment);
        uiModel.addAttribute("publications", publicationDAO.findAll());
    }
    
    String CommentController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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