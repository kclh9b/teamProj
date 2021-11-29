package dog.domain.item;

import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public interface ItemService {
    //어드민 ==============================================================
    public ModelAndView save(HttpServletRequest request , ItemVO vo);
    public int checkName(ItemVO vo) throws Exception;
    public ModelAndView modi(ItemVO vo);
    public ModelAndView adminGetItems(ItemVO vo, HttpSession session, PageInfo pageInfo);
    public ItemVO adminGetItem(ItemVO vo);
    public ModelAndView delete(ItemVO vo);
    //어드민 ==============================================================


    public String getItems(Model mm, SchCondition sc, HttpSession session,
                           @RequestParam(value="custom", defaultValue="") String custom,
                           @RequestParam(value="onNav", defaultValue="") String onNav);
    public String getItem(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2);



    //추천 상품
    public ArrayList<RecItemVO> getRecItems(Model mm);
    public RecItemList modiRecItems(Model mm, RecItemList ril);
}
