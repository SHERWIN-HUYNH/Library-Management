
package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Readers;
import Model.Entity.ReadersMapper;

@Repository
public class ReaderDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Readers> GetDataReader() {
		List<Readers> list = new ArrayList<Readers>();
		String sql = "SELECT * FROM reader";
		list = _jdbcTemplate.query(sql, new ReadersMapper());
		return list;
	}
	
	public List<Readers> GetDataSearchReader(String name) {
		List<Readers> list = new ArrayList<Readers>();
		String sql = "SELECT * FROM reader WHERE name LIKE ?";
		list = _jdbcTemplate.query(sql, new ReadersMapper(),"%" + name + "%");
		return list;
	}
}
