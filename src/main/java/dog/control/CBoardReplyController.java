package dog.control;

import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.CBoardMapp;
import dog.mapper.CBoardReplyMapp;
import dog.model.CboardReplyVO;
import dog.model.CboardVO;
import dog.model.NoticeVO;

@Controller
public class CBoardReplyController {

	@Resource
	CBoardMapp mapper;
	
	@Resource
	CBoardReplyMapp mapper2;
	

	
	
	@RequestMapping("/board/cbRepReg")
	ModelAndView writeReg(HttpServletRequest request, CboardVO vo1, CboardReplyVO vo2) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		int cnt = mapper2.crplyinsert(vo2);
		System.out.println("cbRepReg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/board/cbdetail?comuno="+vo2.getComuno());
		return mav;		
		
	}
	
	@RequestMapping("/board/delcbrp")
	ModelAndView deleteForm(CboardReplyVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper2.cbrpdel(vo);
		System.out.println("delcbrp cnt : " + cnt);

		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "cbdetail?comuno="+vo.getComuno());
		return mav;					
	}
	
	
}
