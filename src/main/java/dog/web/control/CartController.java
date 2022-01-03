package dog.web.control;

import dog.domain.cart.CartItemList;
import dog.domain.cart.CartService;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

@Controller
public class CartController {

    @Autowired
    CartService csi;

    @GetMapping("/cart/add")
    String addCart() {
        System.out.println("addCart 진입");
        return "thymeleaf/cart/result";
    }

    @PostMapping("/cart/add")
    String addCartAction(HttpSession session, CartItemList cil, Model mm) {
        if(csi.addCart(session, cil, mm)!=0) {
            return "cart/result";
        }
        return "alert";
    }

    @GetMapping("/cart")
    String myCart(HttpSession session,  Model mm) {
        csi.getCart(session, mm);
        return "thymeleaf/cart/myCart";
    }

    @PostMapping("cart/update")
    String delCart(HttpSession session, Model mm, CartItemList cil,
                   @RequestParam("action") String action,
                   @RequestParam(value="ino", defaultValue="") String ino,
                   @RequestParam(value="add", defaultValue="") String add) {
        return csi.updateCart(session, mm, cil, action, ino, add);
    }
}
