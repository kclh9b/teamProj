package dog.domain.item;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ItemVO extends PageInfo {

	Integer ino, cateid, price, discount, calprice, quantity, sellcnt, reviewcnt, reviewavg, qnacnt, r_cnt, recno;
	
	String name, origin, manufac, main_img, detail_img, size, fur, age, fatyn, available, gname, sname, sch, searchType, r_avg, day;
	
	Date regdate;
	
	MultipartFile mfile, dfile;
}
