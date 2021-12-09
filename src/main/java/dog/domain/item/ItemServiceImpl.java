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
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.io.File;
import java.io.FileOutputStream;
import java.util.*;

@Slf4j
@RequiredArgsConstructor
@Service
public class ItemServiceImpl implements ItemService{

    private final ReviewMapp rvmapper;
    private final ReviewReplyMapp rvrpmapp;
    private final QnaMapp qnmapper;
    private final CommentMapp cmmapp;
    private final ItemMapper im;


    //어드민 ==============================================================
    @Override
    public ItemVO save(HttpServletRequest request , Model mm, ItemVO vo) {

        ModelAndView mav = new ModelAndView("alert");

        vo.setMain_img(vo.getMfile().getOriginalFilename());
        vo.setDetail_img(vo.getDfile().getOriginalFilename());

        if(checkExtension(vo)) { //이미지 확장자가 아니라면
            mm.addAttribute("msg", "등록 실패 이미지 파일만 업로드 해주세요");
            mm.addAttribute("url", "/admin/item/save");
        }

        fileUpload(request, vo.getMfile());
        fileUpload(request, vo.getDfile());

        int cnt = im.save(vo);
        if(cnt!=0) {
            mm.addAttribute("msg", "등록되었습니다");
            mm.addAttribute("url", "/admin/item/" + vo.getIno());
            log.info("상품번호:{}, 상품명:\'{}\' 등록", vo.getIno(), vo.getName());
        }
        return vo;
    }

    @Override
    public int checkName(ItemVO vo) throws Exception {
        return im.ckname(vo);
    }

    @Override
    public ItemVO modi(Model mm, ItemVO vo) {
        int cnt = im.modi(vo);
        mm.addAttribute("msg", "수정되었습니다");
        mm.addAttribute("url", "/admin/item/" + vo.getIno());
        log.info("상품번호:{}, 상품명:\'{}\' 수정", vo.getIno(), vo.getName());

        return vo;
    }

    @Override
    public ItemVO delete(Model mm, ItemVO vo) {
        int cnt = im.delete(vo);
        vo = im.adminGetItem(vo);
        if(cnt!=0) {
            mm.addAttribute("msg", String.format("\'%s\' 상품이 삭제되었습니다", vo.getName()));
            mm.addAttribute("url", "/admin/item");
            log.info("상품번호:{}, 상품명:\'{}\' 삭제", vo.getIno(), vo.getName());
        }
        return vo;
    }

    @Override
    public List<ItemVO> adminGetItems(HttpSession session, Model mm, ItemVO vo, PageInfo pageInfo) {
        String uid = (String)session.getAttribute("uid");
        if(!uid.equals("admin")) {
            ModelAndView alert = new ModelAndView("alert");
            mm.addAttribute("msg", "접근 권한이 없습니다");
            mm.addAttribute("url", "/");
            return null;
        }
        List<ItemVO> items = im.adminGetItems(vo);
        mm.addAttribute("items", items);
        pageInfo.setTotal(im.itemCnt(vo));
        return items;
    }

    @Override
    public ItemVO adminGetItem(Model mm, ItemVO vo) {
        mm.addAttribute("item", im.adminGetItem(vo));
        return vo;
    }

    @Override
    public List<RecItemVO> getRecItems(Model mm) {
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

    //어드민 ==============================================================


    @Override
    public List<ItemVO> getItems(Model mm, SchCondition sc, HttpSession session,
                                 @RequestParam(value="custom", defaultValue="") String custom,
                                 @RequestParam(value="onNav", defaultValue="") String onNav,
                                 PageInfo pageInfo) {
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
        para.put("page", pageInfo.getPage()-1);
        para.put("limit", pageInfo.getLimit());

        String url1 = "";
        if(custom.equals("y")) {
            url1 = "sub_custom.jsp";
            mm.addAttribute("url1", url1);
        }else {
            url1 = "sub_dummy.jsp";
            mm.addAttribute("url1", url1);
        }
        String url2 = "";
        if(onNav.equals("y")) {
            String cateNum = sc.getCate().substring(0,1);
            switch(cateNum) {
                case "1" :
                    url2 = "sub_food.jsp";
                    mm.addAttribute("url2", url2);
                    break;
                case "2" :
                    url2 = "sub_care.jsp";
                    mm.addAttribute("url2", url2);
                    break;
                case "3" :
                    url2 = "sub_toy.jsp";
                    mm.addAttribute("url2", url2);
                    break;
                case "4" :
                    url2 = "sub_outdoor.jsp";
                    mm.addAttribute("url2", url2);
                    break;
            }
        }else if(onNav.equals("n")) {
            url2 = "sub_search.jsp";
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
        pageInfo.setTotal(im.getItemCnt(para));

        mm.addAttribute("pageCnt", (int)Math.ceil(pageInfo.getTotal()/(double)pageInfo.getLimit()));


        if(pageInfo.getPage()!=null) {
            para.put("page", (pageInfo.getPage()-1)*pageInfo.getLimit());
        }

        ArrayList<ItemVO> items = im.itemList(para);
        mm.addAttribute("itemList", items);
        mm.addAttribute("custom", custom);

        return items;
    }

    @Override
    public ItemVO getItem(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2) {
        String id = (String)session.getAttribute("uid");
        ItemVO vo = im.itemDetail(iv);
        mm.addAttribute("item", vo);
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
        return vo;
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
        }
        return false;

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
