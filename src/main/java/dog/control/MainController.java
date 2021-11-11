package dog.control;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dog.mapper.BoardMapp;
import dog.mapper.ItemMapper;
import dog.model.RecItemVO;
import dog.model.SchCondition;

@Controller
public class MainController {

	@Resource
	ItemMapper im;
	
	@Resource
	BoardMapp board;
	
	@RequestMapping("/")
	String main(Model mm, SchCondition sc) {
		
		System.out.println("main ~진입");
		//상품==============================================================
		Map<String, Object> map = new HashMap<>();
		map.put("cate", "");
		map.put("keyword", null);
		map.put("min", null);
		map.put("max", null);
		map.put("order", "new");
		map.put("page", sc.getPage()-1);
		map.put("limit", sc.getLimit());

		//신상품
		mm.addAttribute("newList", im.itemList(map));

		//추천상품
		ArrayList<RecItemVO> arr = im.getRecInos();
		mm.addAttribute("recList",im.recItemList(arr));
		
		//인기상품
		map.put("order", "sellcnt");
		mm.addAttribute("sellcntList", im.itemList(map));
		//상품==============================================================
		
		
		//공지사항
		mm.addAttribute("board",board.ntlist123());

		return "mainPage";
	}
	
}
