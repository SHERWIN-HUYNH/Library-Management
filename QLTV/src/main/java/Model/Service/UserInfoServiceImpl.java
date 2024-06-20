package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.UserInfoDao;
import Model.Dto.ChiTietMuonTraDto;
import Model.Entity.Admin;
import Model.Entity.Books;
import Model.Entity.Users;

@Service
public class UserInfoServiceImpl {
	@Autowired
	private UserInfoDao userInfoDao;

	
	public int updateUserInfo(int id, Users reader) {
		return userInfoDao.updateInfoUser(id, reader);
	}

	public int updateAdminInfo(int id, Users admin) {
		return userInfoDao.updateInfoAdmin(id, admin);
	}
	
	public List<ChiTietMuonTraDto>  GetBookBorrowedByReaderId(int readerId) {
		return userInfoDao.getBookBorrowedByReaderId(readerId);
	}
	
	public List<ChiTietMuonTraDto> SearchBorrowedBooks(int readerId, String searchKeyword) {
		return userInfoDao.searchBorrowedBooks(readerId, searchKeyword);
	}
}
