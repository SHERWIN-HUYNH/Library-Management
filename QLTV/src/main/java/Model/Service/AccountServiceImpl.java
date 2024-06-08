package Model.Service;


import java.util.List;

import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChangePasswordDao;
import Model.Dao.ForgotPasswordDao;
import Model.Dao.LoginDao;
import Model.Dao.ReaderDao;
import Model.Dao.RegisterDao;
import Model.Entity.Admin;
import Model.Entity.Readers;


@Service
public class AccountServiceImpl implements IAccountService{
	@Autowired
	LoginDao loginDao = new LoginDao();
	
	@Autowired
	RegisterDao registerDao = new RegisterDao();
	
	@Autowired
	ChangePasswordDao changePassword = new ChangePasswordDao();
	
	@Autowired
	ForgotPasswordDao forgotPassword = new ForgotPasswordDao();
	// REGISTER

	@Autowired
	private ReaderDao readerDao  ;
	
	public int AddAccount(Readers reader) {
		reader.setPassword(BCrypt.hashpw(reader.getPassword(),BCrypt.gensalt(12)));
		if(forgotPassword.CheckEmail(reader.getEmail()) == 1) {
			return 3;
		}
		return registerDao.AddAccount(reader);
	}
	
	// LOGIN
	public Readers CheckAccount(Readers reader) {
		String password = reader.getPassword();
		reader = loginDao.GetReaderByAccount(reader.getUsername());
		if(reader != null)
		{
			if(BCrypt.checkpw(password, reader.getPassword()))
			{
				return reader;
			} else
				return null;
		}
	return null;
	}
	
	public Admin CheckAdminAcc(String password,String username) {
		Admin admin = loginDao.GetAdminByAccount(username,password);
		if(admin != null ) {
			return admin;
		}
		return null;
	}
	
	// CHANGE PASSWORD
	public int ChangePassword(String password, int id,String role) {
		if(role.equals("reader"))
			return changePassword.ChangePassword(BCrypt.hashpw(password,BCrypt.gensalt(12)), id,role);
		else 
			return changePassword.ChangePassword(password, id,role);
	}
	public int checkOldPassword(String password, String role,String username) {
		return changePassword.checkOldPassword(password, role, username);
	}
	
	// CEHCK EMAIL EXISTED ? 
	public int Checkemail(String email) {
		return forgotPassword.CheckEmail(email);
	}
	public Readers CheckAccByEmail(String email) {
		Readers reader = loginDao.GetReaderByEmail(email);
		return reader;
	}
	
	public List<Readers> GetDataReader(){
		return readerDao.GetDataReader();
	}
	
	public List<Readers> GetDataSearchReader(String name){
		return readerDao.GetDataSearchReader(name);
	}
	
}
