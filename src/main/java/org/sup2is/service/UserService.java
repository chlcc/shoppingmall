package org.sup2is.service;

import java.util.List;
import java.util.Map;

import org.sup2is.form.UserInfoForm;
import org.sup2is.model.Authority;
import org.sup2is.model.User;

public interface UserService{

	void join(UserInfoForm form) throws Exception;

	User findByUserId(String userId) throws Exception;

	void modify(User user);

	List<User> findAll();

	Authority findAuthByUserId(String userId);

}