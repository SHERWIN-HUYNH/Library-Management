package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.AddBookDao;
import Model.Dao.AuthorDao;
import Model.Dao.BooksDtoDao;
import Model.Dao.CategoryDao;
import Model.Dao.HomeDao;
import Model.Dto.BooksDto;
import Model.Entity.Authors;
import Model.Entity.Books;
import Model.Entity.Categories;

@Service
public class BookServiceImpl {
	@Autowired
	private AddBookDao addbookDao;
	
	@Autowired
	private HomeDao booksDao;
	
	@Autowired
	private AuthorDao authorDao;
	
	@Autowired
	private CategoryDao categoryDao;
	
	@Autowired
	private BooksDtoDao bookDtoDao;
	
	public List<Books> GetDataBooks() {
		return booksDao.GetDataBooks();
	}
	
	public List<Authors> getDataAuthor() {
		return authorDao.GetDataAuthor();
	}
	
	public List<Categories> getDataCategories() {
		return categoryDao.GetDataCategories();
	}
	
	public int insertBook(BooksDto books) {
		return addbookDao.insertBook(books);
	}
	
	public Authors GetAuthorByBook(Authors author) {
		return addbookDao.GetAuthorByName(author);
	}
	
	public int insertAuthor(Authors authors) {
		return addbookDao.insertAuthor(authors);
	}
	
	public List<BooksDto> GetDataSearchBookDto(String book) {
		return bookDtoDao.getDataSearchBookDto(book);
	}
	
}
