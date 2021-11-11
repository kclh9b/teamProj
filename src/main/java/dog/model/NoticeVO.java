package dog.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class NoticeVO extends PageInfoCHS {

	String uid,title,content,category,available, file_1_str, sch;
	
	int notno,views;
	
	Date regdate;
	
	MultipartFile file1;
	
}
