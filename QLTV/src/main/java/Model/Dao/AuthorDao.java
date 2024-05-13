package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Authors;
import Model.Entity.AuthorsMapper;


@Repository
public class AuthorDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<Authors> GetDataAuthor() {
		List<Authors> list = new ArrayList<Authors>();
		String sql = "SELECT * FROM author";
		list = _jdbcTemplate.query(sql, new AuthorsMapper());
		return list;
	}
	public int InsertAuthor(Authors authors) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `author`(`name`, `image`, `description`)" +"VALUES('"+authors.getName()+"','"+authors.getImage()+"','"+authors.getDescription()+"')");
		int author = _jdbcTemplate.update(sql.toString());
		return author;
	}
}
