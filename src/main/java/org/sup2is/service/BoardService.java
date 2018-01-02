package org.sup2is.service;

import java.util.List;
import java.util.Map;

import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.util.PageNavigation;

public interface BoardService {

	void write(BoardForm form) throws Exception;

	int totalCount() throws Exception;

	List<Board> listPage(PageNavigation pageNavigation)throws Exception;

	Board readOne(int bno) throws Exception;

	boolean checkBoardAuth(Map<String, Object> param);

	void modify(Board board);

	int setInvisibleBoard(int bno);

	
}
