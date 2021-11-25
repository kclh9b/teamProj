package dog.domain.board;

import java.sql.Date;

import lombok.Data;

@Data
public class ReviewReplyVO {

	int revno,repno;
	
	String content, available, uid;
	
	Date regdate;
	
}
