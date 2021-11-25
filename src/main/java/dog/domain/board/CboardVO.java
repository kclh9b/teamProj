package dog.domain.board;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CboardVO extends PageInfoCHS {

	int comuno, views;

	String uid, title, content, available,category,file_1_str,file_2_str,file_3_str, sch;
	
	Date regdate;
	
	MultipartFile file1,file2,file3;
	
}
