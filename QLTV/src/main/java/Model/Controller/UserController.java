package Model.Controller;


import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Admin;
import Model.Entity.Readers;
import Model.Service.AccountServiceImpl;

@Controller
public class UserController extends BaseController {
	@Autowired
	AccountServiceImpl accountService = new AccountServiceImpl();

	@RequestMapping(value = "dang-ky", method = RequestMethod.GET)
	public ModelAndView DangKy() {
		_mvShare.setViewName("user/register");
		_mvShare.addObject("user", new Readers());
		return _mvShare;
	}
// modelAttribute controller = modelAttribute view 
	@RequestMapping(value = "dang-ky", method = RequestMethod.POST)
	public ModelAndView createAccount(@ModelAttribute("user")Readers reader) {
		int count = accountService.AddAccount(reader);
		if (count > 0) {
			_mvShare.addObject("status", "DANG KY THANH CONG");
			return new ModelAndView("redirect:dang-nhap");
		} else {
			_mvShare.addObject("staus", "DANG KY THAT BAI");
			_mvShare.setViewName("user/register");
			return _mvShare;
		}
		// _mvShare.addObject("status",true)
		
	}

	// Phương thức xử lý GET cho đăng nhập
	@RequestMapping(value = "dang-nhap", method = RequestMethod.GET)
	public ModelAndView showLoginForm() {
		ModelAndView mv = new ModelAndView("user/login");
		mv.addObject("user", new Readers());
		return mv;
	}

	@RequestMapping(value = "dang-nhap", method = RequestMethod.POST)
	public ModelAndView login(HttpSession session, @ModelAttribute("user") Readers user) {
		// Check admin 
		Admin ad = accountService.CheckAdminAcc(user.getPassword(), user.getUsername());
		if (ad != null) {
			session.setAttribute("loginAdmin", ad);
			return new ModelAndView("redirect:trang-chu");
		} else {
			// Check Reader
			user = accountService.CheckAccount(user);
			if (user != null) { // THANH CONG
				session.setAttribute("LoginReader", user);
				return new ModelAndView("redirect:trang-chu");
			} else { // THAT BAI ModelAndView
				ModelAndView modelAndView = new ModelAndView("user/login");
				modelAndView.addObject("statusLG", "ĐĂNG NHẬP THẤT BẠI");
				return modelAndView;
			}
		}
		
	}
	@RequestMapping(value = "DangXuat")
	public ModelAndView logout(HttpSession sesion) {
		sesion.setAttribute("loginAdmin", null);
		sesion.setAttribute("LoginReader", null);
		return new ModelAndView("redirect:trang-chu");
	}

}
