package dog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class OrderitemVO {
	
Date regdate;
	
	String name, oino, main_img, itemstate, refund, refundcnt;
	
	Integer quantity, calprice, totalPrice, ino, refundprice;
	
}