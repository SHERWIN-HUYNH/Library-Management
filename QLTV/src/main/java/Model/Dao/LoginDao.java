package Model.Dao;

import java.util.List;

import org.springframework.stereotype.Repository;

import Model.Entity.Admin;
import Model.Entity.AdminMapper;
import Model.Entity.Readers;
import Model.Entity.ReadersMapper;



@Repository
public class LoginDao extends BaseDao{

	public Readers GetReaderByAccount(Readers user) {
		  String sql = "SELECT * FROM reader WHERE username = ?"; 
		  List<Readers> reader = _jdbcTemplate.query(sql, new ReadersMapper(), user.getUsername());
		  if (reader.isEmpty()) {
		        return null;
		    } else {
		        return reader.get(0); // Trả về đọc giả đầu tiên nếu có
		    }
	}
	
	public Admin GetAdminByAccount(String username,String password) {
		String sql = "SELECT * FROM admin WHERE username = ? AND password = ?";
		 List<Admin> user = _jdbcTemplate.query(sql, new AdminMapper(), username, password);
		 if (user.isEmpty()) {
		        return null;
		    } else {
		        return user.get(0); // Trả về người dùng đầu tiên nếu có
		    }
	}
}
