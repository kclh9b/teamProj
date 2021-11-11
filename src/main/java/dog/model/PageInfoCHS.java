package dog.model;

import org.apache.ibatis.type.Alias;

import lombok.Data;

@Data
@Alias(value = "pageInfoCHS")
public class PageInfoCHS {
//	 한페이지에 게시글 , 페이지 제한
int total, limit=10, pageLimit=4, nowPage=1;


public int getTotalpage() {

int res = total/limit;

if(total%limit>0) {
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

if(res>getTotalpage()) {
	res=getTotalpage();
}

return res;		
}


}
