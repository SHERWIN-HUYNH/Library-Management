package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Categories;
import Model.Entity.CategoriesMapper;

@Repository
public class CategoryDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	
	public List<Categories> GetDataCategories() {
		List<Categories> list = new ArrayList<Categories>();
		String sql = "SELECT * FROM category";
		list = _jdbcTemplate.query(sql, new CategoriesMapper());
		return list;
	}
	
	public int addCategory(Categories c) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO category(name) VALUES(N'"+c.getName()+"')");
		int a = _jdbcTemplate.update(sql.toString());
		return a;
	}
}
