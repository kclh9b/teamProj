package dog.domain.cart;

import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;

public interface CartService {
    public void getCart(HttpSession session,  Model mm);
    public int addCart(HttpSession session, CartItemList cil, Model mm);
    public String updateCart(HttpSession session, Model mm, CartItemList il,
                          @RequestParam("action") String action,
                          @RequestParam(value="ino", defaultValue="") String ino,
                          @RequestParam(value="add", defaultValue="") String add);
}
