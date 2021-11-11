package dog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.model.FaqVO;

@Mapper
public interface FaqMapp {

	List<FaqVO> fqlist(FaqVO vo);
	int bbTotal(FaqVO vo);
	
	int faqinsert(FaqVO vo);
	
	FaqVO faqdetail(FaqVO vo);
	
	int faqDel(FaqVO vo);
	
	int faqModify(FaqVO vo);
	
}
