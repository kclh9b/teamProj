package dog.domain.item;

import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;
import dog.domain.board.mapper.CommentMapp;
import dog.domain.board.mapper.QnaMapp;
import dog.domain.board.mapper.ReviewMapp;
import dog.domain.board.mapper.ReviewReplyMapp;
import dog.domain.item.mapper.ItemMapper;
import lombok.RequiredArgsConstructor;
import lombok.extern.slf4j.Slf4j;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

@Slf4j
@RequiredArgsConstructor
@Service
public class ItemServiceImpl implements ItemService{

    private final ReviewMapp rvmapper;
    private final ReviewReplyMapp rvrpmapp;
    private final QnaMapp qnmapper;
    private final CommentMapp cmmapp;
    private final ItemMapper im;

    public ItemMapper getIm() {
        return im;
    }

    //어드민 ==============================================================
    @Override
    public ModelAndView save(HttpServletRequest request , ItemVO vo) {

        ModelAndView mav = new ModelAndView("alert");

        vo.setMain_img(vo.getMfile().getOriginalFilename());
        vo.setDetail_img(vo.getDfile().getOriginalFilename());

        if(checkExtension(vo)) {
            mav.addObject("msg", "등록 실패 이미지 파일만 업로드 해주세요");
            mav.addObject("url", "productlist");
            return mav;
        }

        fileUpload(request, vo.getMfile());
        fileUpload(request, vo.getDfile());

        int cnt = im.save(vo);
        System.out.println("itemSave cnt :"+cnt);

        mav.addObject("msg", "등록되었습니다");
        mav.addObject("url", "productlist");
        log.info("{} 등록", vo.getName());

        return mav;
    }

    @Override
    public int checkName(ItemVO vo) throws Exception {
        return im.ckname(vo);
    }

    @Override
    public ModelAndView modi(ItemVO vo) {
        ModelAndView mav = new ModelAndView("alert");
        int cnt = im.modi(vo);
        System.out.println("itemModi cnt :"+cnt);
        mav.addObject("msg", "수정되었습니다");
        mav.addObject("url", "productdetail?ino="+vo.getIno());
        log.info("{} 수정", vo.getName());

        return mav;
    }

    @Override
    public ItemVO adminGetItem(ItemVO vo) {
        ModelAndView mav = new ModelAndView("product/productdetail");
        mav.addObject("pro", im.adminGetItem(vo));
        return vo;
    }

    @Override
    public ModelAndView adminGetItems(ItemVO vo, HttpSession session, PageInfo pageInfo) {
        ModelAndView mav = new ModelAndView("product/productlist");
        String uid = (String)session.getAttribute("uid");
        if(!uid.equals("admin")) {
            ModelAndView alert = new ModelAndView("alert");
            alert.addObject("msg", "접근 권한이 없습니다");
            alert.addObject("url", "/");
            return alert;
        }
        mav.addObject("pro", im.adminGetItems(vo));
        pageInfo.setTotal(im.itemCnt(vo));
        return mav;
    }

    @Override
    public ModelAndView delete(ItemVO vo) {
        ModelAndView mav = new ModelAndView("alert");
        int cnt = im.delete(vo);
        System.out.println("deleteReg cnt :"+cnt);
        mav.addObject("msg", "삭제되었습니다");
        mav.addObject("url", "productlist");
        log.info("{} 삭제", vo.getName());

        return mav;
    }
    //어드민 ==============================================================


    @Override
    public String getItems(Model mm, SchCondition sc, HttpSession session,
                           @RequestParam(value="custom", defaultValue="") String custom, @RequestParam(value="onNav", defaultValue="") String onNav) {
        Map<String, Object> para = new HashMap<>();
        para.put("cate", sc.getCate());
        para.put("schKind",sc.getSchKind());
        para.put("keyword",sc.getKeyword());
        para.put("min", sc.getMin());
        para.put("max", sc.getMax());
        para.put("order", sc.getOrder());
        para.put("fur", sc.getFur());
        para.put("size", sc.getSize());
        para.put("age", sc.getAge());
        para.put("page", sc.getPage()-1);
        para.put("limit", sc.getLimit());

        String url1 = "";
        if(custom.equals("y")) {
            url1 = "custom.jsp";
            mm.addAttribute("url1", url1);
        }else {
            url1 = "dummy.jsp";
            mm.addAttribute("url1", url1);
        }
        String url2 = "";
        if(onNav.equals("y")) {
            String cateNum = sc.getCate().substring(0,1);
            switch(cateNum) {
                case "1" :
                    url2 = "food.jsp";
                    mm.addAttribute("url2", url2);
                    break;
                case "2" :
                    url2 = "care.jsp";
                    mm.addAttribute("url2", url2);
                    break;
                case "3" :
                    url2 = "toy.jsp";
                    mm.addAttribute("url2", url2);
                    break;
                case "4" :
                    url2 = "outdoor.jsp";
                    mm.addAttribute("url2", url2);
                    break;
            }
        }else if(onNav.equals("n")) {
            url2 = "search.jsp";
            mm.addAttribute("url2", url2);
        }
        mm.addAttribute("onNav", onNav);

        if(session.getAttribute("uid")!=null) {
            mm.addAttribute("furData", session.getAttribute("fur"));
            mm.addAttribute("sizeData", session.getAttribute("size"));
            mm.addAttribute("ageData", session.getAttribute("age"));
            mm.addAttribute("weightData", session.getAttribute("weight"));
        }
        if(sc.getFur()!=null) {
            if(sc.getFur().equals("n")) {
                para.put("fur", "");
            }
            mm.addAttribute("furData", sc.getFur());
        }
        if(sc.getSize()!=null) {
            if(sc.getSize().equals("n")) {
                para.put("size", "");
            }
            mm.addAttribute("sizeData", sc.getSize());
        }
        if(sc.getAge()!=null) {
            if(sc.getAge().equals("n")) {
                para.put("age", "");
            }
            mm.addAttribute("ageData", sc.getAge());
        }


        //페이징=================================
        sc.setTotal(im.getItemCnt(para));

        mm.addAttribute("pageCnt", (int)Math.ceil(sc.getTotal()/20.0));


        if(sc.getPage()!=null) {
            para.put("page", (sc.getPage()-1)*20);
        }

        mm.addAttribute("itemList", im.itemList(para));

        mm.addAttribute("custom", custom);


        System.out.println("itemlist/~진입");

        return "item/itemList";
    }

    @Override
    public String getItem(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2) {
        String id = (String)session.getAttribute("uid");
        mm.addAttribute("item", im.itemDetail(iv));
        mm.addAttribute("id", id);
        mm.addAttribute("black", session.getAttribute("black"));

        List<ReviewVO> reList = rvmapper.bringrv(vo1);
        for (ReviewVO reviewVO : reList) {
            reviewVO.setRvrp(rvrpmapp.bringrvrp(reviewVO));
        }
        mm.addAttribute("rv", reList);

        List<QnaVO> qnlist = qnmapper.bringqn(vo2);
        for (QnaVO qnaVO : qnlist) {
            qnaVO.setQncm(cmmapp.bringcm(qnaVO));
        }
        mm.addAttribute("rp", qnlist);
        return "item/item";
    }

    @Override
    public ArrayList<RecItemVO> getRecItems(Model mm) {
        ArrayList<RecItemVO> arr = im.getRecInos();
        mm.addAttribute("recList", im.recItemAllList());
        mm.addAttribute("inos", im.getInos());
        mm.addAttribute("recinos", arr);
        return arr;
    }

    @Override
    public RecItemList modiRecItems(Model mm, RecItemList ril) {
        int result = im.updateRecInos(ril.getArr());
        if(result!=0) {
            mm.addAttribute("msg", "변경되었습니다.");
            mm.addAttribute("url", "/adminRecommend");
        }
        return ril;
    }

    Boolean checkExtension(ItemVO vo) {
        ArrayList<String> imgExt = new ArrayList<>();
        imgExt.add("image/jpeg");
        imgExt.add("image/jpg");
        imgExt.add("image/gif");
        imgExt.add("image/png");
        imgExt.add("image/bmp");

        if(!imgExt.contains(vo.getMfile().getContentType().toLowerCase().trim())
                || !imgExt.contains(vo.getDfile().getContentType().toLowerCase().trim())) {
            return true;
        }else {
            return false;
        }
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
