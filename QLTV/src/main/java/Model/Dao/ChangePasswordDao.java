package Model.Dao;

import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Readers;
import Model.Entity.ReadersMapper;

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
	public int checkOldPassword(String password, String role,String username) {
	    int rs = 0;
	    String sql;
	    if (role.equals("admin")) {
	        sql = "SELECT COUNT(*) FROM admin WHERE password = ?";
	        int count = _jdbcTemplate.queryForObject(sql, new Object[]{password}, Integer.class);
		    if (count > 0) {
		        rs = 1;
		    }
	    } else {
	    	 sql = "SELECT * FROM reader WHERE username = ?"; 
			 List<Readers> readers = _jdbcTemplate.query(sql, new ReadersMapper(), username);
			 if (!readers.isEmpty()) {
				 Readers reader = readers.get(0);
				 if(BCrypt.checkpw(password, reader.getPassword()))
					{
					 rs = 1;
					} 	
			 }
	    }
	    return rs;
	   
	}
}
