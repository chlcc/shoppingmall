package org.sup2is.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.repository.BoardRepository;
import org.sup2is.util.PageNavigation;

@Repository
public class BoardServliceImpl implements BoardService{

	
	@Autowired
	private BoardRepository boardRepository;
	
	@Override
	public void write(BoardForm form) throws Exception {
		boardRepository.create(form);
	}

	@Override
	public int totalCount() throws Exception {
		return boardRepository.totalCount();
	}

	@Override
	public List<Board> listPage(PageNavigation pageNavigation) {
		return boardRepository.listPage(pageNavigation);
	}
	
}
