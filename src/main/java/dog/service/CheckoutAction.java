package dog.service;

import java.util.*;

import org.springframework.stereotype.Service;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import dog.mapper.CheckoutMapper;
import dog.mapper.ItemMapper;
import dog.model.CartItemList;
import dog.model.CartItemVO;
import dog.model.MemberVO;
import dog.model.OIListVO;
import dog.model.OrderVO;

public class CheckoutAction {

	public int checkout(CheckoutMapper cm, String state, MemberVO mv, ArrayList<CartItemVO> il, OrderVO ov) {
		String oino = addOIList(cm, mv);
		
		if(addOrderItem(cm, mv, oino, il)!=0) {
			if(addOrder(cm, mv, il, ov, oino)!=0) {
				if(updateItem(cm,il)!=0) {
					if(state.equals("2")) {
						if(delCartItem(cm, mv, il) !=0) {
							return 1;
						}
						
					}
					return 1;
				}
				
			}
		}
		
		return 0;
	}
	
	String addOIList(CheckoutMapper cm, MemberVO mv) {
		String oino = "";
		String nowday = cm.getDate();
		Map<String, Object> map = new HashMap<>();
		map.put("mv", mv);
		
		String nowday2 = nowday.substring(6, 8);
		nowday = nowday.substring(2, 8);
		
		OIListVO oil = cm.getLastOINO();
		if(oil==null) {
			System.out.println("OIList 추가 루트 탐");
			oino = nowday+"001";
			System.out.println("널일때 oino:"+oino);
			map.put("oino", oino);
			int result = cm.addOIList(map);
			if(result==1) {
				System.out.println("OIList 추가 성공");
			}
		}else {
			if(nowday2.equals(oil.getOino().substring(4, 6))) {
				String newOino = "";
				if(oil.getOino().charAt(6)!=0) {
					newOino = String.format("%03d",(Integer.parseInt(oil.getOino().substring(6))+1));	
				}
				else if(oil.getOino().charAt(7)!=0) {
					newOino = String.format("%03d",(Integer.parseInt(oil.getOino().substring(7))+1));					
				}else if(oil.getOino().charAt(8)!=0){
					newOino = String.format("%03d",(Integer.parseInt(oil.getOino().substring(8))+1));					
				}
				newOino = nowday + newOino;
				map.put("oino", newOino);
				
				
				int result = cm.addOIList(map);
				if(result==1) {
					System.out.println("OIList 추가 성공");
					return newOino;
				}
				
				System.out.println("번호 이어서 업데이트");
				return newOino;
			}else {
				System.out.println(nowday);
				System.out.println(oil.getOino());
				String newOino = nowday + "001";
				map.put("oino", newOino);
				
				int result = cm.addOIList(map);
				if(result==1) {
					System.out.println("OIList 추가 성공");
					return newOino;
				}
				
				System.out.println("당일 새로 생성");
				return newOino;
			}
		}
		
		return "none";
	}
	
	int addOrderItem(CheckoutMapper cm, MemberVO mv, String oino, ArrayList<CartItemVO> il) {
		
		Map<String, Object> map = new HashMap<>();
		
		map.put("oino", oino);
		map.put("mv", mv);
		map.put("list", il);
		int result = (cm.addOrderItem(map));
		if(result != 0) {
			return result;
		}
		
		return 0;
	}
	
	int delCartItem(CheckoutMapper cm, MemberVO mv, ArrayList<CartItemVO> il) {
		
		Map<String, Object> map = new HashMap<>();
		map.put("mv", mv);
		map.put("list", il);
		int result = (cm.delCartItem(map));
		if(result != 0) {
			return result;
		}
		return 0;
	}
	
	int updateItem(CheckoutMapper cm, ArrayList<CartItemVO> il) {
		
		int result = cm.updateItem(il);
		if(result!=0) {
			System.out.println("상품 업데이트 성공! : " + result);
			return result;
		}
		
		return 0;
	}
	
	int addOrder(CheckoutMapper cm, MemberVO mv, ArrayList<CartItemVO> il, OrderVO ov, String oino) {
		String nowday = cm.getDate().substring(0, 4);
		String ono = nowday+"-"+oino;
		ov.setOno(ono);
		System.out.println(ono);
		ov.setOino(oino);
		StringBuffer dno = new StringBuffer("");
		//배달번호 난수 생성
		/*
		for(int i=0; i<3; i++) {
			int temp = (int)((Math.random()*9000)+1000);
			if(i==0) {
				dno.append(temp);
			}else {
				dno.append("-"+temp);
			}
		}*/
		ov.setDno(dno.toString());
		
		Map<String, Object> map = new HashMap<>();
		map.put("mv", mv);
		map.put("ov", ov);
		int result = (cm.addOrder(map));
		if(result != 0) {
			return result;
		}
		
		return 0;
	}
}
