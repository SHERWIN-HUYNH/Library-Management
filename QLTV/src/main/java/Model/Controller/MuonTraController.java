package Model.Controller;

import java.text.ParseException;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTra;
import Model.Service.ChiTietMuonTraServicelmpl;

@Controller
public class MuonTraController extends BaseController {
	@Autowired
	ChiTietMuonTraServicelmpl chitietmuontra = new ChiTietMuonTraServicelmpl();

	@RequestMapping(value = "muontra", method = RequestMethod.GET)
	public ModelAndView muonTra() {
		ModelAndView mv = new ModelAndView("admin/MuonTraCT");
		mv.addObject("ctmts", _HomeService.getDataChiTietMuonTra());
		mv.addObject("readers", _HomeService.GetDataReader());
		mv.addObject("books", _HomeService.GetDataBooks());
		mv.addObject("insert", new ChiTietMuonTra());
		return mv;
	}

	@RequestMapping(value = "muontra", method = RequestMethod.POST)
	public ModelAndView muonTraCT(@ModelAttribute("insert") ChiTietMuonTra ct) throws ParseException {
		ModelAndView mv = new ModelAndView("admin/MuonTraCT");
		mv.addObject("ctmts", _HomeService.getDataChiTietMuonTra());
		mv.addObject("readers", _HomeService.GetDataReader());
		mv.addObject("books", _HomeService.GetDataBooks());
		int rs = chitietmuontra.insertMuonTra(ct);
		if (rs > 0) {
			mv.addObject("message", "Thêm thành công !");
			mv.addObject("ctmts", _HomeService.getDataChiTietMuonTra());
		} else {
			mv.addObject("message", "Thêm thất bại !");
		}
		return mv;
	}
	
	@RequestMapping(value = "/dsMuonTra")
	public ModelAndView dsMuonTra() {
		ModelAndView mv = new ModelAndView("admin/DanhSachMuonTra");
		mv.addObject("ctmts", _HomeService.getDataChiTietMuonTra());
		mv.addObject("ctmtDto", chitietmuontra.GetDataChiTietMuonTraDto());
		return mv;
	}
	
	@RequestMapping(value ="timKiemPhieuMuonTra", method = RequestMethod.POST)
	public ModelAndView searchReader(@RequestParam("name") String name) {
		ModelAndView mv = new ModelAndView("admin/DanhSachMuonTra");
		mv.addObject("ctmts", chitietmuontra.getDataChiTietMuonTra());
		List<ChiTietMuonTraDto> searchResults = chitietmuontra.GetDataSearchChiTietMuonTraDto(name);
		mv.addObject("ctmtDto", searchResults);
		return mv;
	}
}
