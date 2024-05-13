package Model.Dto;

import java.sql.ResultSet;
import java.sql.SQLException;

import org.springframework.jdbc.core.RowMapper;

public class BooksDtoMapper implements RowMapper<BooksDto> {
	public BooksDto mapRow(ResultSet rs, int rowNum) throws SQLException {
		BooksDto booksDto = new BooksDto();
		booksDto.setBookName(rs.getString("bookName"));
		booksDto.setAuthorName(rs.getString("authorName"));
		booksDto.setCategoryName(rs.getString("categoryName"));
		booksDto.setBookAmount(rs.getInt("bookAmount"));
		booksDto.setBookDayCreated(rs.getString("bookDayCreated"));
		booksDto.setBookImage(rs.getString("bookImage"));
		booksDto.setBookDescription(rs.getString("bookDescription"));
		booksDto.setAuthorImage(rs.getString("authorImage"));
		booksDto.setAuthorDescription(rs.getString("authorDescription"));
		return booksDto;
	}

}
