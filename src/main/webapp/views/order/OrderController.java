package dog.control;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.DogMapp;
import dog.model.ItemVO;
import dog.model.MemberVO;
import dog.model.OrderVO;
import dog.model.OrderitemVO;

@Controller
public class OrderController {

	@Resource
	DogMapp mapper;
	
	@RequestMapping("/order/orderlist")
	ModelAndView orderlist(OrderVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("order/orderlist");
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
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
		System.out.println("updateDelivery cnt :"+cnt);
		mav.addObject("msg", "주문상태 수정되었습니다");
		mav.addObject("url", "orderdetail?ono="+vo.getOno()+"&oino="+vo.getOino());
		
		return mav;
	}
	
	@RequestMapping("/user/UserOrderlist")
	ModelAndView Userorderlist(HttpSession session, OrderVO vo) {
		
		ModelAndView mav = new ModelAndView("user/UserOrderlist");
		
		MemberVO mem = new MemberVO();
		mem.setUid((String)session.getAttribute("uid"));
		mapper.updateStates(vo);
		mav.addObject("uorder", mapper.userorderList(mem));

		
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
		System.out.println("updateItemstate cnt = "+ upit);
		//mapper.orderCancel(vo);
		
		
		mav.addObject("msg", "주문이 취소되었습니다");
		mav.addObject("url", "UserOrderlist");
		
		return mav;
	}
	
	@RequestMapping("/user/UserOrderrefund")
	ModelAndView Userorderrefund(OrderitemVO vo, OrderVO ovo) {
		
		ModelAndView mav = new ModelAndView("user/UserOrderrefund");
		
		mav.addObject("orderitem", mapper.orderitemDetailList(vo));	
		
		return mav;
	}
	
	@RequestMapping("/user/refundReg")
	ModelAndView UserrefundReg(OrderVO vo, OrderitemVO ivo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		String ono = mapper.outputOno(ivo);
		
		int cnt = mapper.updateItemstate(ivo);
		int cnt1 = mapper.updateRefundcnt(ivo);
		int cnt2 = mapper.updateRefund(ivo);
		int cnt3 = mapper.updateRefundprice(ivo);
		
		System.out.println("updateDelivery cnt :"+cnt);
		System.out.println("updateRefundcnt cnt :"+cnt1);
		System.out.println("updateRefund cnt :"+cnt2);
		System.out.println("updateRefundprice cnt :"+cnt3);
		
		mav.addObject("msg", "반품신청 되었습니다");
		mav.addObject("url", "UserOrderdetail?ono="+ono+"&oino="+vo.getOino());
		
		return mav;
	}
	
	@RequestMapping("/order/orderCancellist")
	ModelAndView orderCancellist(OrderVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("order/orderCancellist");
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
		mapper.updateStates(vo);
		mav.addObject("order", mapper.orderCancellist(vo));
		
		return mav;
	}
	
	@RequestMapping("/order/orderRefundlist")
	ModelAndView orderRefundlist(OrderVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("order/orderRefundlist");
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
		mapper.updateStates(vo);
		mav.addObject("order", mapper.orderRefundllist(vo));
		
		return mav;
	}
	
	@RequestMapping("/order/orderrefundmodifyReg")
	ModelAndView updaterefund(OrderVO vo, OrderitemVO ivo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.updateItemstate(ivo);
		int cnt1 = mapper.updateQuantity(ivo);
		System.out.println("updateItemstate cnt :"+cnt);
		System.out.println("updateQuantity cnt :"+cnt1);
		mav.addObject("msg", "반품승인 되었습니다");
		mav.addObject("url", "orderRefunddetail?ono="+vo.getOno()+"&oino="+vo.getOino());
		
		return mav;
	}
	
	
	
	
	
}
