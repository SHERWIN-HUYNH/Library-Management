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
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO reader(name,username,password,email) VALUES( '"+reader.getName()+"', '"+reader.getUsername()+"', '"+reader.getPassword()+"' ,'"+reader.getEmail()+"')");
		int insert = _jdbcTemplate.update(sql.toString());
		return insert;
	}
	

}
