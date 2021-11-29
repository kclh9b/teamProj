package dog.domain.order.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dog.domain.item.ItemVO;
import dog.domain.member.MemberVO;
import dog.domain.order.OrderVO;
import dog.domain.order.OrderitemVO;

@Mapper
public interface OrderMapper {
				
	List<OrderVO> orderList(OrderVO vo);
	
	int orderTotal(OrderVO vo);
	
	List<OrderVO> orderCancellist(OrderVO vo);
	
	int orderCancelTotal(OrderVO vo);
	
	List<OrderVO> orderRefundllist(OrderVO vo);
	
	int orderRefundTotal(OrderVO vo);
	
	List<OrderVO> userorderList(MemberVO vo);
	
	int userorderTotal(MemberVO vo);
	
	OrderVO orderDetail(OrderVO vo);

	OrderitemVO orderitemDetailList(OrderitemVO vo);
	
	List<OrderitemVO> orderitemDetail(OrderVO vo);
	
	int updateItemstate(OrderitemVO vo);
	
	int updatePaystate(OrderVO vo);
	
	int updateDno(OrderVO vo);
	
	void updateStates(OrderVO vo);
	
	
	
	List<OrderitemVO> getOrderItems(OrderVO vo);
	
	String outputOno(OrderitemVO vo);
	
	int orderCancel(Map map);
	
	int updateRefundcnt(OrderitemVO vo);
	
	int updateRefund(OrderitemVO vo);
	
	int updateRefundprice(OrderitemVO vo);
	
	int updateCanceldate(OrderVO vo);

	int updateRefunddate(OrderVO vo);
	
	int updateRefundokdate(OrderVO vo);

}
