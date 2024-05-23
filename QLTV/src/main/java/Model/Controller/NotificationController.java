package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import Model.Entity.Notification;
import Model.Service.NotificationImpl;

@Controller
public class NotificationController extends BaseController {
	@Autowired
	NotificationImpl notificationImp = new NotificationImpl();

	@RequestMapping(value = "ThemThongBao", method = RequestMethod.GET)
	public ModelAndView ThemThongBaoGET() {
		ModelAndView mv = new ModelAndView("admin/ThemThongBao");
		mv.addObject("notification", new Notification());
		return mv;
	}
	@RequestMapping(value = "ThemThongBao", method = RequestMethod.POST)
	public ModelAndView ThemThongBao(@ModelAttribute("notification") Notification notification) {
		int rs = notificationImp.AddNotification(notification);
		ModelAndView mv = new ModelAndView("admin/ThemThongBao");
		if (rs > 0) {
			mv.addObject("message", "THÊM THÔNG BÁO THÀNH CÔNG");
			mv.addObject("notifications", notificationImp.GetAllNotification());
			return mv;
		} else {
			mv.addObject("message", "THÊM THÔNG BÁO THÁT BẠI");
			return mv;
		}

	}

	@RequestMapping(value = "ThongBaoQuanLy", method = RequestMethod.GET)
	public ModelAndView ThongBaoQuanLy() {
		_mvShare.setViewName("admin/ThongBaoQuanLy");
		_mvShare.addObject("notifications", notificationImp.GetAllNotification());
		return _mvShare;
	}

	
	@RequestMapping(value = "/SuaThongBao/{id}", method = RequestMethod.GET)
	public ModelAndView SuaThongBaoGet(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/SuaThongBao");
		mv.addObject("selectedNoti", notificationImp.GetNotiFromId(id));
		mv.addObject("id", id);
		return mv;
	}

	@RequestMapping(value = "/SuaThongBao/{id}", method = RequestMethod.POST)
	public ModelAndView SuaThongBaoPost(@PathVariable int id,
			@ModelAttribute("selectedNoti") Notification notification) {
		ModelAndView mv = new ModelAndView("admin/SuaThongBao");
		mv.addObject("notifications", notificationImp.GetAllNotification());
		int rs = notificationImp.UpdateNotification(id, notification);
		if (rs > 0) {
			mv.addObject("message", "SỬA THÔNG BÁO THÀNH CÔNG");

		} else
			mv.addObject("message", "SỬA THÔNG BÁO THẤT BẠI");

		return mv;
	}

	@RequestMapping(value = "/XoaThongBao/{id}", method = RequestMethod.POST)
	public ModelAndView XoaThongBao(@PathVariable int id) {
		ModelAndView mv = new ModelAndView("admin/ThongBaoQuanLy");
		
		int rs = notificationImp.DeleteNotification(id);
		mv.addObject("notifications", notificationImp.GetAllNotification());
		if (rs > 0) {
			mv.addObject("message", "Xoá thành công");
			
		} else
			mv.addObject("message", "Xoá thất bại");
		
		return mv;
	}
}
