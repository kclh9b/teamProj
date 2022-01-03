package dog.domain.item;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ItemVO extends PageInfo {

	public ItemVO(Integer cateid, Integer price, Integer discount,
				  Integer quantity, String name, String origin, String manufac,
				  String main_img, String detail_img, String size, String fur, String age, String fatyn,
				  MultipartFile mfile, MultipartFile dfile) {
		this.ino = ino;
		this.cateid = cateid;
		this.price = price;
		this.discount = discount;
		this.calprice = calprice;
		this.quantity = quantity;
		this.name = name;
		this.origin = origin;
		this.manufac = manufac;
		this.main_img = main_img;
		this.detail_img = detail_img;
		this.size = size;
		this.fur = fur;
		this.age = age;
		this.fatyn = fatyn;
		this.gname = gname;
		this.sname = sname;
		this.mfile = mfile;
		this.dfile = dfile;
	}

	public ItemVO() {
	}

	Integer ino, cateid, price, discount, calprice, quantity, sellcnt, reviewcnt, reviewavg, qnacnt, r_cnt, recno;
	
	String name, origin, manufac, main_img, detail_img, size, fur, age, fatyn, available, gname, sname, sch, searchType, r_avg, day;
	
	Date regdate;
	
	MultipartFile mfile, dfile;
}
