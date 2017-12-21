package org.sup2is.service;

import java.util.List;
import java.util.Map;

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
	public List<Board> listPage(PageNavigation pageNavigation) throws Exception{
		return boardRepository.listPage(pageNavigation);
	}

	@Override
	public Board readOne(int bno) throws Exception {
		return boardRepository.readOne(bno);
	}

	@Override
	public boolean checkBoardAuth(Map<String, Object> param) {
		Board board = boardRepository.readOne((int)param.get("bno"));
		if(board.getPassword().equals(param.get("password"))) {
			return true;
		}
		return false;
	}

	@Override
	public void modify(Board board) {
		boardRepository.modify(board);
	}

	@Override
	public int setInvisibleBoard(int bno) {
		return boardRepository.setInvisibleBoard(bno);
	}

	
}
