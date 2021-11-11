package dog.control;

import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import dog.mapper.DogMapp;
import dog.model.ItemVO;
import dog.model.PageInfo;

@Controller
public class ProductController {

	@Resource
	DogMapp mapper;
	
	@RequestMapping("/product/productlist")
	ModelAndView productlist(ItemVO vo, HttpSession session, PageInfo pageInfo) {
		
		ModelAndView mav = new ModelAndView("product/productlist");
		
		String uid = (String)session.getAttribute("uid");
		if(!uid.equals("admin")) {
			ModelAndView alert = new ModelAndView("alert");
			alert.addObject("msg", "접근 권한이 없습니다");
			alert.addObject("url", "/");
			return alert;
		}
		mav.addObject("pro", mapper.productList(vo));
		
		pageInfo.setTotal(mapper.productTotal(vo));
		System.out.println("pageInfo : "+pageInfo);
		System.out.println("pageInfo.getTotalPage() : "+pageInfo.getTotalPage());
		
		return mav;
	}
	
	@RequestMapping("/product/productdetail")
	ModelAndView productdetail(ItemVO vo) {
		
		ModelAndView mav = new ModelAndView("product/productdetail");
		mav.addObject("pro", mapper.productDetail(vo));
		
		return mav;
	}
	
	@RequestMapping("/product/productForm")
	String productForm() {
		
		return "product/productForm";
	}
	
	@RequestMapping("/product/productReg")
	ModelAndView productregister(HttpServletRequest request ,ItemVO vo) {
		
		ArrayList<String> imgExt = new ArrayList<>();
		imgExt.add("image/jpeg");
		imgExt.add("image/jpg");
		imgExt.add("image/gif");
		imgExt.add("image/png");
		imgExt.add("image/bmp");
		
		ModelAndView mav = new ModelAndView("alert");
		
		
		vo.setMain_img(vo.getMfile().getOriginalFilename());
		vo.setDetail_img(vo.getDfile().getOriginalFilename());	
		
		if(!imgExt.contains(vo.getMfile().getContentType().toLowerCase().trim())
		|| !imgExt.contains(vo.getDfile().getContentType().toLowerCase().trim())) {
			mav.addObject("msg", "등록 실패 이미지 파일만 업로드 해주세요");
			mav.addObject("url", "productlist");
			return mav;
		}
		
		fileUpload(request, vo.getMfile());
		fileUpload(request, vo.getDfile());
		
		int cnt = mapper.productInsert(vo);
		System.out.println("productReg cnt :"+cnt);		
		
		mav.addObject("msg", "등록되었습니다");
		mav.addObject("url", "productlist");
		
		return mav;
	}
	
	@RequestMapping("/product/productmodifyForm")
	ModelAndView productmodifyform(ItemVO vo) {
		
		ModelAndView mav = new ModelAndView("product/productmodifyForm");
		mav.addObject("pro", mapper.productDetail(vo));
		return mav;
	}
	
	@RequestMapping("/product/productmodifyReg")
	ModelAndView productmodifyreg(ItemVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.productModify(vo);
		System.out.println("productmodifyReg cnt :"+cnt);
		mav.addObject("msg", "수정되었습니다");
		mav.addObject("url", "productdetail?ino="+vo.getIno());
		
		return mav;
	}
	
	@RequestMapping("/product/productdeleteReg")
	ModelAndView productdeleteReg(ItemVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.productDelete(vo);
		System.out.println("deleteReg cnt :"+cnt);
		mav.addObject("msg", "삭제되었습니다");
		mav.addObject("url", "productlist");
		
		return mav;
	}
	
	@RequestMapping("/product/productreceive")
	ModelAndView productreceive(ItemVO vo) {
		
		ModelAndView mav = new ModelAndView("product/productreceive");
		mav.addObject("receiveitem", mapper.productDetail(vo));
		
		return mav;
	}
	
	@RequestMapping("/product/receiveReg")
	ModelAndView receiveReg(ItemVO vo) {
		
		ModelAndView mav = new ModelAndView("alert");
		int cnt = mapper.productReceive(vo);
		System.out.println("receiveReg cnt :"+cnt);
		
		mav.addObject("msg", "입고되었습니다");
		mav.addObject("url", "productdetail?ino="+vo.getIno());
		
		return mav;
	}
	
	@ResponseBody
    @RequestMapping(value="/nameck")
    public int nameck(ItemVO vo) throws Exception {

        int result = mapper.ckname(vo);
        return result;
    }
	
	String fileUpload(HttpServletRequest request, MultipartFile ff) {
		
		String res = ff.getOriginalFilename();
		int pos = res.lastIndexOf(".");
		String fName = res.substring(0,pos);
		String ext = res.substring(pos);
		System.out.println(fName);
		System.out.println(ext);
		int cnt = 1;
		
		String path = request.getRealPath("/up/item")+"/";
		
		System.out.println(path);
		
		File file = new File(path+res);
		while(file.exists()) {
			System.out.println("파일 존재");
			
			res = fName+"_"+cnt+ext;
			cnt++;
			
			System.out.println(res);
			
			file = new File(path+res);
		}
		
		
		try {
			FileOutputStream fos = new FileOutputStream(path+res);
			fos.write(ff.getBytes());
			fos.close();
			
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		return res;
	}
	
	
	
	
}
