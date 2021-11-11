package dog.model;

import java.sql.Date;

import lombok.Data;

@Data
public class FaqVO extends PageInfoCHS {

	String uid,title,content,category,sch;
	
	int faqno;
	
	Date regdate;
	
}
