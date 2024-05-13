package Model.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;


@Controller
public class HomeController extends BaseController {
	@RequestMapping(value = { "/", "/trang-chu" })
	public ModelAndView Index() {
		_mvShare.addObject("books", _HomeService.GetDataBooks());
		_mvShare.addObject("authors", _HomeService.getDataAuthor());
		_mvShare.addObject("categories", _HomeService.getDataCategories());
		_mvShare.addObject("booksDto", _HomeService.GetDataBooksDto());
		_mvShare.addObject("notifications", _HomeService.GetDataNotification());
		_mvShare.setViewName("user/index");
		return _mvShare;
	}
	
	@RequestMapping(value = "/notification")
	public ModelAndView ThongBao() {
		ModelAndView mv = new ModelAndView("user/notification");
		mv.addObject("notifications", _HomeService.GetDataNotification());
		return mv;
	}
	@RequestMapping(value = "/sach")
	public ModelAndView Sach() {
		ModelAndView mv = new ModelAndView("user/sach");
		mv.addObject("books", _HomeService.GetDataBooks());
		mv.addObject("categories", _HomeService.getDataCategories());
		mv.addObject("booksDto", _HomeService.GetDataBooksDto());
		return mv;
	}
}
