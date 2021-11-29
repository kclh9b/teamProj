package dog.domain.checkout;

import dog.domain.cart.CartItemList;
import dog.domain.cart.CartItemVO;
import dog.domain.checkout.mapper.CheckoutMapper;
import dog.domain.member.MemberVO;
import dog.domain.order.OrderVO;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;

public interface CheckoutService {

    public void getCheckoutInfo(HttpSession session, CartItemList il, Model mm, @RequestParam("state") String state);
    public void checkout(HttpSession session, CartItemList il, @RequestParam("state") String state,
                         MemberVO mv, OrderVO ov, Model mm);

}
