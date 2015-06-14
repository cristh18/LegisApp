// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package com.legis.demo.controller;

import com.legis.demo.controller.BookController;
import com.legis.demo.dao.BookDAO;
import com.legis.demo.dao.CategoryDAO;
import com.legis.demo.domain.Book;
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

privileged aspect BookController_Roo_Controller {
    
    @Autowired
    BookDAO BookController.bookDAO;
    
    @Autowired
    CategoryDAO BookController.categoryDAO;
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BookController.create(@Valid Book book, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, book);
            return "books/create";
        }
        uiModel.asMap().clear();
        bookDAO.save(book);
        return "redirect:/books/" + encodeUrlPathSegment(book.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BookController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Book());
        return "books/create";
    }
    
    @RequestMapping(value = "/{id_}", produces = "text/html")
    public String BookController.show(@PathVariable("id_") Long id_, Model uiModel) {
        uiModel.addAttribute("book", bookDAO.findOne(id_));
        uiModel.addAttribute("itemId", id_);
        return "books/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BookController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("books", Book.findBookEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) bookDAO.count() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("books", Book.findAllBooks(sortFieldName, sortOrder));
        }
        return "books/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BookController.update(@Valid Book book, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, book);
            return "books/update";
        }
        uiModel.asMap().clear();
        bookDAO.save(book);
        return "redirect:/books/" + encodeUrlPathSegment(book.getId_().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id_}", params = "form", produces = "text/html")
    public String BookController.updateForm(@PathVariable("id_") Long id_, Model uiModel) {
        populateEditForm(uiModel, bookDAO.findOne(id_));
        return "books/update";
    }
    
    @RequestMapping(value = "/{id_}", method = RequestMethod.DELETE, produces = "text/html")
    public String BookController.delete(@PathVariable("id_") Long id_, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Book book = bookDAO.findOne(id_);
        bookDAO.delete(book);
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/books";
    }
    
    void BookController.populateEditForm(Model uiModel, Book book) {
        uiModel.addAttribute("book", book);
        uiModel.addAttribute("categorys", categoryDAO.findAll());
    }
    
    String BookController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
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
