package dog.control;

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

@Controller
public class ItemController {

	@Autowired
	private ItemService isi;

	//어드민 ==============================================================
	//상품 등록 폼
	@RequestMapping("/product/productForm")
	String itemSaveForm() {
		return "item/saveForm_A";
	}

	//상품명 중복체크
	@ResponseBody
	@RequestMapping(value="/nameck")
	public int nameCheck(ItemVO vo) throws Exception {
		return isi.checkName(vo);
	}

	//상품 등록
	@RequestMapping("/product/productReg")
	String itemSave(HttpServletRequest request , Model mm, ItemVO vo) {
		isi.save(request, mm, vo);
		return "alert";
	}

	//상품 수정 폼
	@RequestMapping("/product/productmodifyForm")
	String itemModiForm(Model mm, ItemVO vo) {
		isi.adminGetItem(mm, vo);
		return "item/modiForm_A";
	}

	//상품 수정
	@RequestMapping("/product/productmodifyReg")
	String itemModi(Model mm, ItemVO vo) {
		isi.modi(mm, vo);
		return "alert";
	}

	//상품 삭제
	@RequestMapping("/product/productdeleteReg")
	String itemDelete(Model mm, ItemVO vo) {
		isi.delete(mm, vo);
		return "alert";
	}

	//상품 목록 조회
	@RequestMapping("/product/productlist")
	String items(HttpSession session, Model mm, ItemVO vo, PageInfo pageInfo) {
		isi.adminGetItems(session, mm, vo, pageInfo);
		return "item/items_A";
	}

	//상품 조회
	@RequestMapping("/product/productdetail")
	String item(Model mm, ItemVO vo) {
		isi.adminGetItem(mm, vo);
		return "item/item_A";
	}

	//추천상품 선정화면
	@RequestMapping("/adminRecommend")
	String adminRecommend(Model mm) {
		isi.getRecItems(mm);
		return "item/rec_A";
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
					@RequestParam(value="custom", defaultValue="") String custom,
					@RequestParam(value="onNav", defaultValue="") String onNav,
					PageInfo pageInfo) {
		isi.getItems(mm, sc, session, custom, onNav, pageInfo);
		return "item/items";
	}
	
	@RequestMapping("/item/{ino}")
	String itemDetail(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2) {
		isi.getItem(mm, iv, session, vo1, vo2);
		return "item/item";
	}

}
