package dog.model;

import lombok.Data;

@Data
public class CartItemVO {
	Integer ino, quantity, price, calprice, totalPrice;
	String cno, name, main_img;
}
