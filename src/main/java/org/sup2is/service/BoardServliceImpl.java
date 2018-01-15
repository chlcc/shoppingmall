package org.sup2is.service;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;
import org.springframework.util.ObjectUtils;
import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.repository.BoardRepository;
import org.sup2is.repository.FileRepository;
import org.sup2is.util.PageNavigation;

@Service
public class BoardServliceImpl implements BoardService{

	
	@Autowired
	private BoardRepository boardRepository;
	
	@Autowired
	private FileRepository fileRepository;
	
	@Override
	@Transactional
	public void write(BoardForm form) throws Exception {
		boardRepository.create(form);
		
		if(!ObjectUtils.isEmpty(form.getFilenames())) {
			Map<String, Object> param = new HashMap<>();
			param.put("list", form.getFilenames());
			fileRepository.setFileBno(param);
		}
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
	@Transactional
	public void modify(Board board) {
		boardRepository.modify(board);
		if(!ObjectUtils.isEmpty(board.getFilenames())) {
			Map<String, Object> param = new HashMap<>();
			param.put("list", board.getFilenames());
			fileRepository.setFileBno(param);
		}
	}

	@Override
	public int setInvisibleBoard(int bno) {
		return boardRepository.setInvisibleBoard(bno);
	}

	
}
