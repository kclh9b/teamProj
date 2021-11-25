package dog.domain.board;

import java.sql.Date;


import lombok.Data;

@Data
public class BoardVO {

	String title, pname, content, upfile, pw;
	
	Integer no, cnt, gno, level, seq;
	
	Date reg_date;
	
}
