package org.sup2is.service;

import java.util.HashMap;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.sup2is.form.GoodsForm;
import org.sup2is.repository.AdminRepository;
import org.sup2is.repository.FileRepository;

@Service
public class AdminServiceImpl implements AdminService{

	
	@Autowired
	private AdminRepository adminRepository;
	@Autowired
	private FileRepository fileRepository;
	
 
	@Override
	@Transactional
	public void addGoods(GoodsForm form) {
		
		adminRepository.addGoods(form);
		
		if(!ObjectUtils.isEmpty(form.getFilenames())) {
			Map<String, Object> param = new HashMap<>();
			param.put("list", form.getFilenames());
			fileRepository.setFileRno(param);
		}
		
		adminRepository.addGoodsInfo(form.getGoodsInfo());
		
	}


	@Override
	public void updateUserAuth(Map<String, String> map) {
		adminRepository.updateUserAuth(map);
	}

	
}
