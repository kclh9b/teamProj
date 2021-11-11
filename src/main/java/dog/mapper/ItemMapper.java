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
import dog.model.RecItemList;
import dog.model.RecItemVO;

@Mapper
public interface ItemMapper {

	ArrayList<ItemVO> itemList(Map map);
	
	Integer getItemCnt(Map map);
	
	ItemVO itemDetail(ItemVO iv);
	
	CartVO getCart(MemberVO mv);
	
	int addCart(Map map);
	
	//장바구니 추가하려는 상품 있는지 확인
	CartItemVO checkCartItem(Map map);
	
	//장바구니 상품 추가
	int addCartItem(Map map);
	
	//장바구니 추가 때 상품 있을 시수량 변경
	int addUpdateCartItem(Map map);
	
	//안씀
	String getLastCNO();
	
	
	//내 장바구니 목록
	ArrayList<CartItemVO> getCartList(MemberVO mv);
	
	//장바구니에서 고른 아이템 -> 결제화면에 가져옴
	ArrayList<CartItemVO> getItemCheckout(Map map);
	
	//장바구니 선택 아이템 삭제
	int delCartItem(Map map);
	
	//장바구니 전체 아이템 삭제
	int delAllCartItem(MemberVO mv);
	
	//장바구니 수량 변경
	int updateCartItem(Map map);
	
	
	
	// 추천상품 =================================
	//모든 상품코드 가져오기
	ArrayList<ItemVO> getInos();
	
	//추천상품 코드 가져오기
	ArrayList<RecItemVO> getRecInos();
	
	//추천상품 변경
	int updateRecInos(ArrayList<RecItemVO> ril);
	
	//추천상품 가져오기 (선정화면)
	ArrayList<ItemVO> recItemAllList();
	
	//추천상품 가져오기 (메인화면)
	ArrayList<ItemVO> recItemList(ArrayList<RecItemVO> rivl);
}
