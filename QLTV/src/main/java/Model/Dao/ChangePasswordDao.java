package Model.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ChangePasswordDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public int ChangePassword(String newpassword, int id,String role) {
		int rs = 0;
		String sql;
		if(role.equals("admin"))
			sql = "UPDATE admin SET password = ? WHERE id = ?";
		else
			sql = "UPDATE reader SET password = ? WHERE id = ?";
		rs = _jdbcTemplate.update(sql, newpassword, id);
		return rs;
	}
	public int checkOldPassword(String password, String role) {
	    int rs = 0;
	    String sql;
	    if (role.equals("admin")) {
	        sql = "SELECT COUNT(*) FROM admin WHERE password = ?";
	    } else {
	        sql = "SELECT COUNT(*) FROM reader WHERE password = ?";
	    }
	    int count = _jdbcTemplate.queryForObject(sql, new Object[]{password}, Integer.class);
	    if (count > 0) {
	        rs = 1;
	    }
	    return rs;
	}
}
