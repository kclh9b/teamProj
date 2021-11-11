package dog.mapper;
import java.util.ArrayList;
import java.util.Date;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dog.model.CartItemVO;
import dog.model.CartVO;
import dog.model.ItemVO;
import dog.model.MemberVO;
import dog.model.OIListVO;
import dog.model.OrderVO;

@Mapper
public interface CheckoutMapper {
	
	//서버 날짜 가져옴
	String getDate();
	
	//마지막 주문아이템번호 가져옴
	OIListVO getLastOINO();
	
	//OIList 추가
	int addOIList(Map map);
	
	//orderitem 추가
	int addOrderItem(Map map);
	
	//order 추가
	int addOrder(Map map);
	
	//결제시 아이템 업데이트
	int updateItem(ArrayList<CartItemVO> il);
	
	//장바구니 구매시 장바구니에서 삭제
	int delCartItem(Map map);
	
	
	
}
