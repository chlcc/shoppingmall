package org.sup2is.util;

import lombok.Data;

@Data
public class PageNavigation {
	
	
	//ÃÑ ÆäÀÌÁö
	private int totalPage;
	private int countList = 10;
	private int countPage = 10;
	private int page;
	private int startPage;
	private int endPage;
	private int startCount;
	private int endCount;
	private int currentPage;
	
	
	public PageNavigation(int totalCount , int page) {
		
		totalPage = totalCount / countList;
		
		if(totalCount % countList > 0) {
			totalPage++;
		}
		
		if(totalPage < page) {
			this.page = totalPage;
		} else {
			this.page = page;
		}
		
		startPage = ((page-1) / 10) * 10 + 1;
	    endPage = startPage + countPage - 1;
		
		if(endPage > totalPage) {
			endPage = totalPage;
		}
		currentPage = (page - 1) * countPage;
	}
	
	
	
	
	
	
	
	
	

}
