package dog.domain.cart;

import dog.domain.cart.mapper.CartMapper;
import dog.domain.member.MemberVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.HashMap;
import java.util.Map;

@Service
public class CartServiceImpl implements CartService{

    @Autowired
    CartMapper cm;

    @Override
    public void getCart(HttpSession session,  Model mm) {
        System.out.println("myCart 진입");
        MemberVO mv = new MemberVO();
        mv.setUid((String)session.getAttribute("uid"));

        mm.addAttribute("cl", cm.getCartList(mv));
        mm.addAttribute("black", session.getAttribute("black"));
    }

    @Override
    public int addCart(HttpSession session, CartItemList cil, Model mm) {
        System.out.println("addCartAction 진입");
        Map<String, Object> map = new HashMap<>();
        MemberVO mv = new MemberVO();
        mv.setUid((String)session.getAttribute("uid"));
        map.put("mv", mv);
        map.put("iv", cil.getArr().get(0));

        if(cm.checkCartItem(map)==null) {
            if(cm.addCartItem(map)==1) {
                return 1;
            }
        }else {
            if(cm.addUpdateCartItem(map)==1) {
                return 1;
            }
        }
        return 0;
    }

    @Override
    public String updateCart(HttpSession session, Model mm, CartItemList cil,
                          @RequestParam("action") String action,
                          @RequestParam(value="ino", defaultValue="") String ino,
                          @RequestParam(value="add", defaultValue="") String add) {
        System.out.println("updateCart 진입");
        MemberVO mv = new MemberVO();
        mv.setUid((String)session.getAttribute("uid"));
        Map<String, Object> map = new HashMap<>();
        map.put("mv", mv);
        if(action.equals("1")) {
            map.put("list", cil.getArr());
            if(cm.delCartItem(map)!=0) {
                mm.addAttribute("msg", "삭제되었습니다.");
                mm.addAttribute("url", "/mypage/cart");
            }
        }else if(action.equals("2")) {
            if(cm.delAllCartItem(mv)!=0) {
                mm.addAttribute("msg", "삭제되었습니다.");
                mm.addAttribute("url", "/mypage/cart");
            }
        }else if(action.equals("3")) {
            map.put("ino", ino);
            map.put("add", add);
            if(cm.updateCartItem(map)!=0) {
                mm.addAttribute("url", "/mypage/cart");
                return "redirect:mypage/cart";
            }else {
                mm.addAttribute("msg", "업데이트 실패.");
                mm.addAttribute("url", "/mypage/cart");
            }
        }
        return "alert";
    }
}
