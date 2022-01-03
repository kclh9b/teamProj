package dog.web.control;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import dog.domain.item.*;
import dog.web.form.ItemSaveForm;
import dog.web.validation.ItemSaveValidator;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.BeanUtils;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.annotation.Validated;
import org.springframework.web.bind.WebDataBinder;
import org.springframework.web.bind.annotation.*;

import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;

import java.util.LinkedHashMap;
import java.util.Map;

@Slf4j
@Controller
@RequiredArgsConstructor
public class ItemController {

	private final ItemService isi;
	private final ItemSaveValidator itemSaveValidator;

	@InitBinder("saveItem")
	private void init(WebDataBinder dataBinder) {
		dataBinder.addValidators(itemSaveValidator);
	}

	private static class Size {
		static Map<String, String> sizes = new LinkedHashMap<>();

		static {
			sizes.put("소형견", "소");
			sizes.put("중형견", "중");
			sizes.put("대형견", "대");
		}

		public static Map<String, String> getSizes() {
			return sizes;
		}
	}

	private static class Fur {
		static Map<String, String> furs = new LinkedHashMap<>();

		static {
			furs.put("장모종", "l");
			furs.put("단모종", "s");
		}

		public static Map<String, String> getFurs() {
			return furs;
		}
	}

	private static class Age {
		static Map<String, String> Ages = new LinkedHashMap<>();

		static {
			Ages.put("1살 미만(자견)", "자견");
			Ages.put("1살 ~ 6살(성견)", "성견");
			Ages.put("7살 이상(노견)", "노견");
		}

		public static Map<String, String> getAges() {
			return Ages;
		}
	}

	//어드민 ==============================================================
	//상품 등록 폼
	@GetMapping("/admin/item/save")
	String itemSaveForm(@ModelAttribute("saveItem") ItemSaveForm item) {
//		return "item/save_A";
		return "thymeleaf/item/save_A";
	}

	//상품명 중복체크
	@ResponseBody
	@PostMapping(value = "/admin/item/nameck")
	public int nameCheck(ItemVO vo) throws Exception {
		return isi.checkName(vo);
	}

	//상품 등록
	@PostMapping("/admin/item/save")
	String itemSave(HttpServletRequest request, Model mm, @Validated @ModelAttribute("saveItem") ItemSaveForm item, BindingResult bindingResult) {

		if (bindingResult.hasErrors()) {
			log.error("errors = {}", bindingResult);
			return  "thymeleaf/item/save_A";
		}

		ItemVO vo = new ItemVO();
		BeanUtils.copyProperties(item, vo);
//		ItemVO vo = new ItemVO(item.getCateid(), item.getPrice(), item.getDiscount(), item.getQuantity(),
//				item.getName(), item.getOrigin(), item.getManufac(), item.getMain_img(), item.getDetail_img(), item.getSize(), item.getFur(),
//				item.getAge(), item.getFatyn(), item.getMfile(), item.getDfile());
		isi.save(request, mm, vo);
		return "alert";
	}

	//상품 수정 폼
	@GetMapping("/admin/item/{ino}/modi")
	String itemModiForm(Model mm, @PathVariable("ino") Integer ino) {
		ItemVO vo = new ItemVO();
		vo.setIno(ino);
		isi.adminGetItem(mm, vo);
		mm.addAttribute("sizes", Size.getSizes());
		mm.addAttribute("furs", Fur.getFurs());
		mm.addAttribute("ages", Age.getAges());
//		return "item/modi_A";
		return "thymeleaf/item/modi_A";
	}

	//상품 수정
	@PutMapping("/admin/item/{ino}/modi")
	String itemModi(Model mm, ItemVO vo) {
		System.out.println(vo.getName());
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
//		return "item/items_A";
		return "thymeleaf/item/items_A";
	}

	//상품 조회
	@RequestMapping("/admin/item/{ino}")
	String adminItem(Model mm, ItemVO vo) {
		isi.adminGetItem(mm, vo);
//		return "item/item_A";
		return "thymeleaf/item/item_A";
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
				 @RequestParam(value = "custom", defaultValue = "") String custom,
				 @RequestParam(value = "onNav", defaultValue = "") String onNav,
				 PageInfo pageInfo) {
		isi.getItems(mm, sc, session, custom, onNav, pageInfo);

		mm.addAttribute("sizes", Size.getSizes());
		mm.addAttribute("furs", Fur.getFurs());
		mm.addAttribute("ages", Age.getAges());
//		return "item/items";
		return "thymeleaf/item/items";
	}

	@GetMapping("/item/{ino}")
	String item(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1, QnaVO vo2) {
		isi.getItem(mm, iv, session, vo1, vo2);
		return "thymeleaf/item/item";
	}

}
