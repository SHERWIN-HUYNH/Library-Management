package Model.Dao;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Books;
import Model.Entity.BooksMapper;
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
	public Books timBookTheoId(int id) {
		String sql ="SELECT * FROM book WHERE id = ?";
		Books b = _jdbcTemplate.queryForObject(sql, new Object[]{id}, new BooksMapper());
		return b;
	}
	
	public int updateAmountTra(int id,int amount) {
		String sql = "UPDATE book SET amount = ? WHERE id = ?";
		Books b = timBookTheoId(id);
		int temp = b.getAmount() + amount;
		int ctmt = _jdbcTemplate.update(sql, temp,id);
		return ctmt;
	}
	
	public int updateTraSach(int id) {
		String sql = "UPDATE chitietmuontra SET ngayTra = ?,trangThai = 1 WHERE id = ?";
		LocalDate ngayTra = LocalDate.now();
		int rs = _jdbcTemplate.update(sql,ngayTra,id);
		if (rs == 0) {
			return - 1;
        }
		ChiTietMuonTra c = getCTMTFromId(id);
		rs = updateAmountTra(c.getBookId(), c.getAmount());
		if (rs == 0) {
           return -1 ;
        }
		return rs;

	}
}
