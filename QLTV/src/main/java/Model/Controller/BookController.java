package Model.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.BooksDto;
import Model.Entity.SearchBook;
import Model.Service.BookServiceImpl;


@Controller
public class BookController extends BaseController {
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
	
	@RequestMapping(value = "/sach")
	public ModelAndView Sach() {
		ModelAndView mv = new ModelAndView("user/sach");
		mv.addObject("books", _HomeService.GetDataBooks());
		mv.addObject("categories", _HomeService.getDataCategories());
		mv.addObject("booksDto", _HomeService.GetDataBooksDto());
		mv.addObject("search", new SearchBook());
		return mv;
	}
	
	@RequestMapping(value = "timKiemSach", method = RequestMethod.POST)
    public ModelAndView timSach(@ModelAttribute("search") SearchBook search) {
        ModelAndView mv = new ModelAndView("user/sach");
        mv.addObject("categories", _HomeService.getDataCategories());
        List<BooksDto> searchResults = book.GetDataSearchBookDto(search.getBookName());
        mv.addObject("booksDto", searchResults);
        return mv;
    }
	
	@RequestMapping(value = "filterCategory/{categoryId}",method = RequestMethod.POST)
	public ModelAndView filterCategory(@PathVariable int categoryId) {
		ModelAndView mv = new ModelAndView("user/sach");
		mv.addObject("categories", _HomeService.getDataCategories());
		mv.addObject("booksDto", book.getDataFilterBookDto(categoryId));
		mv.addObject("search", new SearchBook());
		return mv;
	}

}
