package org.sup2is.repository;

import java.util.List;

import org.sup2is.form.ReplyForm;
import org.sup2is.model.Reply;

public interface ReplyRepository {

	void addReply(ReplyForm form);

	List<Reply> replyList(int bno);

	void modReply(ReplyForm form);

	void delReply(int rno);
	
}
