package org.sup2is.service;

import java.util.List;

import org.sup2is.form.ReplyForm;
import org.sup2is.model.Reply;

public interface ReplyService {

	void addReply(ReplyForm form);

	List<Reply> replyList(int bno);
	
}
