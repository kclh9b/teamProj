package dog.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dog.domain.order.mapper.OrderMapper;
import dog.domain.item.ItemVO;
import dog.domain.member.MemberVO;
import dog.domain.order.OrderVO;
import dog.domain.order.OrderitemVO;
import dog.domain.item.PageInfo;

@Controller
public class OrderController {

	@Resource
	OrderMapper mapper;
	
	@RequestMapping("/order/orderlist")
	ModelAndView orderlist(OrderVO vo, HttpSession session, PageInfo pageInfo) {
		
		ModelAndView mav = new ModelAndView("order/orderlist");
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
		
		pageInfo.setTotal(mapper.orderTotal(vo));
		System.out.println("pageInfo :"+pageInfo);
		System.out.println("pageInfo.getTotalPage() :"+pageInfo.getTotalPage());
		
		mapper.updateStates(vo);
		mav.addObject("order", mapper.orderList(vo));
		
		return mav;
	}
	
	@RequestMapping("/order/orderdetail")
	ModelAndView orderdetail(OrderVO vo) {
		
		ModelAndView mav = new ModelAndView("order/orderdetail");
		mav.addObject("order", mapper.orderDetail(vo));
		mav.addObject("orderitem", mapper.orderitemDetail(vo));
		
		return mav;
	}
	
	@RequestMapping("/order/orderRefunddetail")
	ModelAndView orderRefunddetail(OrderVO vo, OrderitemVO ivo) {
		
		ModelAndView mav = new ModelAndView("order/orderRefunddetail");
		mav.addObject("order", mapper.orderDetail(vo));
		mav.addObject("orderitem", mapper.orderitemDetail(vo));
		mav.addObject("orderitemlist", mapper.orderitemDetailList(ivo));
		
		return mav;
	}
	
	// 배송준비, 배송중, 배송교환 상태 orderdetail에서 받아와서 변경해주는 매핑
	@RequestMapping("/order/orderdeliverymodifyReg")
	ModelAndView updateDelivery(OrderVO vo, OrderitemVO ivo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.updateItemstate(ivo);
		int cnt2 = mapper.updatePaystate(vo);
		System.out.println("updateItemstate cnt :"+cnt);
		System.out.println("updatePaystate cnt :"+cnt2);
		if(vo.getPaystate().equals("배송중")) {
			StringBuffer dno = new StringBuffer("");
	        //배달번호 난수 생성
	        for(int i=0; i<3; i++) {
	            int temp = (int)((Math.random()*9000)+1000);
	            if(i==0) {
	                dno.append(temp);
	            }else {
	                dno.append("-"+temp);
	            }
	        }
	        vo.setDno(dno.toString());
	        mapper.updateDno(vo);
		}
		
		mav.addObject("msg", "주문상태 수정되었습니다");
		mav.addObject("url", "orderdetail?ono="+vo.getOno()+"&oino="+vo.getOino());
		
		return mav;
	}
	
	@RequestMapping("/user/UserOrderlist")
	ModelAndView Userorderlist(HttpSession session, OrderVO vo, OrderitemVO ivo, MemberVO mvo, PageInfo pageInfo) {
		
		ModelAndView mav = new ModelAndView("user/UserOrderlist");
		
//		MemberVO mem = new MemberVO();
//		mem.setUid((String)session.getAttribute("uid"));
		
		mvo.setUid((String)session.getAttribute("uid"));
		mapper.updateStates(vo);
		mav.addObject("uorder", mapper.userorderList(mvo));
		
		pageInfo.setTotal(mapper.userorderTotal(mvo));
		System.out.println("pageInfo :"+pageInfo);
		System.out.println("pageInfo.getTotalPage() :"+pageInfo.getTotalPage());

		
		return mav;
	}
	
	@RequestMapping("/user/UserOrderdetail")
	ModelAndView Userorderdetail(OrderVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("user/UserOrderdetail");
		
		MemberVO mem = new MemberVO();
		mem.setUid((String)session.getAttribute("uid"));
		
		mav.addObject("uorder", mapper.orderDetail(vo));
		mav.addObject("uorderitem", mapper.orderitemDetail(vo));
		
		return mav; 
	}
	
	@RequestMapping("/user/UserOrdercancel")
	ModelAndView Userordercancel(OrderitemVO vo, OrderVO ovo, ItemVO ivo) {
		
		ModelAndView mav = new ModelAndView("user/UserOrdercancel");
//		mapper.orderCancel(ivo);
		
		mav.addObject("order", mapper.orderDetail(ovo)); // ordertable
		mav.addObject("orderitem", mapper.orderitemDetail(ovo)); // orderitemv
		
		
		return mav;
	}
	
	@RequestMapping("/user/UserOrderrefund")
	ModelAndView UserOrderrefund(OrderitemVO vo, OrderVO ovo, ItemVO ivo) {
		
		ModelAndView mav = new ModelAndView("user/UserOrderrefund");
//		mapper.orderCancel(ivo);
		
		mav.addObject("order", mapper.orderDetail(ovo)); // ordertable
		mav.addObject("orderitem", mapper.orderitemDetail(ovo)); // orderitemv
		mav.addObject("odlist", mapper.orderitemDetailList(vo));
		
		return mav;
	}
	
//	@RequestMapping("/user/UserOrderrefund")
//	ModelAndView Userorderrefund(OrderitemVO vo, OrderVO ovo) {
//		
//		ModelAndView mav = new ModelAndView("user/UserOrderrefund");
//		
//		mav.addObject("orderitem", mapper.orderitemDetailList(vo));	
//		
//		return mav;
//	}
	
	@RequestMapping("/user/cancelReg")
	ModelAndView UsercancelReg(ItemVO vo, OrderitemVO ovo, OrderVO ov) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		
		Map<String, Object> map = new HashMap<>();
		List<OrderitemVO> list = mapper.getOrderItems(ov);
		
		map.put("ov", ov);
		map.put("list", list);
		int cnt = mapper.orderCancel(map);
		System.out.println("orderCancel = "+ cnt);
		
		int upit = mapper.updateItemstate(ovo);
		int uppt = mapper.updatePaystate(ov);
		int candate = mapper.updateCanceldate(ov);
		
		System.out.println("updateItemstate cnt = "+ upit);
		System.out.println("updatePaystate cnt = "+ uppt);
		System.out.println("updateCanceldate cnt = "+ candate);
		//mapper.orderCancel(vo);
		
		
		mav.addObject("msg", "처리되었습니다");
		mav.addObject("url", "UserOrderlist");
		
		return mav;
	}
	
	@RequestMapping("/user/refundReg")
	ModelAndView UserrefundReg(OrderitemVO ivo, OrderVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		String ono = mapper.outputOno(ivo);
		
		int upit = mapper.updateItemstate(ivo);
		int uppt = mapper.updatePaystate(vo);
		int cnt2 = mapper.updateRefund(ivo);
		int cnt1 = mapper.updateRefundcnt(ivo);
		int cnt3 = mapper.updateRefundprice(ivo);
		int cnt4 = mapper.updateRefunddate(vo);
//		int cnt4 = mapper.updateRefundState(vo);
		
		System.out.println("updateItemstate cnt :"+upit);
		System.out.println("updatePaystate cnt :"+uppt);
		System.out.println("updateRefundcnt cnt :"+cnt1);
		System.out.println("updateRefund cnt :"+cnt2);
		System.out.println("updateRefundprice cnt :"+cnt3);
		System.out.println("updateRefunddate cnt :"+cnt4);
		
		mav.addObject("msg", "반품신청 되었습니다");
		mav.addObject("url", "UserOrderdetail?ono="+ono+"&oino="+ivo.getOino());
		//mav.addObject("url", "UserOrderlist");
		
		return mav;
	}
	
	@RequestMapping("/order/orderCancellist")
	ModelAndView orderCancellist(OrderVO vo, HttpSession session, PageInfo pageInfo) {
		
		ModelAndView mav = new ModelAndView("order/orderCancellist");
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
		
		pageInfo.setTotal(mapper.orderCancelTotal(vo));
		System.out.println("pageInfo :"+pageInfo);
		System.out.println("pageInfo.getTotalPage() :"+pageInfo.getTotalPage());
		
		mapper.updateStates(vo);
		mav.addObject("order", mapper.orderCancellist(vo));
		
		return mav;
	}
	
	@RequestMapping("/order/orderRefundlist")
	ModelAndView orderRefundlist(OrderVO vo, HttpSession session, PageInfo pageInfo) {
		
		ModelAndView mav = new ModelAndView("order/orderRefundlist");
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
		
		pageInfo.setTotal(mapper.orderRefundTotal(vo));
		System.out.println("pageInfo :"+pageInfo);
		System.out.println("pageInfo.getTotalPage() :"+pageInfo.getTotalPage());
		
		mapper.updateStates(vo);
		mav.addObject("order", mapper.orderRefundllist(vo));
		
		return mav;
	}
	
	@RequestMapping("/order/orderrefundmodifyReg")
	ModelAndView updaterefund(OrderVO ov, OrderitemVO ivo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		Map<String, Object> map = new HashMap<>();
		List<OrderitemVO> list = mapper.getOrderItems(ov);
		
		map.put("ov", ov);
		map.put("list", list);
		int cnt = mapper.orderCancel(map);
		System.out.println("orderCancel = "+ cnt);
		
		int upIt = mapper.updateItemstate(ivo);
		int uppt = mapper.updatePaystate(ov);
		System.out.println("updateItemstate cnt :"+upIt);
		System.out.println("updatePaystate cnt :"+uppt);

		int rfok = mapper.updateRefundokdate(ov);
		System.out.println("updateRefundokdate cnt :"+rfok);
		
//		int cnt1 = mapper.updateQuantity(ivo);
//		System.out.println("updateQuantity cnt :"+cnt1);
		
		mav.addObject("msg", "반품승인 되었습니다");
		mav.addObject("url", "orderRefunddetail?ono="+ov.getOno()+"&oino="+ov.getOino());
		
		return mav;
	}
	
	
	
	
	
}
