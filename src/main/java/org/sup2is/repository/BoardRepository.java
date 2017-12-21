package org.sup2is.repository;

import java.util.List;

import org.springframework.stereotype.Repository;
import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.util.PageNavigation;

@Repository
public interface BoardRepository {
	
	void create(BoardForm form);

	int totalCount() throws Exception;

	List<Board> listPage(PageNavigation pageNavigation);

	Board readOne(int bno);

	void modify(Board board);

	int setInvisibleBoard(int bno);

	
}
