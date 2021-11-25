package dog.domain.settle;

import lombok.Data;

@Data
public class SettleVO {

	String d, day, name, gname, sname;
	
	Integer pay, daypay, monpay, yearpay, cnt, quantity;
	
	/*
	String getDay() {
		if(day!=null) {
			if(day.equals("")) {
				return null;
			}
		}
		return this.day;
	}
	
	String getMonth() {
		if(month!=null) {
			if(month.equals("")) {
				return null;
			}
		}
		return this.month;
	}
	
	String getYear() {
		if(year!=null) {
			if(year.equals("")) {
				return null;
			}
		}
		return this.year;
	}
	
	String getStandard() {
		if(standard!=null) {
			if(standard.equals("")) {
				return null;
			}
		}
		return this.standard;
	}
	
	String getStart() {
		if(start!=null) {
			if(start.equals("")) {
				return null;
			}
		}
		return this.start;
	}
	
	String getEnd() {
		if(end!=null) {
			if(end.equals("")) {
				return null;
			}
		}
		return this.end;
	}
	*/

	
	
	
	
}
