package Model.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Entity.Admin;
import Model.Entity.AdminMapper;
import Model.Entity.Readers;
import Model.Entity.ReadersMapper;



@Repository
public class LoginDao extends BaseDao{

	public Readers GetReaderByAccount(String username) {
		  String sql = "SELECT * FROM reader WHERE username = ?"; 
		  List<Readers> reader = _jdbcTemplate.query(sql, new ReadersMapper(), username);
		  if (reader.isEmpty()) {
		        return null;
		    } else {
		        return reader.get(0); // Trả về đọc giả đầu tiên nếu có
		    }
	}
	public Readers GetReaderByEmail(String email) {
		  String sql = "SELECT * FROM reader WHERE email = ?"; 
		  List<Readers> reader = _jdbcTemplate.query(sql, new ReadersMapper(), email);
		  if (reader.isEmpty()) {
		        return null;
		    } else {
		        return reader.get(0); 
		    }
	}
	
	public Admin GetAdminByAccount(String username,String password) {
		String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
		 List<Admin> user = _jdbcTemplate.query(sql, new AdminMapper(), username, password);
		 if (user.isEmpty()) {
		        return null;
		    } else {
		        return user.get(0); 
		    }
	}
}
