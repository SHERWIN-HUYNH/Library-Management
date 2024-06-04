package Model.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


import Model.Entity.SearchBook;

@Controller
public class HomeController extends BaseController {
	
	@RequestMapping(value = { "/", "/trang-chu" })
	public ModelAndView Index() {
		_mvShare.addObject("books", _HomeService.GetDataBooks());
		_mvShare.addObject("authors", _HomeService.getDataAuthor());
		_mvShare.addObject("categories", _HomeService.getDataCategories());
		_mvShare.addObject("booksDto", _HomeService.GetDataBooksDto());
		_mvShare.addObject("notifications", _HomeService.GetDataNotification());
		_mvShare.addObject("search", new SearchBook());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}

	@RequestMapping(value = "/bookDetail/{id}")
	public ModelAndView BookDetail(@PathVariable int id ) {
		ModelAndView mv = new ModelAndView("user/book_detail");
		mv.addObject("selectedId", _HomeService.GetAllFromId(id));
		mv.addObject("categories", _HomeService.getDataCategories());
		mv.addObject("booksDto", _HomeService.GetDataBooksDto());
		return mv;
	}
}