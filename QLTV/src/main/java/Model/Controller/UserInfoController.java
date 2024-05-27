package Model.Controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Admin;
import Model.Entity.Readers;
import Model.Service.BookServiceImpl;
import Model.Service.UserInfoServiceImpl;

@Controller
public class UserInfoController {

	@Autowired
	UserInfoServiceImpl userInfoService = new UserInfoServiceImpl();

	@Autowired
	BookServiceImpl bookService = new BookServiceImpl();

	@RequestMapping(value = "userInfo", method = RequestMethod.GET)
	public ModelAndView userInfo(HttpSession session) {
		ModelAndView mv = new ModelAndView("user/UserProfile");
		Readers reader = (Readers) session.getAttribute("LoginReader");
		Admin admin = (Admin) session.getAttribute("loginAdmin");
		if (reader != null) {
			mv.addObject("user", reader);
		} else if (admin != null) {
			mv.addObject("user", admin);
		}
		return mv;
	}

	@RequestMapping(value = "updateUserInfo", method = RequestMethod.POST)
	public ModelAndView updateUserInfo(HttpSession session, @ModelAttribute("user") Readers user,
			RedirectAttributes redirectAttributes) {
		Readers sessionUser = (Readers) session.getAttribute("LoginReader");
		Admin sessionAdmin = (Admin) session.getAttribute("loginAdmin");

		try {
			if (sessionUser != null) {
				userInfoService.updateUserInfo(sessionUser.getId(), user);
				session.setAttribute("LoginReader", user);
			} else if (sessionAdmin != null) {
				Admin updatedAdmin = new Admin();
				updatedAdmin.setId(sessionAdmin.getId());
				updatedAdmin.setName(user.getName());
				updatedAdmin.setUsername(user.getUsername());
				updatedAdmin.setEmail(user.getEmail());
				userInfoService.updateAdminInfo(sessionAdmin.getId(), updatedAdmin);
				session.setAttribute("loginAdmin", updatedAdmin);
			}
			redirectAttributes.addFlashAttribute("message", "Sửa thông tin thành công!");
		} catch (Exception e) {
			redirectAttributes.addFlashAttribute("message", "Sửa thông tin thất bại!");
		}

		return new ModelAndView("redirect:/userInfo");
	}

	@RequestMapping(value = "userbook", method = RequestMethod.GET)
    public ModelAndView userBook(HttpSession session) {
        ModelAndView mv = new ModelAndView("user/MyBook");
        Readers reader = (Readers) session.getAttribute("LoginReader");
        if (reader != null) {
            List<ChiTietMuonTraDto> list = userInfoService.GetBookBorrowedByReaderId(reader.getId());
            mv.addObject("ctmtDtos", list);
            mv.addObject("bookDtos", bookService.GetDataBooksDto());
            System.out.println("Fetched book details for reader ID: " + reader.getId());
        } else {
            System.out.println("Reader is null");
        }
        return mv;
    }
	@RequestMapping(value = "searchBorrowedBook", method = RequestMethod.POST)
	public ModelAndView searchBorrowedBook(HttpSession session, @RequestParam("searchKeyword") String searchKeyword) {
	    ModelAndView mv = new ModelAndView("user/MyBook");
	    Readers reader = (Readers) session.getAttribute("LoginReader");
	    if (reader != null) {
	        List<ChiTietMuonTraDto> list = userInfoService.SearchBorrowedBooks(reader.getId(), searchKeyword);
	        mv.addObject("ctmtDtos", list);
	        mv.addObject("bookDtos", bookService.GetDataBooksDto());
	        System.out.println("Searched borrowed books for reader ID: " + reader.getId());
	    } else {
	        System.out.println("Reader is null");
	    }
	    return mv;
	}
	
}
