package Model.Controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ThongkeController extends BaseController{
	@RequestMapping(value="thongke")
	public ModelAndView ThongKe() {
		return new ModelAndView("admin/ThongKe");
	}
}
