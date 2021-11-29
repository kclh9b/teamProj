package dog.control;

import java.util.ArrayList;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dog.domain.item.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

@Controller
public class ItemController {

	@Autowired
	private ItemService isi;

	//어드민 ==============================================================
	//상품 등록 폼
	@RequestMapping("/product/productForm")
	String itemForm() {
		return "product/productForm";
	}

	//상품명 중복체크
	@ResponseBody
	@RequestMapping(value="/nameck")
	public int nameck(ItemVO vo) throws Exception {
		return isi.checkName(vo);
	}

	//상품 등록
	@RequestMapping("/product/productReg")
	ModelAndView itemSave(HttpServletRequest request , ItemVO vo) {
		return isi.save(request, vo);
	}

	//상품 수정 폼
	@RequestMapping("/product/productmodifyForm")
	ModelAndView itemModiForm(ItemVO vo) {
		ModelAndView mav = new ModelAndView("product/productmodifyForm");
		mav.addObject("pro", isi.adminGetItem(vo));
		return mav;
	}

	//상품 수정
	@RequestMapping("/product/productmodifyReg")
	ModelAndView productmodifyreg(ItemVO vo) {
		return isi.modi(vo);
	}

	//상품 삭제
	@RequestMapping("/product/productdeleteReg")
	ModelAndView productdeleteReg(ItemVO vo) {
		return isi.delete(vo);
	}

	//상품 리스트 조회
	@RequestMapping("/product/productlist")
	ModelAndView items(ItemVO vo, HttpSession session, PageInfo pageInfo) {
		return isi.adminGetItems(vo, session, pageInfo);
	}

	//상품 조회
	@RequestMapping("/product/productdetail")
	String item(ItemVO vo) {
		isi.adminGetItem(vo);
		return "product/productdetail";
	}

/*	//입고처리(기능 미구현)
	@RequestMapping("/product/productreceive")
	ModelAndView productreceive(ItemVO vo) {

		ModelAndView mav = new ModelAndView("product/productreceive");
		mav.addObject("receiveitem", mapper.productDetail(vo));

		return mav;
	}

	@RequestMapping("/product/receiveReg")
	ModelAndView receiveReg(ItemVO vo) {

		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.productReceive(vo);
		System.out.println("receiveReg cnt :"+cnt);

		mav.addObject("msg", "입고되었습니다");
		mav.addObject("url", "productdetail?ino="+vo.getIno());

		return mav;
	}
*/
	//추천상품 선정화면
	@RequestMapping("/adminRecommend")
	String adminRecommend(Model mm) {
		isi.getRecItems(mm);
		return "item/recommend";
	}

	//추천상품 변경
	@RequestMapping("/recItemAction")
	String recItemAction(Model mm, RecItemList ril) {
		isi.modiRecItems(mm, ril);
		return "alert";
	}

	//어드민 ==============================================================


	@RequestMapping("/itemlist")
	String mainCate(Model mm, SchCondition sc, HttpSession session, 
			@RequestParam(value="custom", defaultValue="") String custom, @RequestParam(value="onNav", defaultValue="") String onNav) {
		return isi.getItems(mm, sc, session, custom, onNav);
	}
	
	@RequestMapping("/item/{ino}")
	String itemDetail(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2) {
		return isi.getItem(mm, iv, session, vo1, vo2);
	}

}
