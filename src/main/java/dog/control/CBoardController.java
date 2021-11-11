package dog.control;

import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.CBoardMapp;
import dog.mapper.CBoardReplyMapp;
import dog.model.CboardReplyVO;
import dog.model.CboardVO;
import dog.model.NoticeVO;
import dog.model.PageInfoCHS;

@Controller
public class CBoardController {

	@Resource
	CBoardMapp mapper;
	
	@Resource
	CBoardReplyMapp mapper2;
	
	@RequestMapping("/board/cblist")
	ModelAndView list(CboardVO vo, PageInfoCHS PageInfo) {
		
		//		페이징
		PageInfo.setTotal(mapper.bbTotal(vo));
		System.out.println("Pageinfo : " + PageInfo);
		System.out.println("Pageinfo.getTotalpage : " + PageInfo.getTotalpage());

		
		ModelAndView mav = new ModelAndView("board/cblist");
		mav.addObject("mainData", mapper.cblist2(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/cbdetail")
	ModelAndView detail(HttpSession session, CboardVO vo, CboardReplyVO vo1) {
		
		String user = (String)session.getAttribute("uid");
		
		ModelAndView mav = new ModelAndView("board/cbdetail");
		mapper.addCount(vo);
		mav.addObject("mainData", mapper.cbDetail(vo));
		mav.addObject("uid",user);
		mav.addObject("abc",mapper2.crplist(vo1));
		return mav;		
		
	}
	
	@RequestMapping("/board/writeCB")
	String writeForm() {
		
		return "board/writeCB";			
	}
	
	
	@RequestMapping("/board/writeCBreg")
	ModelAndView writeReg(HttpServletRequest request, CboardVO vo) {
		
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
		        mav.addObject("url", "cblist");
		         return mav;
		    }	  

			fileUpload(request, vo.getFile1());			
			vo.setFile_1_str(vo.getFile1().getOriginalFilename());
		  
		}
		
		if(!vo.getFile2().getOriginalFilename().trim().equals("")) {
			
			  if(!imgExt.contains(vo.getFile2().getContentType().toLowerCase().trim())) {
			        mav.addObject("msg", "이미지 파일만 업로드 해주세요");
			        mav.addObject("url", "cblist");
			         return mav;
		    }			  

			fileUpload(request, vo.getFile2());				
			vo.setFile_2_str(vo.getFile2().getOriginalFilename());
			  
		}
		
		if(!vo.getFile3().getOriginalFilename().trim().equals("")) {
			
			  if(!imgExt.contains(vo.getFile3().getContentType().toLowerCase().trim())) {
			        mav.addObject("msg", "이미지 파일만 업로드 해주세요");
			        mav.addObject("url", "cblist");
			         return mav;
			    }
				
				fileUpload(request, vo.getFile3());				
				vo.setFile_3_str(vo.getFile3().getOriginalFilename());
			  
			}
		
		int cnt = mapper.cbinsert(vo);
		System.out.println("writeCBreg cnt : " + cnt);
		mav.addObject("msg", "작성되었습니다.");
		mav.addObject("url", "/board/cblist");
		return mav;		
		
	}
	
	@RequestMapping("/board/modiCb")
	ModelAndView modifyForm(CboardVO vo) {
		
		ModelAndView mav = new ModelAndView("board/modiCb");
		mav.addObject("mainData", mapper.cbDetail(vo));
		return mav;		
		
	}
	
	@RequestMapping("/board/modiCBreg")
	ModelAndView modifyReg(CboardVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.cbModify(vo);
		System.out.println("modiCBreg cnt : " + cnt);
		mav.addObject("msg", "수정되었습니다.");
		mav.addObject("url", "cbdetail?comuno="+vo.getComuno());
		return mav;		
		
	}
	
	@RequestMapping("/board/delCb")
	ModelAndView deleteForm(CboardVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.cbDelete(vo);
		System.out.println("delCb cnt : " + cnt);

		
		mav.addObject("msg", "삭제되었습니다.");
		mav.addObject("url", "cblist");
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
