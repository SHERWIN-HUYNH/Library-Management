package Model.Dao;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Dto.BooksDto;
import Model.Dto.BooksDtoMapper;
@Repository
public class BooksDtoDao extends BaseDao {
	@Autowired
	public JdbcTemplate _jdbcTemplate;
	public List<BooksDto> GetDataBooksDto() {
		List<BooksDto> list = new ArrayList<BooksDto>();
		String sql = "SELECT  book.name as bookName, book.image as bookImage, book.amount as bookAmount, "
				+ "book.dayCreated as bookDayCreated, book.description as bookDescription,"
				+ "author.name as authorName, author.image as authorImage, author.description as authorDescription"
				+ ", category.name as categoryName FROM book,author, category WHERE book.authorId=author.id "
				+ "and book.categoryId = category.id";
		list = _jdbcTemplate.query(sql, new BooksDtoMapper());
		return list;
	}
}
