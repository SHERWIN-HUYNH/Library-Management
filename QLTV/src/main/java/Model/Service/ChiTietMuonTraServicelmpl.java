package Model.Service;

import java.text.ParseException;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.ChiTietMuonTraDao;
import Model.Entity.ChiTietMuonTra;

@Service
public class ChiTietMuonTraServicelmpl {
	@Autowired
	private ChiTietMuonTraDao ctmtsDao;
	
	public List<ChiTietMuonTra> getDataChiTietMuonTra() {
		return ctmtsDao.GetDataChiTietMuonTra();
	}
	
	public int insertMuonTra(ChiTietMuonTra ctmt) {
		return ctmtsDao.insertMuonTra(ctmt);
	}
	  public Date formatDate(Date inputDate) throws ParseException {
	        SimpleDateFormat inputFormat = new SimpleDateFormat("EEE MMM dd HH:mm:ss z yyyy"); // Handle original format (if needed)
	        SimpleDateFormat outputFormat = new SimpleDateFormat("dd-MM-yyyy");

	        String formattedDateString = outputFormat.format(inputDate); // Format to String first
	        Date formattedDate = inputFormat.parse(formattedDateString); // Parse the formatted string to create new Date object
	        return formattedDate;
	    }

}
