package dog.control;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;							// 수정 , 삭제 , 삽입

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.ModelAndView;

import dog.domain.board.mapper.CommentMapp;
import dog.domain.board.mapper.QnaMapp;
import dog.domain.board.mapper.ReviewMapp;
import dog.domain.board.CommentVO;
import dog.domain.item.ItemVO;
import dog.domain.board.PageInfoCHS;
import dog.domain.board.QnaVO;

@Controller
public class QnaController {

	@Resource
	QnaMapp mapper;
	
	@Resource
	ReviewMapp rvmap;
	
	@Resource
	CommentMapp mapper2;
	
	@RequestMapping("/board/qna")
	ModelAndView list(QnaVO vo, PageInfoCHS PageInfo) {	
		
		//		페이징
		PageInfo.setTotal(mapper.bbTotal(vo));
		System.out.println("Pageinfo : " + PageInfo);
		System.out.println("Pageinfo.getTotalpage : " + PageInfo.getTotalpage());

		
		ModelAndView mav = new ModelAndView("board/qna");
		mav.addObject("mainData", mapper.qnalist(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/comment")
	ModelAndView comment(HttpSession session, QnaVO vo1) {
		
		String user = (String)session.getAttribute("uid");
		if(user.equals("admin")) {
			ModelAndView mav = new ModelAndView("board/comment");
			mav.addObject("mainData", mapper.qnaDetail(vo1));
			return mav;
		} else {
			ModelAndView mav = new ModelAndView("alert");
			mav.addObject("msg", "관리자가 아닙니다.");
			mav.addObject("url", "/board/qna");
			return mav;	
		}
		
		
//			세션이 없을시
//		else if(session.getAttribute("uid")==null){
//			ModelAndView mav = new ModelAndView("alert");
//			mav.addObject("msg", "로그인 하세요");
//			mav.addObject("url", "/board/qna");
//			return mav;	
//		}
		
	}

	@RequestMapping("/board/qnaDet")
	ModelAndView detail(HttpSession session, QnaVO vo, CommentVO vo2) {
			
		// 코멘트
		// String user = (String)session.getAttribute("uid");
	
		ModelAndView mav = new ModelAndView("board/qnaDet");
		mav.addObject("mainData", mapper.qnaDetail(vo));
		mav.addObject("abc",mapper2.commentlist(vo2));
		return mav;		
		
	}

	@RequestMapping("/board/writeQna")
	ModelAndView writeForm(HttpSession session, ItemVO vo) {
				
		String user = (String)session.getAttribute("uid");
		ModelAndView mav = new ModelAndView("board/writeQna");
		mav.addObject("mainData", rvmap.itemlist());
		mav.addObject("uid",user);
		return mav;			
		
	}
	
	
	@RequestMapping("/board/writeQnaReg")
	ModelAndView writeReg(QnaVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.qnainsert(vo);
		System.out.println("writeQnaReg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/item/"+vo.getIno()+"#qna");
		return mav;		
		
	}	
	
	@RequestMapping("/board/qnaDel")
	ModelAndView deleteQna(QnaVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.qnaDel(vo);
		System.out.println("qnaDel cnt : " + cnt);

		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "qna");
		return mav;					
	}
	
	
	@RequestMapping("/board/qnaModi")
	ModelAndView modifyForm(QnaVO vo) {
		
		ModelAndView mav = new ModelAndView("board/qnaModi");
		mav.addObject("mainData", mapper.qnaDetail(vo));
		mav.addObject("item", rvmap.itemlist());
		return mav;		
		
	}
	
	@RequestMapping("/board/qnaModiReg")
	ModelAndView modifyReg(QnaVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.qnaModify(vo);
		System.out.println("qnaModiReg cnt : " + cnt);
		mav.addObject("msg", "수정되었습니다.");
		mav.addObject("url", "qnaDet?qnano="+vo.getQnano());
		return mav;		
		
	}
	
	@RequestMapping("/board/commentReg")
	ModelAndView commentReg(HttpServletRequest request, QnaVO vo1, CommentVO vo2) {
		
		ModelAndView mav = new ModelAndView("alert");
		
		int cnt = mapper2.commentinsert(vo2);
		System.out.println("revRepReg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/board/qnaDet?qnano="+vo2.getQnano());
		return mav;		
		
	}
	
	
	@RequestMapping("/board/delcm")
	ModelAndView deleteQna(CommentVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper2.delcomment(vo);
		System.out.println("delcm cnt : " + cnt);

		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "qnaDet?qnano="+vo.getQnano());
		return mav;					
	}

	
}
