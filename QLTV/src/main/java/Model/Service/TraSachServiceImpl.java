package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChiTietMuonTraDtoDao;
import Model.Dao.TraSachDao;
import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTra;

@Service
public class TraSachServiceImpl {
	@Autowired
	private TraSachDao ctmtsDao;
	
	@Autowired
	private ChiTietMuonTraDtoDao ctmtDtoDao;
	public List<ChiTietMuonTra> getDataChiTietTra() {
		return ctmtsDao.GetDataChiTietTra();
	}
	
	public ChiTietMuonTra getCTMTFromId(int id) {
		return ctmtsDao.getCTMTFromId(id);
	}
	
	public int updateTraSach(int id ,ChiTietMuonTra c) {
		return ctmtsDao.updateTraSach(id, c);
	}
	
	public List<ChiTietMuonTraDto> GetDataChiTietTraDto(){
		return ctmtDtoDao.GetDataChiTietTraDto();
	}
	
	public List<ChiTietMuonTraDto> GetDataSearchChiTietTraDto(String name){
		return ctmtDtoDao.GetDataSearchChiTietTraDto(name);
	}
}
