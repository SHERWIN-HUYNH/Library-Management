package Model.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.BooksDto;
import Model.Entity.Categories;
import Model.Entity.Pagination;
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

	@RequestMapping(value = "dausach", method = RequestMethod.POST)
	public ModelAndView addBook(@ModelAttribute("insertBook") BooksDto books) {
		ModelAndView mv = new ModelAndView("admin/DauSachQuanLy");
		int rs = book.insertBook(books);
		if (rs == 1) {
			mv.addObject("message", "Thêm thành công");
			mv.addObject("books", book.GetDataBooks());
			mv.addObject("categories", book.getDataCategories());
			mv.addObject("authors", book.getDataAuthor());
			mv.addObject("insertBook", new BooksDto());
		} else {
			mv.addObject("message", "Thêm thất bại");
		}
		return mv;
	}

//	@RequestMapping(value = "/sach")
//	public ModelAndView Sach() {
//		ModelAndView mv = new ModelAndView("user/sach");
//		mv.addObject("books", _HomeService.GetDataBooks());
//		mv.addObject("categories", _HomeService.getDataCategories());
//		mv.addObject("booksDto", _HomeService.GetDataBooksDto());
//		mv.addObject("search", new SearchBook());
//		return mv;
//	}
	@RequestMapping(value = "/sach", method = RequestMethod.GET)
	public String Sach(@RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int pageSize,
			@RequestParam(required = false) Integer categoryId, Model model) {
		Pagination<BooksDto> pagination;
		List<Categories> categories = book.getDataCategories();

		if (categoryId != null) {
			pagination = book.getBooksByCategory(categoryId, page, pageSize);
			model.addAttribute("selectedId", categoryId);
		} else {
			pagination = book.getPaginationBooks(page, pageSize);
		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", categories);
		model.addAttribute("search", new SearchBook());
		return "user/sach";
	}

	@RequestMapping(value = "timKiemSach", method = RequestMethod.POST)
	public String timSach(@ModelAttribute("search") SearchBook search, Model model,
	                      @RequestParam(defaultValue = "1") int page, @RequestParam(defaultValue = "4") int pageSize) {
	    Pagination<BooksDto> pagination = book.getDataSearchBookDto(search.getBookName(), page, pageSize);
	    model.addAttribute("pagination", pagination);
	    model.addAttribute("categories", book.getDataCategories());
	    model.addAttribute("search", new SearchBook());
	    return "user/sach";
	}


//	@RequestMapping(value = "filterCategory/{categoryId}",method = RequestMethod.POST)
//	public ModelAndView filterCategory(@PathVariable int categoryId) {
//		ModelAndView mv = new ModelAndView("user/sach");
//		mv.addObject("categories", _HomeService.getDataCategories());
//		mv.addObject("booksDto", book.getDataFilterBookDto(categoryId));
//		mv.addObject("search", new SearchBook());
//		return mv;
//	}

	@RequestMapping(value = "/filterCategory/page", method = RequestMethod.GET)
	public String filterCategory(@RequestParam(defaultValue = "1") int page,
			@RequestParam(defaultValue = "4") int pageSize, @RequestParam(required = false) Integer categoryId,
			Model model) {
		Pagination<BooksDto> pagination;

		List<Categories> categories = book.getDataCategories();

		if (categoryId != null) {
			pagination = book.getBooksByCategory(categoryId, page, pageSize);
			model.addAttribute("selectedId", categoryId);
		} else {
			pagination = book.getPaginationBooks(page, pageSize);
		}

		model.addAttribute("pagination", pagination);
		model.addAttribute("categories", categories);
		model.addAttribute("search", new SearchBook());
		return "user/sach";
	}

}
