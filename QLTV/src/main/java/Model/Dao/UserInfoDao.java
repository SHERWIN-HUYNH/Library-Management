package Model.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Admin;
import Model.Entity.ChiTietMuonTraDtoMapper;
import Model.Entity.Users;

@Repository
public class UserInfoDao {
	@Autowired
	private JdbcTemplate _jdbcTemplate;

	public int updateInfoUser(int id, Users reader) {
		String sql = "UPDATE user SET name = ?, username = ?, email = ? WHERE id = ?";
		return _jdbcTemplate.update(sql, reader.getName(), reader.getUsername(), reader.getEmail(), id);
	}

	public int updateInfoAdmin(int id, Users admin) {
		String sql = "UPDATE user SET name = ?, username = ?, email = ? WHERE id = ?";
		return _jdbcTemplate.update(sql, admin.getName(), admin.getUsername(), admin.getEmail(), id);
	}

	public List<ChiTietMuonTraDto> getBookBorrowedByReaderId(int readerId) {
		String sql = "SELECT " + "ctm.id AS ctmtId, " 
				+ "ctm.bookId, " 
				+ "ctm.ngayMuon AS ctmtNgayMuon, "
				+ "ctm.trangThai AS ctmtTrangThai, " 
				+ "ctm.ngayTra AS ctmtNgayTra, " 
				+ "ctm.amount AS ctmtAmount, "
				+ "b.name AS bookName, " 
				+ "b.amount AS bookAmount, " 
				+ "r.id AS readerId, " 
				+ "r.name AS readerName "
				+ "FROM chitietmuontra ctm " 
				+ "JOIN book b ON ctm.bookId = b.id "
				+ "JOIN (SELECT id,name FROM user WHERE isAdmin = 0) r ON ctm.readerId = r.id " 
				+ "WHERE ctm.readerId = ? AND ctm.trangThai = 0";
		System.out.println("Executing SQL: " + sql + " with readerId: " + readerId); // Dòng kiểm tra
		List<ChiTietMuonTraDto> list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(), readerId);
		System.out.println("Fetched ctmtDtos: " + list); // Dòng kiểm tra
		return list;
	}
	
	public List<ChiTietMuonTraDto> searchBorrowedBooks(int readerId, String searchKeyword) {
	    String sql = "SELECT "
	            + "ctm.id AS ctmtId, "
	            + "ctm.bookId, "
	            + "ctm.ngayMuon AS ctmtNgayMuon, "
	            + "ctm.trangThai AS ctmtTrangThai, "
	            + "ctm.ngayTra AS ctmtNgayTra, "
	            + "ctm.amount AS ctmtAmount, "
	            + "b.name AS bookName, "
	            + "b.amount AS bookAmount, "
	            + "a.name, "
	            + "r.id AS readerId, "
	            + "r.name AS readerName "
	            + "FROM chitietmuontra ctm "
	            + "JOIN book b ON ctm.bookId = b.id "
	            + "JOIN author a ON b.authorId = a.id "
	            + "JOIN (SELECT id,name FROM user WHERE isAdmin = 0) r ON ctm.readerId = r.id "
	            + "WHERE ctm.readerId = ? "
	            + "AND ctm.trangThai = 0 "
	            + "AND (b.name LIKE ? OR a.name LIKE ?)"; // Thêm điều kiện tìm kiếm cho tên sách hoặc tác giả

	    String keyword = "%" + searchKeyword + "%"; // Thêm dấu % cho phần từ khóa tìm kiếm

	    System.out.println("Executing SQL: " + sql + " with readerId: " + readerId + " and search keyword: " + searchKeyword); // Dòng kiểm tra
	    List<ChiTietMuonTraDto> list = _jdbcTemplate.query(sql, new ChiTietMuonTraDtoMapper(), readerId, keyword, keyword);
	    System.out.println("Fetched ctmtDtos: " + list); // Dòng kiểm tra
	    return list;
	}

}
