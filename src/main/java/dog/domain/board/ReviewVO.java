package dog.domain.board;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReviewVO extends PageInfoCHS {

	int revno,ino,views,score;
	
	String uid,content,file1,file2,file3,available,sch,schid;
	
	Date regdate;
	
	MultipartFile file_1,file_2,file_3;
	
	
	List<ReviewReplyVO> rvrp;
	
	
	
	
	
	String getSchid() {
		
		if(schid!=null) {
			if(schid.equals("")) {
				return null;
			}
		}
		
		return this.schid;
	}
	
}
