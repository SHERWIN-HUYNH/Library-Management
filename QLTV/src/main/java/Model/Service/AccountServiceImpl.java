package Model.Service;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChangePasswordDao;
import Model.Dao.ForgotPasswordDao;
import Model.Dao.LoginDao;
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
		reader = loginDao.GetReaderByAccount(reader);
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
	public int ChangePassword(String password, int id) {
		return changePassword.ChangePassword(BCrypt.hashpw(password,BCrypt.gensalt(12)), id);
	}
	// CEHCK EMAIL EXISTED ? 
	public int Checkemail(String email) {
		return forgotPassword.CheckEmail(email);
	}
	public Readers CheckAccByEmail(String email) {
		Readers reader = loginDao.GetReaderByEmail(email);
		return reader;
	}
}
