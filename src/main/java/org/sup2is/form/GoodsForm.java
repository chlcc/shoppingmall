package org.sup2is.form;



import java.util.List;
import java.util.Map;

import javax.validation.constraints.NotNull;

import org.hibernate.validator.constraints.NotEmpty;

import lombok.Data;


@Data
public class GoodsForm {
	
	@NotEmpty
	private String name;
	
	@NotEmpty
	private String category;

	@NotNull // NotEmpty�� int ������ �ȵǾ �ٲ� ..
	private int price;
	
	@NotEmpty
	private String content;
	
	private Map<String, Integer> goodsInfo;
	
	private List<String> filenames;
	
}



