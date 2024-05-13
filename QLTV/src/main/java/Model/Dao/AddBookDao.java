package Model.Dao;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.BooksDto;
import Model.Entity.Authors;
import Model.Entity.AuthorsMapper;
import Model.Entity.Categories;
import Model.Entity.CategoriesMapper;

@Repository
public class AddBookDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public int insertBook(BooksDto books) {
		StringBuffer sql1 = new StringBuffer();
		if(GetCategoryId(books.getCategoryName()) == 0)
			return 2;
		if(GetAuthorId(books.getAuthorName()) == 0)
			return 3;
		sql1.append("INSERT INTO `book`(`name`,`amount`,`dayCreated`,`categoryId`,`image`,`description`,`authorId`) "+"VALUES('"+books.getBookName()+"','"+books.getBookAmount()+"','"+books.getBookDayCreated()+"','"+GetCategoryId(books.getCategoryName())+"','"+ books.getBookImage()+"','"+books.getBookDescription()+"','"+GetAuthorId(books.getAuthorName())+"')");
		int book = _jdbcTemplate.update(sql1.toString());
		return book;
	}

	public Authors GetAuthorByName(Authors author) {
		String sql = "SELECT * FROM author WHERE name = ?";
		List<Authors> authors = _jdbcTemplate.query(sql, new AuthorsMapper(), author.getName());
		if (authors.isEmpty()) {
			return null;
		} else {
			return authors.get(0);
		}
	}

	public int insertAuthor(Authors authors) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO `author`(`name`, `image`, `description`) VALUES(" + authors.getName() + "','"
				+ authors.getImage() + "','" + authors.getDescription() + "')");

		int author = _jdbcTemplate.update(sql.toString());
		return author;
	}

	public int GetCategoryId(String categoryName) {
		String sql = "SELECT * FROM category WHERE name = ?";
		List<Categories> category = _jdbcTemplate.query(sql, new CategoriesMapper(), categoryName);
		if (category.isEmpty()) {
			return  0;
		} else {
			return category.get(0).getId();
		}
	}

	public int GetAuthorId(String authorName) {
		String sql = "SELECT * FROM author WHERE name = ?";
		List<Authors> author = _jdbcTemplate.query(sql, new AuthorsMapper(), authorName);
		if (author.isEmpty()) {
			return 0;
		} else {
			return author.get(0).getId();
		}
	}
}
