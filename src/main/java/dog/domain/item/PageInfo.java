package dog.domain.item;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "pageInfo")
public class PageInfo {

	int total, limit = 20, pageLimit = 5, nowPage = 1;
	
	public int getTotalPage() {
		
		int res = total/limit; 
		
		if(total%limit > 0) {
			res++;
		}
		
		return res; 
	}
	
	public int getStart() {
		
		return (nowPage-1)*limit; 
	}
	
	public int getStartPage() {
		return (nowPage-1)/pageLimit*pageLimit+1;
	}
	
	public int getEndPage() {
		
		int res = getStartPage()+pageLimit-1;
		
		if(res>getTotalPage() ) {
			res = getTotalPage();
		}
		
		return res;
	}
	
	
}
