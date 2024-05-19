package Model.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChangePasswordDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public int ChangePassword(String newpassword, int id) {
		int rs = 0;
		String sql = "UPDATE reader SET password = ? WHERE id = ?";
		rs = _jdbcTemplate.update(sql, newpassword, id);
		return rs;
	}
}
