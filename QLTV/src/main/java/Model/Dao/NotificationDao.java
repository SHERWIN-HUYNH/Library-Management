package Model.Dao;

import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.stereotype.Repository;

import Model.Entity.Notification;
import Model.Entity.NotificationMapper;

@Repository
public class NotificationDao extends BaseDao{
	@Autowired
	public JdbcTemplate _jdbcTemplate;

	public List<Notification> GetDataNotification() {
		List<Notification> list = new ArrayList<Notification>();
		String sql = "SELECT * FROM notification";
		list = _jdbcTemplate.query(sql, new NotificationMapper());
		return list;
	}
	public List<Notification> GetDataNotificationByMonth(int month) {
		List<Notification> list = new ArrayList<Notification>();
		String sql = "SELECT * FROM notification WHERE MONTH(dayCreated) = ?";
		list = _jdbcTemplate.query(sql, new NotificationMapper(), month);
		return list;
	}
	public List<Notification> GetDataIdNotification() {
		List<Notification> list = new ArrayList<Notification>();
		String sql = "SELECT id FROM notification";
		list = _jdbcTemplate.query(sql, new NotificationMapper());
		return list;
	}

	public int AddNotification(Notification notification) {
		StringBuffer sql = new StringBuffer();
		sql.append("INSERT INTO notification(title,content,image) VALUES('"+notification.getTitle()+"','"+notification.getContent()+"','"+notification.getImage()+"')");
		int rs = _jdbcTemplate.update(sql.toString());
		return rs;

	}

	public Notification GetNotiFromId(int id) {
		String sql = "SELECT * FROM notification WHERE id = ?";
		Notification notification = _jdbcTemplate.queryForObject(sql, new NotificationMapper(), id);
		return notification;
	}
	public int UpdateNotification(int id ,Notification notification) {
		int rs = 0;
		String sql = "UPDATE notification SET title = ?, content = ?,image = ? WHERE id = ?";
		rs = _jdbcTemplate.update(sql, notification.getTitle(),notification.getContent(),notification.getImage(),id);
		return rs;
	}
	
	public int DeleteNotification(int id) {
	    int rs = 0;
	    String sql = "DELETE FROM notification WHERE id = ?";
	    rs = _jdbcTemplate.update(sql, id);
	    return rs;
	}
}
