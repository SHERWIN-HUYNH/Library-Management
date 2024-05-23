package Model.Service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ThongKeDao;

@Service
public class ThongKeServiceImpl {
	@Autowired
	private ThongKeDao thongke = new ThongKeDao();
	
	public float MatDo() {
		return thongke.MatDoMuonSach();
	}
	
	public int SoluongReader() {
		return thongke.SoLuongReader();
	}
	
	public int SoSachDangMuon() {
		return thongke.SoSachDangDuocMuon();
	}
	
	public int SoSachConLai() {
		return thongke.SoLuongSachConlai();
	}
	
	public int TongSoSach() {
		return thongke.TongsoSach();
	}
	
}
