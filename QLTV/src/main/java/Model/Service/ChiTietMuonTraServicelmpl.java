package Model.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChiTietMuonTraDao;
import Model.Dao.ChiTietMuonTraDtoDao;
import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTra;

@Service
public class ChiTietMuonTraServicelmpl {
	@Autowired
	private ChiTietMuonTraDao ctmtsDao;
	
	@Autowired
	private ChiTietMuonTraDtoDao ctmtDtoDao;
	
	public List<ChiTietMuonTra> getDataChiTietMuonTra() {
		return ctmtsDao.GetDataChiTietMuonTra();
	}
	
	public int insertMuonTra(ChiTietMuonTra ctmt) {
		return ctmtsDao.insertMuonTra(ctmt);
	}
	
	public List<ChiTietMuonTraDto> GetDataChiTietMuonTraDto() {
		return ctmtDtoDao.GetDataChiTietMuonTraDto();
	}

	public List<ChiTietMuonTraDto> GetDataSearchChiTietMuonTraDto(String name) {
		return ctmtDtoDao.GetDataSearchChiTietMuonTraDto(name);
	}

	public int muonSachUser(ChiTietMuonTra ct, int i) {
		return ctmtsDao.muonSachUser(ct,i);
	}
	
	public int updateAmount(int id,int amount) {
		return ctmtsDao.updateAmount(id, amount);
	}

}
