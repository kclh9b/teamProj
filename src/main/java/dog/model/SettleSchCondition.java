package dog.model;

import lombok.Data;

@Data
public class SettleSchCondition {

	String day, month, year, standard, start, end, cateid, schKind, keyword;
	
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
	
	public String getCateid() {
		if(cateid!=null) {
			if(cateid.equals("")) {
				return null;
			}
		}
		return this.cateid;
	}
	
	public String getSchKind() {
		if(schKind!=null) {
			if(schKind.equals("")) {
				return null;
			}
		}
		return this.schKind;
	}
	
	
	
	public String getKeyword() {
		if(keyword!=null) {
			if(keyword.equals("")) {
				return null;
			}
		}
		return this.keyword;
	}
	
	
	
	
	
}
