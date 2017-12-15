package org.sup2is.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.BoardForm;
import org.sup2is.repository.BoardRepository;

@Repository
public class BoardServliceImpl implements BoardService{

	
	@Autowired
	private BoardRepository boardRepository;
	
	@Override
	public void write(BoardForm form) throws Exception {
		boardRepository.create(form);
	}
	
}
