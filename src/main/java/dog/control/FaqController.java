package dog.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.FaqMapp;
import dog.model.FaqVO;
import dog.model.PageInfoCHS;

@Controller
public class FaqController {

	@Resource
	FaqMapp mapper;
	
	@RequestMapping("/board/faq")
	ModelAndView list(FaqVO vo, PageInfoCHS PageInfo) {
		
		
		//		페이징
		PageInfo.setTotal(mapper.bbTotal(vo));
		System.out.println("Pageinfo : " + PageInfo);
		System.out.println("Pageinfo.getTotalpage : " + PageInfo.getTotalpage());
		ModelAndView mav = new ModelAndView("board/faq");
		mav.addObject("mainData", mapper.fqlist(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/faqForm")
	String writeForm() {
		
		return "board/faqForm";			
	}
	
	@RequestMapping("/board/writeFaq")
	ModelAndView writeReg(FaqVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		int cnt = mapper.faqinsert(vo);
		System.out.println("writeFaq cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/board/faq");
		return mav;		
		
	}
	
	@RequestMapping("/board/faqDetail")
	ModelAndView detail(FaqVO vo) {
		
		ModelAndView mav = new ModelAndView("board/faqDetail");
		mav.addObject("mainData", mapper.faqdetail(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/faqDel")
	ModelAndView deleteForm(FaqVO vo, HttpSession session) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		String ad = (String)session.getAttribute("uid");		
		
		if(ad==null) {
			mav.addObject("msg", "로그인 하세요.");
			mav.addObject("url", "/");
			return mav;	
		} else if(!ad.equals("admin")) {
			mav.addObject("msg", "관리자가 아닙니다.");
			mav.addObject("url", "/");
			return mav;	
		}
		
		int cnt = mapper.faqDel(vo);
		System.out.println("faqdel cnt : " + cnt);

		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "faq");
		return mav;					
	}
	
	@RequestMapping("/board/modiFaq")
	ModelAndView modifyForm(FaqVO vo) {
		
		ModelAndView mav = new ModelAndView("board/modiFaq");
		mav.addObject("mainData", mapper.faqdetail(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/modiFaqReg")
	ModelAndView modifyReg(FaqVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.faqModify(vo);
		System.out.println("modiFaqReg cnt : " + cnt);
		mav.addObject("msg", "수정되었습니다.");
		mav.addObject("url", "faqDetail?faqno="+vo.getFaqno());
		return mav;		
		
	}
	
	
}
