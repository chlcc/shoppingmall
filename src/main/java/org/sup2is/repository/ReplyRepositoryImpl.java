package org.sup2is.repository;

import java.util.List;

import org.mybatis.spring.SqlSessionTemplate;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;
import org.sup2is.form.ReplyForm;
import org.sup2is.model.Reply;

@Repository
public class ReplyRepositoryImpl implements ReplyRepository{

	@Autowired
	private SqlSessionTemplate sqlSessionTemplate;
	
	private final String namespace = "org.sup2is.mapper.ReplyRepository.";
	
	@Override
	public void addReply(ReplyForm form) {
		sqlSessionTemplate.insert(namespace + "addReply" , form);
	}

	@Override
	public List<Reply> replyList(int bno) {
		return sqlSessionTemplate.selectList(namespace + "replyList" , bno); 
	}

	@Override
	public void modReply(ReplyForm form) {
		sqlSessionTemplate.update(namespace + "modReply" , form);
	}

	@Override
	public void delReply(int rno) {
		sqlSessionTemplate.update(namespace + "delReply" , rno);
	}
	
}
