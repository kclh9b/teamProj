package dog.web.control;


import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dog.domain.board.mapper.ReviewMapp;
import dog.domain.board.mapper.ReviewReplyMapp;
import dog.domain.item.ItemVO;
import dog.domain.board.PageInfoCHS;
import dog.domain.board.ReviewVO;
import dog.domain.board.ReviewReplyVO;

@Controller
public class ReviewController {
	
	@Resource
	ReviewMapp mapper;
	
	@Resource
	ReviewReplyMapp mapper2;
	
	@RequestMapping("/board/review")
	ModelAndView list(ReviewVO vo, PageInfoCHS PageInfo) {
		
		//		페이징
		PageInfo.setTotal(mapper.bbTotal(vo));
		System.out.println("Pageinfo : " + PageInfo);
		System.out.println("Pageinfo.getTotalpage : " + PageInfo.getTotalpage());

		
		ModelAndView mav = new ModelAndView("board/review");
		mav.addObject("mainData", mapper.rvlist2(vo));
		return mav;		
		
	}
	
	
	@RequestMapping("/board/revDet")
	ModelAndView detail(HttpSession session, ReviewVO vo, ReviewReplyVO vo1) {
		
		
		String user = (String)session.getAttribute("uid");
		
		ModelAndView mav = new ModelAndView("board/revDet");
		mapper.addCount(vo);
		mav.addObject("mainData", mapper.revDetail(vo));
		mav.addObject("uid",user);
		mav.addObject("abc", mapper2.rrplist(vo1));
		return mav;		
		
	}
	
	@RequestMapping("/board/writeRev")
	ModelAndView writeForm(HttpSession session, ItemVO vo) {
				
		String user = (String)session.getAttribute("uid");
		ModelAndView mav = new ModelAndView("board/writeRev");
		mav.addObject("mainData", mapper.itemlist());
		mav.addObject("uid",user);
		return mav;			
		
	}
	
	
	@RequestMapping("/board/writeRevReg")
	ModelAndView writeReg(HttpServletRequest request, ReviewVO vo) {		
		
		ArrayList<String> imgExt = new ArrayList<>();
        imgExt.add("image/jpeg");
        imgExt.add("image/jpg");
        imgExt.add("image/gif");
        imgExt.add("image/png");
        imgExt.add("image/bmp");
		
		ModelAndView mav = new ModelAndView("alert");		
		
		if(!vo.getFile_1().getOriginalFilename().trim().equals("")) {
						
			  if(!imgExt.contains(vo.getFile_1().getContentType().toLowerCase().trim())) {
			        mav.addObject("msg", "이미지 파일만 업로드 해주세요");
			        mav.addObject("url", "/item/"+vo.getIno()+"#reviews");
			         return mav;
			    }			  

				fileUpload(request, vo.getFile_1());			
				vo.setFile1(vo.getFile_1().getOriginalFilename());
			  
			}
			
		if(!vo.getFile_2().getOriginalFilename().trim().equals("")) {
						
			  if(!imgExt.contains(vo.getFile_2().getContentType().toLowerCase().trim())) {
			        mav.addObject("msg", "이미지 파일만 업로드 해주세요");
			        mav.addObject("url", "/item/"+vo.getIno()+"#reviews");
			         return mav;
			    }
			  
			  fileUpload(request, vo.getFile_2());			
			  vo.setFile2(vo.getFile_2().getOriginalFilename());
			  
			}	
			
		if(!vo.getFile_3().getOriginalFilename().trim().equals("")) {
			
			  if(!imgExt.contains(vo.getFile_3().getContentType().toLowerCase().trim())) {
			        mav.addObject("msg", "이미지 파일만 업로드 해주세요");
			        mav.addObject("url", "/item/"+vo.getIno()+"#reviews");
			         return mav;
			    }			  

				fileUpload(request, vo.getFile_3());			
				vo.setFile3(vo.getFile_3().getOriginalFilename());
			  
			}	
		
				
		int cnt = mapper.revinsert(vo);
		System.out.println("writeRevReg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/item/"+vo.getIno()+"#reviews");
		return mav;		
		
	}	
	
	@RequestMapping("/board/revModi")
	ModelAndView modifyForm(ReviewVO vo) {
		
		ModelAndView mav = new ModelAndView("board/revModi");
		mav.addObject("mainData", mapper.revDetail(vo));
		mav.addObject("item", mapper.itemlist());
		return mav;		
		
	}
	
	@RequestMapping("/board/revModiReg")
	ModelAndView modifyReg(ReviewVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.revModify(vo);
		System.out.println("writeReg cnt : " + cnt);
		mav.addObject("msg", "수정되었습니다.");
		mav.addObject("url", "revDet?revno="+vo.getRevno());
		return mav;		
		
	}
	
	@RequestMapping("/board/deleteRev")
	ModelAndView deleteForm(ReviewVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.revDel(vo);
		System.out.println("deleteRev cnt : " + cnt);		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "review");
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
