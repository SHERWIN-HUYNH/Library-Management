package Model.Dto;
import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ThongKeDtoMapper  implements RowMapper<ThongKeDto> {
	public ThongKeDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		ThongKeDto thongke = new ThongKeDto();
		thongke.setCategoryName(rs.getString("categoryName"));
<<<<<<< HEAD
		thongke.setAmount(rs.getInt("amount"));		   
=======
		thongke.setAmount(rs.getInt("amount"));
>>>>>>> c459af3c72fde7cd415bb0b9e1609d004b241ab1
		return thongke;
	}
}


	
