package Model.Dao;

import java.text.DecimalFormat;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ThongKeDao extends BaseDao{
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public float MatDoMuonSach() {
		DecimalFormat df = new DecimalFormat("0.00");
		int count = TongsoSach();
		int count1 =SoSachDangDuocMuon();
		float rs =(float) count1 / count;
		return Float.parseFloat(df.format(rs));
	}
	
	public int SoLuongReader() {
		String sql = "SELECT COUNT(id) FROM reader";
		Integer count = _jdbcTemplate.queryForObject(sql, Integer.class);
		 return count != null ? count : 0;
	}
	
	public int SoLuongSachConlai() {
		int count = TongsoSach() - SoSachDangDuocMuon();
		return count ;
	}
	
	public int TongsoSach () {
		String sql = "SELECT COUNT(id) FROM book";
		Integer count = _jdbcTemplate.queryForObject(sql, Integer.class);
		 return count != null ? count : 0;
	}
	public int SoSachDangDuocMuon() {
		String sql1 = "SELECT COUNT(id) FROM chitietmuontra WHERE trangThai = 0";
		Integer count1 = _jdbcTemplate.queryForObject(sql1, Integer.class);
		return count1 != null ? count1 : 0;
	}
	
}
