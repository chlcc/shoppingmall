package org.sup2is.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.sup2is.form.ReplyForm;
import org.sup2is.model.Goods;
import org.sup2is.model.GoodsInfo;
import org.sup2is.model.Reply;
import org.sup2is.repository.ReplyRepository;
import org.sup2is.repository.ShopRepository;


@Service
public class ShopServiceImpl implements ShopService{

	@Autowired
	private ShopRepository shopRepository;
	
	@Override
	public List<Goods> getGoodsListByCategory(String category) {
		
		return shopRepository.getGoodsListByCategory(category);
	}

	@Override
	public Goods findGoodsByGno(int gno) {
		return shopRepository.findGoodsByGno(gno);
	}

	@Override
	public GoodsInfo findGoodsInfoByGno(int gno) {
		return shopRepository.findGoodsInfoByGno(gno);
	}
	
}
