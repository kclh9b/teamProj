package dog.model;
import java.util.Date;
import lombok.Data;

@Data
public class MemberVO {
	String uid, passwd , available, name, birth, address1, address2, phn, email, size, age, weight, fur, sch, searchType, black, day, zipcode;
	Date regdate;
	Integer warncnt, point, access; 
	char gender, fatyn;
	
}

