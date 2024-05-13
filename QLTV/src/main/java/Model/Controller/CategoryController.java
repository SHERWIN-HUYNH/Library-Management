package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Categories;
import Model.Service.CategoryServiceImpl;

@Controller
public class CategoryController {
	@Autowired
	CategoryServiceImpl category = new CategoryServiceImpl();
	
	@RequestMapping(value = "category", method = RequestMethod.GET)
	public ModelAndView tacGiaQuanLy() {
		ModelAndView mv = new ModelAndView("admin/quanLyTheLoai");
		mv.addObject("categories", category.getDataCategories());
		mv.addObject("addCategory", new Categories());
		return mv;
	}
	
	@RequestMapping(value ="category", method = RequestMethod.POST)
	public ModelAndView addBook(@ModelAttribute("addCategory") Categories c) {
		ModelAndView mv = new ModelAndView("admin/quanLyTheLoai");
		mv.addObject("categories", category.getDataCategories());
		int rs = category.addCategory(c);
		if (rs > 0) {
			mv.addObject("message", "Thêm thành công");
			mv.addObject("categories", category.getDataCategories());
		}
		else {
			mv.addObject("message", "Thêm thất bại");
		}
		return mv;
	}
}
