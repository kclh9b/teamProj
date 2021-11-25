package dog.domain.settle;
import java.util.ArrayList;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dog.domain.item.ItemVO;
import dog.domain.order.OrderVO;
import dog.domain.order.OrderitemVO;
import dog.domain.settle.SettleSchCondition;
import dog.domain.settle.SettleVO;

@Mapper
public interface SettleMapper {
	
	SettleVO checkoutByDay();
	
	SettleVO checkoutByWeek();
	
	SettleVO checkoutByMonth();
	
	SettleVO checkoutByYear();
	
	ArrayList<SettleVO> viewDay(Map map);
	
	ArrayList<SettleVO> viewMonth(Map map);
	
	ArrayList<SettleVO> viewYear(Map map);
	
	// 검색한 상품 정보 가져오기
	ItemVO getInfoByKeyword(SettleSchCondition scc);
	
	ItemVO getGnameByCateid(SettleSchCondition scc);
	
	ItemVO getGnameSnameByCateid(SettleSchCondition scc);
	
	
	
	/*
	ArrayList<SettleVO> viewDay(String day);
	
	ArrayList<SettleVO> viewMonth(String month);
	
	ArrayList<SettleVO> viewYear(String year);
	*/

	
	
	ArrayList<OrderVO> getOrderList(Map map);
	
	ArrayList<OrderitemVO> getOrderItemList(ArrayList<OrderVO> ol);
}
