package dog.domain.checkout;

import dog.domain.cart.CartItemList;
import dog.domain.cart.CartItemVO;
import dog.domain.cart.mapper.CartMapper;
import dog.domain.checkout.mapper.CheckoutMapper;
import dog.domain.member.mapper.MemberMapp;
import dog.domain.member.MemberVO;
import dog.domain.order.OIListVO;
import dog.domain.order.OrderVO;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestParam;

import javax.servlet.http.HttpSession;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.Map;

@Service
public class CheckoutServiceImpl implements CheckoutService{

    @Autowired
    private CartMapper cartM;

    @Autowired
    private MemberMapp memberM;

    @Autowired
    private CheckoutMapper com;

    @Override
    public void getCheckoutInfo(HttpSession session, CartItemList il, Model mm, @RequestParam("state") String state) {
        Map<String, Object> map = new HashMap<>();
        MemberVO mv = new MemberVO();
        mv.setUid((String)session.getAttribute("uid"));
        mv = memberM.mmListOne(mv);
        map.put("mv", mv);
        map.put("list", il.getArr());
        mm.addAttribute("mv", mv);
        ArrayList<CartItemVO> arr = null;
        int allPrice = 0;
        int delifee = 2500;
        if(state.equals("1")) {
            CartItemVO item = il.getArr().get(0);
            item.setTotalPrice(item.getCalprice() * item.getQuantity());
            arr = il.getArr();
        }else if(state.equals("2")) {
            arr = cartM.getItemCheckout(map);
        }
        for(int i=0; i<arr.size(); i++) {
            allPrice += arr.get(i).getTotalPrice();
        }
        if(allPrice>=20000) {
            delifee = 0;
        }
        mm.addAttribute("list", arr);
        int endPrice = allPrice + delifee;
        mm.addAttribute("allPrice", allPrice);
        mm.addAttribute("delifee", delifee);
        mm.addAttribute("endPrice", endPrice);
    }

    @Override
    public void checkout(HttpSession session, CartItemList il, String state, MemberVO mv, OrderVO ov, Model mm) {
        String url = "checkoutResult";
        System.out.println("checkoutAction 진입");

        Map<String, Object> map = new HashMap<>();
        map.put("mv", mv);
        map.put("list", il.getArr());
        if(state.equals("1")) {
            if(checkout(com, state, mv, il.getArr(), ov)!=0) {
                System.out.println("성공~");
                mm.addAttribute("msg", "결제되었습니다.");
                mm.addAttribute("url", "/checkoutResult");
            }else {
                mm.addAttribute("msg", "결제에 실패했습니다.");
                mm.addAttribute("url", "/board/list");
            }
        }else if(state.equals("2")) {
            if(checkout(com, state, mv, cartM.getItemCheckout(map), ov)!=0) {
                System.out.println("성공~");
                mm.addAttribute("msg", "결제되었습니다.");
                mm.addAttribute("url", "/checkoutResult");
            }else {
                mm.addAttribute("msg", "결제에 실패했습니다.");
                mm.addAttribute("url", "/board/list");
            }
        }
    }


    //결제 로직
    int checkout(CheckoutMapper cm, String state, MemberVO mv, ArrayList<CartItemVO> il, OrderVO ov) {
        String oino = addOIList(cm, mv);
        if(addOrderItem(cm, mv, oino, il)!=0) {
            if(addOrder(cm, mv, il, ov, oino)!=0) {
                if(updateItem(cm,il)!=0) {
                    if(state.equals("2")) {
                        if(delCartItem(cm, mv, il) !=0) {
                            return 1;
                        }
                    }
                    return 1;
                }
            }
        }
        return 0;
    }

    String addOIList(CheckoutMapper cm, MemberVO mv) {
        String oino = "";
        String nowday = cm.getDate();
        Map<String, Object> map = new HashMap<>();
        map.put("mv", mv);

        String nowday2 = nowday.substring(6, 8);
        nowday = nowday.substring(2, 8);

        OIListVO oil = cm.getLastOINO();
        if(oil==null) {
            System.out.println("OIList 추가 루트 탐");
            oino = nowday+"001";
            System.out.println("널일때 oino:"+oino);
            map.put("oino", oino);
            int result = cm.addOIList(map);
            if(result==1) {
                System.out.println("OIList 추가 성공");
            }
        }else {
            if(nowday2.equals(oil.getOino().substring(4, 6))) {
                String newOino = "";
                if(oil.getOino().charAt(6)!=0) {
                    newOino = String.format("%03d",(Integer.parseInt(oil.getOino().substring(6))+1));
                }
                else if(oil.getOino().charAt(7)!=0) {
                    newOino = String.format("%03d",(Integer.parseInt(oil.getOino().substring(7))+1));
                }else if(oil.getOino().charAt(8)!=0){
                    newOino = String.format("%03d",(Integer.parseInt(oil.getOino().substring(8))+1));
                }
                newOino = nowday + newOino;
                map.put("oino", newOino);


                int result = cm.addOIList(map);
                if(result==1) {
                    System.out.println("OIList 추가 성공");
                    return newOino;
                }

                System.out.println("번호 이어서 업데이트");
                return newOino;
            }else {
                System.out.println(nowday);
                System.out.println(oil.getOino());
                String newOino = nowday + "001";
                map.put("oino", newOino);

                int result = cm.addOIList(map);
                if(result==1) {
                    System.out.println("OIList 추가 성공");
                    return newOino;
                }

                System.out.println("당일 새로 생성");
                return newOino;
            }
        }

        return "none";
    }

    int addOrderItem(CheckoutMapper cm, MemberVO mv, String oino, ArrayList<CartItemVO> il) {

        Map<String, Object> map = new HashMap<>();

        map.put("oino", oino);
        map.put("mv", mv);
        map.put("list", il);
        int result = (cm.addOrderItem(map));
        if(result != 0) {
            return result;
        }

        return 0;
    }

    int delCartItem(CheckoutMapper cm, MemberVO mv, ArrayList<CartItemVO> il) {

        Map<String, Object> map = new HashMap<>();
        map.put("mv", mv);
        map.put("list", il);
        int result = (cm.delCartItem(map));
        if(result != 0) {
            return result;
        }
        return 0;
    }

    int updateItem(CheckoutMapper cm, ArrayList<CartItemVO> il) {

        int result = cm.updateItem(il);
        if(result!=0) {
            System.out.println("상품 업데이트 성공! : " + result);
            return result;
        }

        return 0;
    }

    int addOrder(CheckoutMapper cm, MemberVO mv, ArrayList<CartItemVO> il, OrderVO ov, String oino) {
        String nowday = cm.getDate().substring(0, 4);
        String ono = nowday+"-"+oino;
        ov.setOno(ono);
        System.out.println(ono);
        ov.setOino(oino);
        StringBuffer dno = new StringBuffer("");
        //배달번호 난수 생성
		/*
		for(int i=0; i<3; i++) {
			int temp = (int)((Math.random()*9000)+1000);
			if(i==0) {
				dno.append(temp);
			}else {
				dno.append("-"+temp);
			}
		}*/
        ov.setDno(dno.toString());

        Map<String, Object> map = new HashMap<>();
        map.put("mv", mv);
        map.put("ov", ov);
        int result = (cm.addOrder(map));
        if(result != 0) {
            return result;
        }

        return 0;
    }
}
