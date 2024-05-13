package Model.Service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import Model.Dao.NotificationDao;
import Model.Entity.Notification;

@Service
public class NotificationImpl implements INotificationService{
	@Autowired
	private NotificationDao notificationDao;
	
	public int AddNotification(Notification notification) {
		return notificationDao.AddNotification(notification);
	}
	public List<Notification> GetAllNotification(){
		return notificationDao.GetDataNotification();
	}
	public Notification GetNotiFromId(int id) {
		return notificationDao.GetNotiFromId(id);
	}
	public int UpdateNotification(int id,Notification notification) {
		return notificationDao.UpdateNotification(id,notification);
	}
	public int DeleteNotification(int id) {
		return notificationDao.DeleteNotification(id);
	}
}
