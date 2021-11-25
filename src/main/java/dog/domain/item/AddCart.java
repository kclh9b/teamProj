package dog.domain.item;

import java.util.HashMap;
import java.util.Map;

import dog.domain.item.mapper.ItemMapper;
import dog.domain.cart.CartItemVO;
import dog.domain.member.MemberVO;

public class AddCart {
	
	public int addCartItem(ItemMapper im, MemberVO mv, CartItemVO iv) {
		//CartVO cv = im.getCart(mv);
		Map<String, Object> map = new HashMap<>();
		map.put("mv", mv);
		map.put("iv", iv);
		/*
		if(cv==null) {
			map.put("cno", Integer.valueOf(im.getLastCNO())+1);
			if(im.addCart(map)==1) {
				System.out.println("카트 추가 성공!");
				addCartItem(im, mv, iv);
			}
		}else {
			map.put("cno", cv.getCno());
			if(im.checkCartItem(map)==null) {
				if(im.addCartItem(map)==1) {
					return 1;				
				}
			}else {
				if(im.updateCartItem(map)==1) {
					return 1;
				}
			}
			
		}
		*/
		if(im.checkCartItem(map)==null) {
			if(im.addCartItem(map)==1) {
				return 1;				
			}
		}else {
			if(im.addUpdateCartItem(map)==1) {
				return 1;
			}
		}
		return 0;
	}
	
}
