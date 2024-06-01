package Model.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChiTietMuonTraDao;
import Model.Entity.ChiTietMuonTra;

@Service
public class ChiTietMuonTraServicelmpl {
	@Autowired
	private ChiTietMuonTraDao ctmtsDao;
	
	public List<ChiTietMuonTra> getDataChiTietMuonTra() {
		return ctmtsDao.GetDataChiTietMuonTra();
	}
	
	public int insertMuonTra(ChiTietMuonTra ctmt) {
		return ctmtsDao.insertMuonTra(ctmt);
	}
	

}
