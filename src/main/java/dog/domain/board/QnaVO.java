package dog.domain.board;

import java.sql.Date;
import java.util.List;

import lombok.Data;

@Data
public class QnaVO extends PageInfoCHS {

	int qnano,ino;
	
	String title, content, uid, sch, schid, available, open;
	
	Date regdate;
	
	List<CommentVO> qncm;

	
	String getSchid() {
		
		if(schid!=null) {
			if(schid.equals("")) {
				return null;
			}
		}
		
		return this.schid;
	}
	
}
