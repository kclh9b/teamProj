package dog.domain.order;

import java.sql.Date;

import dog.domain.item.PageInfo;
import lombok.Data;

@Data
public class OrderVO extends PageInfo {

	Integer price, delifee;
	
	String ono, oino, uid, dno, dstate, address1, address2, phn, payway, paystate, etc, sch, searchType, itemstate, reciever, cardNum, day;
	
	Date regdate, canceldate, refunddate, refundokdate;
	
}