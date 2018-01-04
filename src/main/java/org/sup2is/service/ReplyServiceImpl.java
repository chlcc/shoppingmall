package org.sup2is.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sup2is.form.ReplyForm;
import org.sup2is.model.Reply;
import org.sup2is.repository.ReplyRepository;


@Service
public class ReplyServiceImpl implements ReplyService{

	@Autowired
	private ReplyRepository replyRepository;
	
	@Override
	public void addReply(ReplyForm form) {
		replyRepository.addReply(form);
	}

	@Override
	public List<Reply> replyList(int bno) {
		return replyRepository.replyList(bno);
	}

	@Override
	public void modReply(ReplyForm form) {
		replyRepository.modReply(form);
	}

	@Override
	public void delReply(int rno) {
		replyRepository.delReply(rno);
	}
	
	
	
}
