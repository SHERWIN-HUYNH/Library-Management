package Model.Controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Model.Service.ThongKeServiceImpl;

@Controller
public class ThongkeController extends BaseController{
	@Autowired
	private ThongKeServiceImpl thongke = new ThongKeServiceImpl();
	@RequestMapping(value="thongke")
	public ModelAndView ThongKe() {
		ModelAndView mv = new ModelAndView("admin/ThongKe");
		mv.addObject("borrowedRate", thongke.MatDo());
		mv.addObject("borrowedBooksAmount", thongke.SoSachDangMuon());
		mv.addObject("bookAmount", thongke.TongSoSach());
		mv.addObject("readersAmount", thongke.SoluongReader());
		return mv;
	}
}
