package dog.model;

import lombok.Data;

@Data
public class SchCondition {

	String cate, schkind, keyword, min, max, order, fur, size, age, weight;
	
	Integer page=1, total, limit = 20, pageLimit = 5;
	
	public String getCate() {
		
		if(cate!=null) {
			if(cate.equals("")) {
				cate = null;
			}			
		}
		
		return cate;
		
	}
	
	public String getSchkind() {
		
		if(schkind!=null) {
			if(schkind.equals("")) {
				schkind = null;
			}			
		}
		
		return schkind;
		
	}
	
	public String getKeyword() {
		
		if(keyword!=null) {
			if(keyword.equals("")) {
				keyword = null;
			}			
		}
		
		return keyword;
		
	}
	
	
	
	public String getMin() {
		
		if(min!=null) {
			if(min.equals("")) {
				min = null;
			}			
		}
		
		return min;
		
	}
	
	public String getMax() {
		
		if(max!=null) {
			if(max.equals("")) {
				max = null;
			}			
		}
		
		return max;
		
	}
	
	public String getOrder() {
		
		if(order!=null) {
			if(order.equals("")) {
				order = null;
			}			
		}
		
		return order;
		
	}
	
	public String getFur() {
		
		if(fur!=null) {
			if(fur.equals("")) {
				fur = null;
			}			
		}
		
		return fur;
		
	}
	
	public String getSize() {
		
		if(size!=null) {
			if(size.equals("")) {
				size = null;
			}			
		}
		
		return size;
		
	}
	
	public String getAge() {
		
		if(age!=null) {
			if(age.equals("")) {
				age = null;
			}			
		}
		
		return age;
		
	}
	
	public String getWeight() {
		
		if(weight!=null) {
			if(weight.equals("")) {
				weight = null;
			}			
		}
		
		return weight;
		
	}
	

	
	//페이징==============================
	public int getTotalPage() {
		
		int res = total/limit;
		
		if(total%limit > 0) {
			res++;
		}
		
		return res;
	}
	
	
	public int getStart() {
		

		return (page-1)*limit;
	}
	
	public int getStartPage() {
		return (page-1)/pageLimit*pageLimit+1;
	}
	
	public int getEndPage() {
		
		int res = getStartPage()+pageLimit-1;
		
		if(res>getTotalPage()) {
			res = getTotalPage();
		}
		
		return res;
	}
	
}
