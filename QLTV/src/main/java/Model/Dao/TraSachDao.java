package Model.Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.ChiTietMuonTra;
import Model.Entity.MapperChiTietMuonTra;

@Repository
public class TraSachDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<ChiTietMuonTra> GetDataChiTietTra(){
		List<ChiTietMuonTra> list = new ArrayList<ChiTietMuonTra>();
		String sql = "SELECT * FROM chitietmuontra WHERE trangThai = 0";
		list = _jdbcTemplate.query(sql, new MapperChiTietMuonTra());
		return list;
	} 
	
	public ChiTietMuonTra getCTMTFromId(int id) {
		String sql = "SELECT * FROM chitietmuontra WHERE id = ?";
		ChiTietMuonTra c = _jdbcTemplate.queryForObject(sql, new MapperChiTietMuonTra(), id);
		return c;
	}
	
	public int updateTraSach(int id ,ChiTietMuonTra c) {
		int rs = 0;
		String sql = "UPDATE chitietmuontra SET ngayTra = ?,trangThai = 1 WHERE id = ?";
		LocalDate ngayTra = LocalDate.now();
		rs = _jdbcTemplate.update(sql,ngayTra,id);
		return rs;
	}
}
