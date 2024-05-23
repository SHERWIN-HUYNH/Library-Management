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
	
	public List<ChiTietMuonTraDto> GetDataSearchChiTietMuonTraDto(String name) {
		List<ChiTietMuonTraDto> list = new ArrayList<ChiTietMuonTraDto>();
		String sql = "SELECT \r\n" + 
				"    cmt.id AS ctmtId, \r\n" + 
				"    cmt.bookId, \r\n" + 
				"    cmt.ngayMuon AS ctmtNgayMuon,\r\n" + 
				"    cmt.trangThai AS ctmtTrangThai,\r\n" + 
				"    cmt.ngayTra AS ctmtNgayTra,\r\n" + 
				"    cmt.amount AS ctmtAmount,\r\n" + 
				"    b.name AS bookName,\r\n" + 
				"    b.amount AS bookAmount,\r\n" + 
				"    r.id AS readerId,\r\n" + 
				"    r.name AS readerName\r\n" + 
				"FROM \r\n" + 
				"    chitietmuontra cmt\r\n" + 
				"JOIN \r\n" + 
				"    book b ON cmt.bookId = b.id\r\n" + 
				"JOIN \r\n" + 
				"    reader r ON cmt.readerId = r.id\r\n" + 
				"WHERE \r\n" + 
				"    cmt.trangThai = 0 \r\n" + 
				"    AND r.name LIKE ?";
		list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(),"%"+ name +"%");
		return list;
	}
}
