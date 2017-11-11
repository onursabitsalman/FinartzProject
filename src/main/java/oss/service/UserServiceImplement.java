package oss.service;

import java.util.List;

import org.springframework.stereotype.Service;

import oss.dao.UserDao;
import oss.dao.UserDaoImplement;
import oss.model.User;

@Service
public class UserServiceImplement implements UserService{
	
	UserDao userDao;
	public UserServiceImplement()
	{
		userDao=new UserDaoImplement();
	}
	public UserDao getUserDao() {
		return userDao;
	}

	public void setUserDao(UserDao userDao) {
		this.userDao = userDao;
	}
	
	public List<User> listUser() {
		return userDao.listUser();
	}

	public void add(User user) {
		userDao.add(user);
		
	}

	public void update(User user) {
		userDao.update(user);
		
	}

	public void delete(User user) {
		userDao.delete(user);
		
	}

	public User findUserById(String id) {
		return userDao.findUserById(id);
	}

}
