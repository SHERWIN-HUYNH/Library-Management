
package Model.Dao;

import java.text.DecimalFormat;
import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.ColumnChartMapper;

import Model.Dto.ThongKeDto;
import Model.Dto.ThongKeDtoMapper;

@Repository
public class ThongKeDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public float MatDoMuonSach() {
		DecimalFormat df = new DecimalFormat("0.00");
		int count = TongsoSach();
		int count1 = SoSachDangDuocMuon();
		float rs = (float) count1 / count;
		return Float.parseFloat(df.format(rs));
	}

	public int SoLuongReader() {
		String sql = "SELECT COUNT(id) FROM reader";
		Integer count = _jdbcTemplate.queryForObject(sql, Integer.class);
		return count != null ? count : 0;
	}

	public int SoLuongSachConlai() {
		int count = TongsoSach() - SoSachDangDuocMuon();
		return count;
	}

	public int TongsoSach() {
		String sql = "SELECT COUNT(id) FROM book";
		Integer count = _jdbcTemplate.queryForObject(sql, Integer.class);
		return count != null ? count : 0;
	}

	public int SoSachDangDuocMuon() {
		String sql1 = "SELECT COUNT(id) FROM chitietmuontra WHERE trangThai = 0";
		Integer count1 = _jdbcTemplate.queryForObject(sql1, Integer.class);
		return count1 != null ? count1 : 0;
	}


	public List<ThongKeDto> GetDataPieChart(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT c.name as categoryName, COUNT(DISTINCT b.id) AS amount FROM category c LEFT JOIN book b ON b.categoryId = c.id GROUP BY c.id, c.name;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	public List<ThongKeDto> TheLoaiMax() {
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT  category.name as categoryName, COUNT(book.id) AS amount FROM category LEFT JOIN book ON category.id = book.categoryId GROUP BY category.id, category.name ORDER BY amount DESC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	
	public List<ThongKeDto> TheLoaiMin() {
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT category.name as categoryName, COUNT(book.id) AS amount FROM category LEFT JOIN book ON category.id = book.categoryId GROUP BY category.id, category.name ORDER BY amount ASC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}
	
	// COLUMN CHART 
	public List<ThongKeDto> ColumnChart(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT YEAR(ngayMuon) AS year,MONTH(ngayMuon) AS month,IFNULL(SUM(amount), 0) AS soluongMuon FROM chitietmuontra WHERE YEAR(ngayMuon) = 2024  GROUP BY YEAR(ngayMuon), MONTH(ngayMuon)ORDER BY Year, Month;";
		list = _jdbcTemplate.query(sql, new ColumnChartMapper());
		return list;
	}
	
	public List<ThongKeDto> mostFavoriteCategory(){
		List<ThongKeDto> list = new ArrayList<ThongKeDto>();
		String sql = "SELECT  c.name AS categoryName, COUNT(*) AS amount FROM category c JOIN book b ON c.id =b.categoryId JOIN chitietmuontra cm ON b.id = cm.bookId GROUP BY c.id, c.name ORDER BY amount DESC LIMIT 1;";
		list = _jdbcTemplate.query(sql, new ThongKeDtoMapper());
		return list;
	}


}
