package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Authors;
import Model.Service.AuthorServiceImpl;

@Controller
public class AuthorController {
	@Autowired
	AuthorServiceImpl author = new AuthorServiceImpl();

	@RequestMapping(value = "authors", method = RequestMethod.GET)
	public ModelAndView tacGiaQuanLy() {
		ModelAndView mv = new ModelAndView("admin/author");
		mv.addObject("authors", author.getDataAuthor());
		mv.addObject("insertAuthor", new Authors());
		return mv;
	}

	@RequestMapping(value ="authors", method = RequestMethod.POST)
	public ModelAndView addBook(@ModelAttribute("insertAuthor") Authors authors, String authorName) {
		ModelAndView mv = new ModelAndView("admin/author");
		int rs = author.insertAuthor(authors);
		if (rs == 1) {
			mv.addObject("message", "Thêm thành công");
			mv.addObject("authors", author.getDataAuthor());
			mv.addObject("insertAuthor", new  Authors());
		}
		else {
			mv.addObject("message", "Thêm thất bại");
		}
		return mv;
	}
}
