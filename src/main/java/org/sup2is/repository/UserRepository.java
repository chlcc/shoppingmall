package org.sup2is.repository;

import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;


public interface UserRepository {

	void join(UserInfoForm form) throws Exception;

	User findByUserId(String userId) throws Exception;

	void setAuthority(String userId);

	void modify(User user);
	
}
