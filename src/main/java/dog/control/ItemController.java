package dog.control;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import ch.qos.logback.core.recovery.ResilientSyslogOutputStream;
import dog.mapper.CheckoutMapper;
import dog.mapper.CommentMapp;
import dog.mapper.ItemMapper;
import dog.mapper.MemberMapp;
import dog.mapper.QnaMapp;
import dog.mapper.ReviewMapp;
import dog.mapper.ReviewReplyMapp;
import dog.mapper.SettleMapper;
import dog.model.CartVO;
import dog.model.CartItemList;
import dog.model.CartItemVO;
import dog.model.ItemVO;
import dog.model.MemberVO;
import dog.model.OrderVO;
import dog.model.QnaVO;
import dog.model.RecItemList;
import dog.model.RecItemVO;
import dog.model.ReviewVO;
import dog.model.SchCondition;
import dog.service.AddCart;
import dog.service.CheckoutAction;



@Controller
public class ItemController {
	
	@Resource
	ItemMapper im;
	
	@Resource
	CheckoutMapper cm;
	
	@Resource
	MemberMapp mapper;
	
	@Resource
	ReviewMapp rvmapper;
	
	@Resource
	ReviewReplyMapp rvrpmapp;
	
	@Resource
	QnaMapp qnmapper;
	
	@Resource	
	CommentMapp cmmapp;
	

	

	@RequestMapping("/itemlist")
	String mainCate(Model mm, SchCondition sc, HttpSession session, 
			@RequestParam(value="custom", defaultValue="") String custom, @RequestParam(value="onNav", defaultValue="") String onNav) {
		Map<String, Object> para = new HashMap<>();
		para.put("cate", sc.getCate());
		para.put("schkind",sc.getSchkind());
		para.put("keyword",sc.getKeyword());
		para.put("min", sc.getMin());
		para.put("max", sc.getMax());
		para.put("order", sc.getOrder());
		para.put("fur", sc.getFur());
		para.put("size", sc.getSize());
		para.put("age", sc.getAge());
		para.put("page", sc.getPage()-1);
		para.put("limit", sc.getLimit());
		
		String url1 = "";
		if(custom.equals("y")) {
			url1 = "custom.jsp";
			mm.addAttribute("url1", url1);
		}else {
			url1 = "dummy.jsp";
			mm.addAttribute("url1", url1);
		}
		String url2 = "";
		if(onNav.equals("y")) {
			String cateNum = sc.getCate().substring(0,1);
			switch(cateNum) {
			case "1" :
				url2 = "food.jsp";
				mm.addAttribute("url2", url2);
				break;
			case "2" :
				url2 = "care.jsp";
				mm.addAttribute("url2", url2);
				break;
			case "3" :
				url2 = "toy.jsp";
				mm.addAttribute("url2", url2);
				break;
			case "4" :
				url2 = "outdoor.jsp";
				mm.addAttribute("url2", url2);
				break;
			}
		}else if(onNav.equals("n")) {
			url2 = "search.jsp";
			mm.addAttribute("url2", url2);
		}
		mm.addAttribute("onNav", onNav);
		
		if(session.getAttribute("uid")!=null) {
			mm.addAttribute("furData", session.getAttribute("fur"));
			mm.addAttribute("sizeData", session.getAttribute("size"));
			mm.addAttribute("ageData", session.getAttribute("age"));
			mm.addAttribute("weightData", session.getAttribute("weight"));
		}
		if(sc.getFur()!=null) {
			if(sc.getFur().equals("n")) {
				para.put("fur", "");
			}
			mm.addAttribute("furData", sc.getFur());				
		}
		if(sc.getSize()!=null) {
			if(sc.getSize().equals("n")) {
				para.put("size", "");
			}
			mm.addAttribute("sizeData", sc.getSize());				
		}
		if(sc.getAge()!=null) {
			if(sc.getAge().equals("n")) {
				para.put("age", "");
			}
			mm.addAttribute("ageData", sc.getAge());				
		}
		
		
		//페이징=================================
		sc.setTotal(im.getItemCnt(para));

		mm.addAttribute("pageCnt", (int)Math.ceil(sc.getTotal()/20.0));
		
		
		if(sc.getPage()!=null) {
			para.put("page", (sc.getPage()-1)*20);
		}
		
		mm.addAttribute("itemList", im.itemList(para));

		mm.addAttribute("custom", custom);
		
		
		System.out.println("itemlist/~진입");

		return "itemList";
	}
	
	@RequestMapping("/item/{ino}")
	String itemDetail(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2) {
		String id = (String)session.getAttribute("uid");
		mm.addAttribute("item", im.itemDetail(iv));
		mm.addAttribute("id", id);
		mm.addAttribute("black", session.getAttribute("black"));
		
		List<ReviewVO> reList = rvmapper.bringrv(vo1);		
		for (ReviewVO reviewVO : reList) {
			reviewVO.setRvrp(rvrpmapp.bringrvrp(reviewVO));
		}		
		mm.addAttribute("rv", reList);
		
		List<QnaVO> qnlist = qnmapper.bringqn(vo2);		
		for (QnaVO qnaVO : qnlist) {
			qnaVO.setQncm(cmmapp.bringcm(qnaVO));
		}		
		mm.addAttribute("rp", qnlist);
		return "item";
	}
	
	@RequestMapping("/item/addCartAction")
	String addCartAction(HttpSession session, CartItemList il, Model mm) {
		System.out.println("addCartAction 진입");
		Map<String, Object> map = new HashMap<>();
		MemberVO mv = new MemberVO();
		mv.setUid((String)session.getAttribute("uid"));
		AddCart ac = new AddCart();
		int result = ac.addCartItem(im, mv, il.getArr().get(0));
		
		return "cartResult";
	}
	
	@RequestMapping("/item/addCart")
	String addCart() {
		System.out.println("addCart 진입");
		return "cartResult";
	}
	
	@RequestMapping("/mypage/cart")
	String myCart(HttpSession session,  Model mm) {
		System.out.println("myCart 진입");
		MemberVO mv = new MemberVO();
		mv.setUid((String)session.getAttribute("uid"));
		
		mm.addAttribute("cl", im.getCartList(mv));
		mm.addAttribute("black", session.getAttribute("black"));
		return "myCart";
	}
	
	@RequestMapping(value="/updateCart")
	String delCart(HttpSession session,  Model mm, CartItemList il, 
			@RequestParam("action") String action, @RequestParam(value="ino", defaultValue="") String ino, @RequestParam(value="add", defaultValue="") String add) {
		System.out.println("updateCart 진입");
		MemberVO mv = new MemberVO();
		mv.setUid((String)session.getAttribute("uid"));
		Map<String, Object> map = new HashMap<>();
		map.put("mv", mv);
		if(action.equals("1")) {
			map.put("list", il.getArr());
			if(im.delCartItem(map)!=0) {
				mm.addAttribute("msg", "삭제되었습니다.");
				mm.addAttribute("url", "/mypage/cart");
			}			
		}else if(action.equals("2")) {
			if(im.delAllCartItem(mv)!=0) {
				mm.addAttribute("msg", "삭제되었습니다.");
				mm.addAttribute("url", "/mypage/cart");
			}
		}else if(action.equals("3")) {
			map.put("ino", ino);
			map.put("add", add);
			if(im.updateCartItem(map)!=0) {
				mm.addAttribute("url", "/mypage/cart");
				return "redirect:mypage/cart";
			}
		}
		return "alert";
	}
	
	@RequestMapping("/checkout")
	String checkout(HttpSession session, CartItemList il, Model mm, @RequestParam("state") String state) {
		System.out.println("checkout 진입");
		Map<String, Object> map = new HashMap<>();
		MemberVO mv = new MemberVO();
		mv.setUid((String)session.getAttribute("uid"));
		mv = mapper.mmListOne(mv);
		map.put("mv", mv);
		map.put("list", il.getArr());
		mm.addAttribute("mv", mv);
		ArrayList<CartItemVO> arr = null;
		int allPrice = 0;
		int delifee = 2500;
		if(state.equals("1")) {
			CartItemVO item = il.getArr().get(0);
			item.setTotalPrice(item.getCalprice() * item.getQuantity());
			arr = il.getArr();			
		}else if(state.equals("2")) {
			arr = im.getItemCheckout(map);			
		}
		for(int i=0; i<arr.size(); i++) {
			allPrice += arr.get(i).getTotalPrice();
		}
		if(allPrice>=20000) {
			delifee = 0;
		}
		mm.addAttribute("list", arr);
		int endPrice = allPrice + delifee;
		mm.addAttribute("allPrice", allPrice);
		mm.addAttribute("delifee", delifee);
		mm.addAttribute("endPrice", endPrice);
		return "checkout";
	}
	
	@RequestMapping(value="/checkoutAction", method=RequestMethod.POST)
	String checkoutAction(HttpSession session, CartItemList il, @RequestParam("state") String state, MemberVO mv, OrderVO ov, Model mm) {
		String url = "checkoutResult";
		System.out.println("checkoutAction 진입");
		CheckoutAction coa = new CheckoutAction();


			Map<String, Object> map = new HashMap<>();
			map.put("mv", mv);
			map.put("list", il.getArr());
			
			if(state.equals("1")) {
				
				if(coa.checkout(cm, state, mv, il.getArr(), ov)!=0) {
					
					System.out.println("성공~");
					mm.addAttribute("msg", "결제되었습니다.");
					mm.addAttribute("url", "/checkoutResult");
					
				}else {
					mm.addAttribute("msg", "결제에 실패했습니다.");
					mm.addAttribute("url", "/board/list");
					
				}
			}else if(state.equals("2")) {
				if(coa.checkout(cm, state, mv, im.getItemCheckout(map), ov)!=0) {
					
					System.out.println("성공~");
					mm.addAttribute("msg", "결제되었습니다.");
					mm.addAttribute("url", "/checkoutResult");
					
				}else {
					mm.addAttribute("msg", "결제에 실패했습니다.");
					mm.addAttribute("url", "/board/list");
					
				}
				
			}
			
		
		return "alert";
	}
	
	@RequestMapping("/checkoutResult")
	String checkoutResult() {
		
		return "checkoutResult";
	}
	
	@RequestMapping("/adminRecommend")
	String adminRecommend(Model mm) {
		
		ArrayList<RecItemVO> arr = im.getRecInos();
		mm.addAttribute("recList",im.recItemAllList());
		
		mm.addAttribute("inos",im.getInos());
		mm.addAttribute("recinos",im.getRecInos());
		return "recommend";
	}
	
	@RequestMapping("/recItemAction")
	String recItemAction(Model mm, RecItemList ril) {
		int result = im.updateRecInos(ril.getArr());
		if(result!=0) {
			mm.addAttribute("msg", "변경되었습니다.");
			mm.addAttribute("url", "/adminRecommend");			
		}
		
		return "alert";
	}

}
