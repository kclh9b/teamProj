package dog.control;

import java.io.FileNotFoundException;

import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.BoardMapp;
import dog.model.NoticeVO;
import dog.model.PageInfoCHS;

@Controller
public class BoardController {
	
	@Resource
	BoardMapp mapper;
	
	@RequestMapping("/board/list")
	ModelAndView list(NoticeVO vo, PageInfoCHS PageInfo) {
		
		//		페이징
		PageInfo.setTotal(mapper.bbTotal(vo));
		System.out.println("Pageinfo : " + PageInfo);
		System.out.println("Pageinfo.getTotalpage : " + PageInfo.getTotalpage());

		
		ModelAndView mav = new ModelAndView("board/list");
		mav.addObject("mainData", mapper.ntlist2(vo));
		return mav;		
		
	}
	
	
	@RequestMapping("/board/detail")
	ModelAndView detail(NoticeVO vo) {
		
		ModelAndView mav = new ModelAndView("board/detail");
		mapper.addCount(vo);
		mav.addObject("mainData", mapper.ntDetail(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/writeForm")
	String writeForm() {
		
		return "board/writeForm";			
	}
	
	
	@RequestMapping("/board/writeReg")
	ModelAndView writeReg(HttpServletRequest request, NoticeVO vo) {
		
		ArrayList<String> imgExt = new ArrayList<>();
        imgExt.add("image/jpeg");
        imgExt.add("image/jpg");
        imgExt.add("image/gif");
        imgExt.add("image/png");
        imgExt.add("image/bmp");
		
		ModelAndView mav = new ModelAndView("alert");
		
		if(!vo.getFile1().getOriginalFilename().trim().equals("")) {			
			
			if(!imgExt.contains(vo.getFile1().getContentType().toLowerCase().trim())) {
			     mav.addObject("msg", "이미지 파일만 업로드 해주세요");
			     mav.addObject("url", "list");
			     return mav;
		    }			

			fileUpload(request, vo.getFile1());				
			vo.setFile_1_str(vo.getFile1().getOriginalFilename());
		}		
		
		
		int cnt = mapper.ntinsert(vo);
		System.out.println("writeReg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/board/list");
		return mav;		
		
	}
	
	@RequestMapping("/board/modifyForm")
	ModelAndView modifyForm(NoticeVO vo) {
		
		ModelAndView mav = new ModelAndView("board/modifyForm");
		mav.addObject("mainData", mapper.ntDetail(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/modifyReg")
	ModelAndView modifyReg(NoticeVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.ntModify(vo);
		System.out.println("writeReg cnt : " + cnt);
		mav.addObject("msg", "수정되었습니다.");
		mav.addObject("url", "detail?notno="+vo.getNotno());
		return mav;		
		
	}
	
	@RequestMapping("/board/delete")
	ModelAndView deleteForm(NoticeVO vo, HttpSession session) {		
		
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
		
		int cnt = mapper.ntDelete(vo);
		System.out.println("deleteReg cnt : " + cnt);

		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "list");
		return mav;					
	}
	
	
	
	
	
	
	
	
	
	void fileUpload(HttpServletRequest request, MultipartFile ff) {
		String path = request.getRealPath("/up");
		
		try {
			FileOutputStream fos = new FileOutputStream(path+"/"+ff.getOriginalFilename());
			fos.write(ff.getBytes());
			fos.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
		
	}
	
}
