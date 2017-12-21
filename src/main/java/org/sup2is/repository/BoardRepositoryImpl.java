package org.sup2is.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.BoardForm;
import org.sup2is.model.Board;
import org.sup2is.util.PageNavigation;

@Repository
public class BoardRepositoryImpl implements BoardRepository {

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "org.sup2is.mapper.BoardRepository.";  
	
	@Override
	public void create(BoardForm form) {
		sqlSessionTemplate.insert(namespace + "write" , form);
		
	}

	@Override
	public int totalCount() throws Exception {
		return sqlSessionTemplate.selectOne(namespace + "totalCount");
	}

	@Override
	public List<Board> listPage(PageNavigation pageNavigation) {
		return sqlSessionTemplate.selectList(namespace + "listPage", pageNavigation);
	}

	@Override
	public Board readOne(int bno) {
		return sqlSessionTemplate.selectOne(namespace + "readOne" , bno);
	}

	@Override
	public void modify(Board board) {
		sqlSessionTemplate.update(namespace + "modify" , board);
	}

	@Override
	public int setInvisibleBoard(int bno) {
		return sqlSessionTemplate.update(namespace + "setInvisibleBoard" ,bno );
	}

	
}
