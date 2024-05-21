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
	
	 public List<BooksDto> getDataSearchBookDto(String nameBook) {
	        List<BooksDto> list = new ArrayList<BooksDto>();
	        String sql = "WITH BookAuthorCategory AS ("
	                   + "    SELECT "
	                   + "        book.name AS bookName, "
	                   + "        book.image AS bookImage, "
	                   + "        book.amount AS bookAmount, "
	                   + "        book.dayCreated AS bookDayCreated, "
	                   + "        book.description AS bookDescription, "
	                   + "        author.name AS authorName, "
	                   + "        author.image AS authorImage, "
	                   + "        author.description AS authorDescription, "
	                   + "        category.name AS categoryName "
	                   + "    FROM "
	                   + "        book "
	                   + "    JOIN "
	                   + "        author ON book.authorId = author.id "
	                   + "    JOIN "
	                   + "        category ON book.categoryId = category.id"
	                   + ") "
	                   + "SELECT * FROM BookAuthorCategory "
	                   + "WHERE bookName LIKE ? OR authorName LIKE ?";
	        
	        try {
	            list = _jdbcTemplate.query(sql, new BooksDtoMapper(), "%" + nameBook + "%", "%" + nameBook + "%");
	        } catch (Exception e) {
	            // Log the exception and handle it accordingly
	            e.printStackTrace();
	        }
	        
	        return list;
	    }

}
