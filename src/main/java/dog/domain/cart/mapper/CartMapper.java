package dog.domain.cart.mapper;

import dog.domain.cart.CartItemVO;
import dog.domain.member.MemberVO;
import org.apache.ibatis.annotations.Mapper;

import java.util.ArrayList;
import java.util.Map;

@Mapper
public interface CartMapper {
    //내 장바구니 목록
    ArrayList<CartItemVO> getCartList(MemberVO mv);

    //장바구니 상품 추가
    int addCartItem(Map map);

    //장바구니 추가하려는 상품 있는지 확인
    CartItemVO checkCartItem(Map map);

    //장바구니 추가 때 상품 있을 시 수량 변경
    int addUpdateCartItem(Map map);

    //장바구니 수량 변경
    int updateCartItem(Map map);

    //장바구니 선택 아이템 삭제
    int delCartItem(Map map);

    //장바구니 전체 아이템 삭제
    int delAllCartItem(MemberVO mv);

    //장바구니에서 고른 아이템 -> 결제화면에 가져옴
    ArrayList<CartItemVO> getItemCheckout(Map map);
}
