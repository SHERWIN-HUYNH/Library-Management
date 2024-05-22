package Model.Dao;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Readers;

@Repository
public class RegisterDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public int AddAccount(Readers reader) {
		String checkUsername = "SELECT COUNT(*) FROM reader WHERE username = ?";
		Integer count = _jdbcTemplate.queryForObject(checkUsername, new Object[] { reader.getUsername() },
				Integer.class);
		String checkEmailReader = "SELECT COUNT(*) FROM reader WHERE email = ?";
		Integer count1 = _jdbcTemplate.queryForObject(checkEmailReader, new Object[] { reader.getEmail() },
				Integer.class);
		if (count > 0) {
			return 2; // Username đã được đăng ký
		} else if (count1 > 0)
			return 3; // Email đã được đăng ký
		else {
			String sql = "INSERT INTO reader (name, username, password, email) VALUES (?, ?, ?, ?)";
			int insert = _jdbcTemplate.update(sql, reader.getName(), reader.getUsername(), reader.getPassword(),
					reader.getEmail());
			return insert;
		}
	}

}
