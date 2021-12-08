package dog.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dog.domain.item.*;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.*;

import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
public class ItemController {

	@Autowired
	private ItemService isi;

	//어드민 ==============================================================
	//상품 등록 폼
	@GetMapping("/admin/item/save")
	String itemSaveForm(Model mm) {
		mm.addAttribute("item", new ItemVO());
		return "thymeleaf/item/save_A";
	}

	//상품명 중복체크
	@ResponseBody
	@PostMapping(value="/admin/item/nameck")
	public int nameCheck(ItemVO vo) throws Exception {
		return isi.checkName(vo);
	}

	//상품 등록
	@PostMapping("/admin/item/save")
	String itemSave(HttpServletRequest request , Model mm, ItemVO vo) {
		isi.save(request, mm, vo);
		return "alert";
	}

	//상품 수정 폼
	@GetMapping("/admin/item/{ino}/modi")
	String itemModiForm(Model mm, @PathVariable("ino") Integer ino) {
		ItemVO vo = new ItemVO();
		vo.setIno(ino);
		isi.adminGetItem(mm, vo);
		return "item/modi_A";
	}

	//상품 수정
	@PutMapping("/admin/item/{ino}/modi")
	String itemModi(Model mm, ItemVO vo) {
		isi.modi(mm, vo);
		return "alert";
	}

	//상품 삭제
	@DeleteMapping("/admin/item/{ino}/delete")
	String itemDelete(Model mm, @PathVariable("ino") Integer ino) {
		ItemVO vo = new ItemVO();
		vo.setIno(ino);
		isi.delete(mm, vo);
		return "alert";
	}

	//상품 목록 조회
	@RequestMapping("/admin/item")
	String adminItems(HttpSession session, Model mm, ItemVO vo, PageInfo pageInfo) {
		isi.adminGetItems(session, mm, vo, pageInfo);
		return "item/items_A";
	}

	//상품 조회
	@RequestMapping("/admin/item/{ino}")
	String adminItem(Model mm, ItemVO vo) {
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


	@GetMapping("/item")
	String items(Model mm, SchCondition sc, HttpSession session,
					@RequestParam(value="custom", defaultValue="") String custom,
					@RequestParam(value="onNav", defaultValue="") String onNav,
					PageInfo pageInfo) {
		isi.getItems(mm, sc, session, custom, onNav, pageInfo);
		return "item/items";
	}
	
	@GetMapping("/item/{ino}")
	String item(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2) {
		isi.getItem(mm, iv, session, vo1, vo2);
		return "item/item";
	}

}
