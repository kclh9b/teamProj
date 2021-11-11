package dog.control;

import java.io.FileNotFoundException;


import java.io.FileOutputStream;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.ReviewMapp;
import dog.mapper.ReviewReplyMapp;
import dog.model.ItemVO;
import dog.model.ReviewReplyVO;
import dog.model.ReviewVO;

@Controller
public class ReviewReplyController {

	@Resource
	ReviewMapp mapper;
	
	@Resource
	ReviewReplyMapp mapper2;
	
	
	@RequestMapping("/board/revRepReg")
	ModelAndView writeReg(HttpServletRequest request, ReviewVO vo1, ReviewReplyVO vo2) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		int cnt = mapper2.rrplyinsert(vo2);
		System.out.println("revRepReg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/board/revDet?revno="+vo2.getRevno());
		return mav;		
		
	}
	
	@RequestMapping("/board/delRreply")
	ModelAndView deleteForm(ReviewReplyVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper2.rrpdel(vo);
		System.out.println("delRreply cnt : " + cnt);		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "revDet?revno="+vo.getRevno());
		return mav;					
	}
	
	
	
}
