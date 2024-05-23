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
		sql.append("INSERT INTO `author`(`name`, `image`, `description`)" + "VALUES('" + authors.getName() + "','"
				+ authors.getImage() + "','" + authors.getDescription() + "')");
		int author = _jdbcTemplate.update(sql.toString());
		return author;
	}

	public Authors GetAuFromId(int id) {
		String sql = "SELECT * FROM author WHERE id = ?";
		Authors author = _jdbcTemplate.queryForObject(sql, new AuthorsMapper(), id);
		return author;
	}

	public int UpdateAuthor(int id, Authors authors) {
		String sql = "UPDATE author SET name = ?, image = ?,description = ? WHERE id = ?";
		int rs = 0;
		rs = _jdbcTemplate.update(sql, authors.getName(), authors.getImage(), authors.getDescription(), id);
		return rs;
	}

	public int DeleteAuthor(int id) {
		int rs = 0;
	    String sql = "DELETE FROM author WHERE id = ?";
	    rs = _jdbcTemplate.update(sql, id);
	    return rs;
	}
	
	public List<Authors> searchAuthor(String name) {
	    String sql = "SELECT * FROM author WHERE name LIKE ?";
	    String searchPattern = "%" + name + "%";
	    List<Authors> authors = _jdbcTemplate.query(sql, new Object[]{searchPattern}, new AuthorsMapper());
	    return authors;
	}

}
