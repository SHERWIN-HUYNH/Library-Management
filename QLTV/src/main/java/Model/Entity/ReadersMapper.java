package Model.Entity;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class ReadersMapper implements RowMapper<Readers>{
	
	public Readers mapRow(ResultSet rs, int rowNum) throws SQLException {
		Readers readers = new Readers();
		readers.setId(rs.getInt("id"));
		readers.setName(rs.getString("name"));
		readers.setUsername(rs.getString("username"));
		readers.setPassword(rs.getString("password"));
		readers.setEmail(rs.getString("email"));
		return readers;
	}
}
