package dog.domain.checkout.mapper;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dog.domain.cart.CartItemVO;
import dog.domain.order.OIListVO;

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
