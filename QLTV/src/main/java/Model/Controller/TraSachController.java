package Model.Controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTra;
import Model.Service.TraSachServiceImpl;

@Controller
public class TraSachController {
	@Autowired
	TraSachServiceImpl traSach = new TraSachServiceImpl();
	
	@RequestMapping(value = "traSach")
	public ModelAndView traSach() {
		ModelAndView mv = new ModelAndView("admin/TraSach");
		mv.addObject("ctmts", traSach.getDataChiTietTra());
		mv.addObject("ctmtDto", traSach.GetDataChiTietTraDto());
		return mv;
	}
	
	@RequestMapping(value = "updateTraSach/{id}", method = RequestMethod.POST)
	public ModelAndView deleteAuthor(@PathVariable int id, ChiTietMuonTra c) {
		ModelAndView mv = new ModelAndView("admin/TraSach");
		int rs = traSach.updateTraSach(id, c); 
		if (rs == 1) {
			mv.addObject("message", "Trả sách thành công");
			mv.addObject("ctmts",traSach.getDataChiTietTra());
			return new ModelAndView("redirect:/traSach"); 
		} else {
			mv.addObject("message", "Lỗi trả sách");
			mv.addObject("ctmts",traSach.getDataChiTietTra());
			return new ModelAndView("redirect:/traSach"); 
		}
	}
	
	@RequestMapping(value ="timKiemPhieuTraSach", method = RequestMethod.POST)
	public ModelAndView searchReader(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("admin/TraSach");
		mv.addObject("ctmts", traSach.getDataChiTietTra());
		List<ChiTietMuonTraDto> searchResults = traSach.GetDataSearchChiTietTraDto(name);
		mv.addObject("ctmtDto", searchResults);
		return mv;
	}

	
}
