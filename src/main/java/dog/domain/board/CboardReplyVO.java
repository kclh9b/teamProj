package dog.domain.board;

import java.sql.Date;

import lombok.Data;

@Data
public class CboardReplyVO {

	int comuno,repno;
	
	String content, available, uid;
	
	Date regdate;
	
}
