package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.BooksDto;
import Model.Service.BookServiceImpl;


@Controller
public class BookController {
	@Autowired
	BookServiceImpl book = new BookServiceImpl();
	@RequestMapping(value = "dausach", method = RequestMethod.GET)
	public ModelAndView sachQuanLy() {
		ModelAndView mv = new ModelAndView("admin/DauSachQuanLy");
		mv.addObject("books", book.GetDataBooks());
		mv.addObject("categories", book.getDataCategories());
		mv.addObject("authors", book.getDataAuthor());
		mv.addObject("insertBook", new BooksDto());
		return mv;
	}
	@RequestMapping(value ="dausach", method = RequestMethod.POST)
	public ModelAndView addBook(@ModelAttribute("insertBook") BooksDto books) {
		ModelAndView mv = new ModelAndView("admin/DauSachQuanLy");
		int rs = book.insertBook(books);
		if (rs == 1) {
			mv.addObject("message", "Thêm thành công");
			mv.addObject("books", book.GetDataBooks());
			mv.addObject("categories", book.getDataCategories());
			mv.addObject("authors", book.getDataAuthor());
			mv.addObject("insertBook", new BooksDto());
		}
		else {
			mv.addObject("message", "Thêm thất bại");
		}
		return mv;
	}
}
