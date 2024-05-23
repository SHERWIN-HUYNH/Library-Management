package Model.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

@Repository
public class ForgotPasswordDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public int CheckEmail(String email) {
		String checkEmailReaders = "SELECT COUNT(*) FROM reader WHERE email = ?";
        Integer count1 = _jdbcTemplate.queryForObject(checkEmailReaders, new Object[]{email}, Integer.class);
        String checkEmailAdmin = "SELECT COUNT(*) FROM admin WHERE email = ?";
        Integer count2 = _jdbcTemplate.queryForObject(checkEmailAdmin, new Object[]{email}, Integer.class);
        if(count1 == 0 && count2 == 0) {
        	return 0; // KO tim thay 
        }
		return 1;
	}
}
