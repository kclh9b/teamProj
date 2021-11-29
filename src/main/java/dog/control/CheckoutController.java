package dog.control;

import dog.domain.cart.CartItemList;
import dog.domain.checkout.CheckoutService;
import dog.domain.member.MemberVO;
import dog.domain.order.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class CheckoutController {

    @Autowired
    CheckoutService cosi;

    @RequestMapping("/checkout")
    String checkoutForm(HttpSession session, CartItemList il, Model mm, @RequestParam("state") String state) {
        cosi.getCheckoutInfo(session, il, mm, state);
        return "item/checkout";
    }

    @RequestMapping(value="/checkoutAction", method= RequestMethod.POST)
    String checkoutAction(HttpSession session, CartItemList il, @RequestParam("state") String state,
                          MemberVO mv, OrderVO ov, Model mm) {
        cosi.checkout(session, il, state, mv, ov, mm);
        return "alert";
    }

    @RequestMapping("/checkoutResult")
    String checkoutResult() {
        return "item/checkoutResult";
    }
}
