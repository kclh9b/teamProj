package dog.domain.board;

import java.sql.Date;

import lombok.Data;

@Data
public class CommentVO {

	int qnano,comno;
	
	Date regdate;
	
	String content,available;
	
}
