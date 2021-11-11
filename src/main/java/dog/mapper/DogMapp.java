package dog.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dog.model.ItemVO;
import dog.model.MemberVO;
import dog.model.OrderVO;
import dog.model.OrderitemVO;

@Mapper
public interface DogMapp  {
	
	List<ItemVO> productList(ItemVO vo);
	
	int productTotal(ItemVO vo);
				
	List<OrderVO> orderList(OrderVO vo);
	
	int orderTotal(OrderVO vo);
	
	List<OrderVO> orderCancellist(OrderVO vo);
	
	int orderCancelTotal(OrderVO vo);
	
	List<OrderVO> orderRefundllist(OrderVO vo);
	
	int orderRefundTotal(OrderVO vo);
	
	List<OrderVO> userorderList(MemberVO vo);
	
	int userorderTotal(MemberVO vo);
	
	List<OrderVO> useroino(MemberVO vo);
	
//	List<OrderitemVO> userorderList(OrderitemVO vo);
	
	List<OrderitemVO> orderitemList();
	
	ItemVO productDetail(ItemVO vo);
	
	OrderVO orderDetail(OrderVO vo);

	OrderitemVO orderitemDetailList(OrderitemVO vo);
	
//	OrderVO userorderDetail(OrderVO vo);
	
	List<OrderitemVO> orderitemCancel(OrderVO vo);
	
	List<OrderitemVO> orderitemDetail(OrderVO vo);
	
//	List<OrderitemVO> userorderitemDetail(OrderVO vo);
	
	int productInsert(ItemVO vo);
	
	int productModify(ItemVO vo);
	
	int productDelete(ItemVO vo);
	
	int updateItemstate(OrderitemVO vo);
	
//	int updateDelivery(OrderitemVO vo);
	
	int updatePaystate(OrderVO vo);
	
	int updateDno(OrderVO vo);
	
	int addQuantity(ItemVO vo);
	
	int minusQuantity(OrderitemVO vo);
	
	int productReceive(ItemVO vo);
	
	void updateStates(OrderVO vo);
	
	int updateRefundState(OrderVO vo);
	
	
	
	List<OrderitemVO> getOrderItems(OrderVO vo);
	
	String outputOno(OrderitemVO vo);
	
	int orderCancel(Map map);
	
	int updateRefundcnt(OrderitemVO vo);
	
	int updateRefund(OrderitemVO vo);
	
	int updateRefundprice(OrderitemVO vo);
	
	int updateQuantity(OrderitemVO vo);
	
	int updateCanceldate(OrderVO vo);

	int updateRefunddate(OrderVO vo);
	
	int updateRefundokdate(OrderVO vo);
	
	int ckname(ItemVO vo) throws Exception;
	
	
	//void orderCancel(ItemVO vo);
}
