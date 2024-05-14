package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Authors;
import Model.Service.AuthorServiceImpl;

@Controller
public class AuthorController {
	@Autowired
	AuthorServiceImpl authorImpl = new AuthorServiceImpl();

	@RequestMapping(value = "authors", method = RequestMethod.GET)
	public ModelAndView TacGiaQuanLy() {
		ModelAndView mv = new ModelAndView("admin/author");
		mv.addObject("authors", authorImpl.getDataAuthor());
		return mv;
	}
	@RequestMapping(value = "addAuthor", method = RequestMethod.GET)
	public ModelAndView ThemTacGia() {
		ModelAndView mv = new ModelAndView("admin/ThemTacGia");
		mv.addObject("authors", authorImpl.getDataAuthor());
		mv.addObject("insertAuthor", new Authors());
		return mv;
	}

	@RequestMapping(value = "addAuthor", method = RequestMethod.POST)
	public ModelAndView ThemTacGia(@ModelAttribute("insertAuthor") Authors authors) {
		int rs = authorImpl.insertAuthor(authors);
		ModelAndView mv = new ModelAndView("admin/ThemTacGia");
		
		if (rs > 0) {
			mv.addObject("message", "Thêm thành công");
			mv.addObject("authors", authorImpl.getDataAuthor());
		} else {
			mv.addObject("message", "Thêm thất bại");
		}
		return mv;
	}

	@RequestMapping(value = "/updateAuthor/{id}", method = RequestMethod.GET)
	public ModelAndView updateAuthor(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/updateAuthor");
		mv.addObject("editAuthor", authorImpl.getAuFromId(id));
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = "/updateAuthor/{id}", method = RequestMethod.POST)
	public ModelAndView updateAuthor(@PathVariable int id, @ModelAttribute("editAuthor") Authors authors) {
		ModelAndView mv = new ModelAndView("admin/updateAuthor");
		int rs = authorImpl.updateAuthor(id, authors);
		if (rs > 0) {
			mv.addObject("message", "SỬA TÁC GIẢ THÀNH CÔNG");

		} else {
			mv.addObject("message", "SỬA TÁC GIẢ THẤT BẠI");
		}
		return mv;
	}

	@RequestMapping(value = "/deleteAuthor/{id}", method = RequestMethod.POST)
	public ModelAndView deleteAuthor(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/author");
		
		int rs = authorImpl.deleteAuthor(id);
		mv.addObject("authors", authorImpl.getDataAuthor());
		if (rs > 0) {
			mv.addObject("message", "Xoá thành công");
		} else {
			mv.addObject("message", "Xoá thất bại");
		}
		return mv;
	}
}
