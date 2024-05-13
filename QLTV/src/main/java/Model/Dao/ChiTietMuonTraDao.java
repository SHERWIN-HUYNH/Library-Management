package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.ChiTietMuonTra;
import Model.Entity.MapperChiTietMuonTra;

@Repository
public class ChiTietMuonTraDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<ChiTietMuonTra> GetDataChiTietMuonTra(){
		List<ChiTietMuonTra> list = new ArrayList<ChiTietMuonTra>();
		String sql = "SELECT * FROM chitietmuontra";
		list = _jdbcTemplate.query(sql, new MapperChiTietMuonTra());
		return list;
	} 
	
	public int insertMuonTra(ChiTietMuonTra ct) {
		StringBuffer sql = new StringBuffer();
		 sql.append ( "INSERT INTO chitietmuontra(bookId,ngayMuon,ngayTra,readerId,amount) VALUES('"+ ct.getBookId()+"','"+ ct.getNgayMuon()+"','"+ ct.getNgayTra()+"','"+ct.getReaderId()+"','"+ct.getAmount()+"')");
		int ctmt = _jdbcTemplate.update(sql.toString());
		return ctmt;
	}
}
