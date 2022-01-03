package dog.web.control;


import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import dog.domain.item.PageInfo;
import lombok.extern.slf4j.Slf4j;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import dog.domain.board.mapper.BoardMapp;
import dog.domain.item.mapper.ItemMapper;
import dog.domain.item.RecItemVO;

@Slf4j
@Controller
public class WelcomeController {

	@Resource
	ItemMapper im;
	
	@Resource
	BoardMapp board;
	
	@RequestMapping("/")
	String main(HttpServletRequest request, Model mm, PageInfo pageInfo) {

		//상품==============================================================
		Map<String, Object> map = new HashMap<>();
		map.put("cate", "");
		map.put("keyword", null);
		map.put("min", null);
		map.put("max", null);
		map.put("order", "new");
		map.put("page", pageInfo.getPage()-1);
		map.put("limit", pageInfo.getLimit());

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

//		HttpServletRequest req = ((ServletRequestAttributes) RequestContextHolder.currentRequestAttributes()).getRequest();
		String ip = request.getHeader("X-FORWARDED-FOR");
		if (ip == null)
			ip = request.getRemoteAddr();

		getIp(request);

		return "thymeleaf/index";
	}

	private String getIp(HttpServletRequest request) {

		String welcome = "welcome 진입";
		String ip = request.getHeader("X-Forwarded-For");

		log.info("{} >>>> X-FORWARDED-FOR : {}", welcome, ip);

		if (ip == null) {
			ip = request.getHeader("Proxy-Client-IP");
			log.info("{} >>>> Proxy-Client-IP : {}", welcome, ip);
		}
		if (ip == null) {
			ip = request.getHeader("WL-Proxy-Client-IP"); // 웹로직
			log.info("{} >>>> WL-Proxy-Client-IP : {}", welcome, ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_CLIENT_IP");
			log.info("{} >>>> HTTP_CLIENT_IP : {}", welcome, ip);
		}
		if (ip == null) {
			ip = request.getHeader("HTTP_X_FORWARDED_FOR");
			log.info("{} >>>> HTTP_X_FORWARDED_FOR : {}", welcome, ip);
		}
		if (ip == null) {
			ip = request.getRemoteAddr();
		}

		log.info("{} >>>> Result : IP Address : {}", welcome, ip);

		return ip;

	}
}
