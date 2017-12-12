package org.sup2is.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.springframework.transaction.annotation.Transactional;
import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;
import org.sup2is.repository.UserRepository;

@Repository
public class UserServiceImpl implements UserService{
	
	@Autowired
	private UserRepository userRepository;

	@Override
	@Transactional(rollbackFor= {Exception.class})
	public void join(UserInfoForm form) throws Exception {
		userRepository.join(form);
		userRepository.setAuthority(form.getUserId());
		
	}

	@Override
	public User findByUserId(String userId) throws Exception {
		return userRepository.findByUserId(userId);
	}

}
