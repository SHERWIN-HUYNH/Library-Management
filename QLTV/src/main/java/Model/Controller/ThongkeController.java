package Model.Controller;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.databind.ObjectMapper;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.ThongKeDto;
import Model.Service.ThongKeServiceImpl;

@Controller
public class ThongkeController extends BaseController{
	@Autowired
	ThongKeServiceImpl thongke = new ThongKeServiceImpl();
	
	@RequestMapping(value="thongke")
	public ModelAndView ThongKe() {
		ModelAndView mv = new ModelAndView("admin/ThongKe");
		mv.addObject("borrowedRate", thongke.MatDo());
		mv.addObject("borrowedBooksAmount", thongke.SoSachDangMuon());
		mv.addObject("bookAmount", thongke.TongSoSach());
		mv.addObject("readersAmount", thongke.SoluongReader());
		 List<ThongKeDto> dataList = thongke.DataPieChart();
		 ObjectMapper mapper = new ObjectMapper();
	        String json;
			try {
				json = mapper.writeValueAsString(dataList);
				mv.addObject("pieChart", json);
			} catch (JsonProcessingException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
	        
		return mv;
	}
}
