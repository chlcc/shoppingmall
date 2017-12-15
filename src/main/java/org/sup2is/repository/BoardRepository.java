package org.sup2is.repository;

import org.springframework.stereotype.Repository;
import org.sup2is.form.BoardForm;

@Repository
public interface BoardRepository {
	
	void create(BoardForm form);
	
}
