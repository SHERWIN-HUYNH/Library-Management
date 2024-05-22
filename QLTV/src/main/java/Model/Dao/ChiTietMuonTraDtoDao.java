package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.ChiTietMuonTraDtoMapper;


@Repository
public class ChiTietMuonTraDtoDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<ChiTietMuonTraDto> GetDataChiTietMuonTraDto() {
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT chitietmuontra.id as ctmtId, chitietmuontra.bookId, chitietmuontra.ngayMuon as ctmtNgayMuon,"
				+ "chitietmuontra.trangThai as ctmtTrangThai,chitietmuontra.ngayTra as ctmtNgayTra,chitietmuontra.amount as ctmtAmount,"
				+ "book.name as bookName,book.amount as bookAmount,reader.id as readerId,reader.name as readerName"
				+ " FROM chitietmuontra, book, reader"
				+ " WHERE chitietmuontra.bookId = book.id and chitietmuontra.readerId  = reader.id and trangThai = 0";
		list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper());
		return list;
	}
}
