package dog.domain.item;

import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import java.util.List;

public interface ItemService {
    //어드민 ==============================================================
    ItemVO save(HttpServletRequest request , Model mm, ItemVO vo);
    int checkName(ItemVO vo) throws Exception;
    ItemVO modi(Model mm, ItemVO vo);
    ItemVO delete(Model mm, ItemVO vo);
    List<ItemVO> adminGetItems(HttpSession session, Model mm, ItemVO vo, PageInfo pageInfo);
    ItemVO adminGetItem(Model mm, ItemVO vo);
    //어드민 ==============================================================


    List<ItemVO> getItems(Model mm, SchCondition sc, HttpSession session,
                           @RequestParam(value="custom", defaultValue="") String custom,
                           @RequestParam(value="onNav", defaultValue="") String onNav,
                          PageInfo pageInfo);
    ItemVO getItem(Model mm, ItemVO iv, HttpSession session, ReviewVO vo1 , QnaVO vo2);



    //추천 상품
    List<RecItemVO> getRecItems(Model mm);
    RecItemList modiRecItems(Model mm, RecItemList ril);
}
