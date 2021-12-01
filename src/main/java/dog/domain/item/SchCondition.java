package dog.domain.item;

import lombok.Data;

@Data
public class SchCondition {

	String cate, schKind, keyword, min, max, order, fur, size, age, weight;
	
	public String getCate() {
		
		if(cate!=null) {
			if(cate.equals("")) {
				cate = null;
			}
		}
		
		return cate;
		
	}
	
	public String getSchKind() {
		
		if(schKind !=null) {
			if(schKind.equals("")) {
				schKind = null;
			}			
		}
		
		return schKind;
		
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
	
}
