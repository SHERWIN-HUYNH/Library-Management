package Model.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ForgotPasswordDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public int CheckEmail(String email) {

		String checkEmail = "SELECT COUNT(*) FROM reader WHERE email = ?";
        Integer count = _jdbcTemplate.queryForObject(checkEmail, new Object[]{email}, Integer.class);
        if(count != null && count == 0) {
        	return 0; // KO tim thay 
        }
		return 1;
	}
}
