package org.sup2is.service;

import org.sup2is.form.UserInfoForm;
import org.sup2is.model.User;

public interface UserService {

	void join(UserInfoForm form) throws Exception;

	User findByUserId(String userId) throws Exception;
	
}
