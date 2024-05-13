package Model.Service;


import org.mindrot.jbcrypt.BCrypt;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

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
	
	// REGISTER
	public int AddAccount(Readers reader) {
		reader.setPassword(BCrypt.hashpw(reader.getPassword(),BCrypt.gensalt(12)));
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
}
