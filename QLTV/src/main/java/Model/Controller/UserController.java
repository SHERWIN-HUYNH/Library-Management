package Model.Controller;


import javax.servlet.http.HttpServletRequest;
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
		ModelAndView mv = new ModelAndView("user/register");
		int count = accountService.AddAccount(reader);
		if (count == 1) {
			mv.addObject("message", "ĐĂNG KÝ THÀNH CÔNG");
			return new ModelAndView("redirect:dang-nhap");
		} else if (count == 2) {
			mv.setViewName("user/register");
			mv.addObject("message", "USERNAME NÀY ĐÃ ĐƯỢC ĐĂNG KÝ");
			return mv;
		} else if (count == 3) {
			mv.setViewName("user/register");
			mv.addObject("message", "EMAIL NÀY ĐÃ ĐƯỢC ĐĂNG KÝ");
			return mv;
		}
		else  {
			mv.setViewName("user/register");
			mv.addObject("message", "ĐĂNG KÝ THẤT BẠI");
			return mv;
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
	// DANG XUAT
	@RequestMapping(value = "DangXuat")
	public ModelAndView logout(HttpSession sesion) {
		sesion.setAttribute("loginAdmin", null);
		sesion.setAttribute("LoginReader", null);
		return new ModelAndView("redirect:trang-chu");
	}
	
	// THAY DOI MAT KHAU 
	
	@RequestMapping(value = "UserChangePassword", method = RequestMethod.GET)
	public ModelAndView UserChangePasswordGET() {
		return new ModelAndView("user/UserChangePassword");
	}
	@RequestMapping(value = "UserChangePassword", method = RequestMethod.POST)
	
	public ModelAndView UserChangePasswordPOST(HttpServletRequest request, HttpSession session) {
		ModelAndView mv =  new ModelAndView("user/login");
        String newPassword = request.getParameter("new_password");
        String confirmPassword = request.getParameter("confirm_password");
        String oldPassword = request.getParameter("old_password");
        Readers loginReader = (Readers) session.getAttribute("LoginReader");
        Admin loginAdmin = (Admin) session.getAttribute("loginAdmin");
       
        if(oldPassword.equals(newPassword)) {
        	mv.addObject("message", "MẬT KHẨU MỚI BỊ TRÙNG MẬT KHẨU CŨ");
        	return mv;
        }
        if(newPassword.equals(confirmPassword) == false) {
        	mv.addObject("message", "MẬT KHẨU KHÔNG TRÙNG KHỚP");
        	return mv;
       } else {
    	   if(loginAdmin != null) {
          	 accountService.ChangePassword(newPassword,loginAdmin.getId());
           }
           if(loginReader != null) {
        	   accountService.ChangePassword(newPassword,loginReader.getId());
           }
       }
        mv.addObject("message", "ĐỔI MẬT KHẨU THÀNH CÔNG");
        
        return mv;
	}
	
	
	
}
