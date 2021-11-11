package dog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.model.CboardVO;

@Mapper
public interface CBoardMapp {

	List<CboardVO> cblist2(CboardVO vo);
	int bbTotal(CboardVO vo);
	
	CboardVO cbDetail(CboardVO vo);
	
	void addCount(CboardVO vo);
	
	int cbinsert(CboardVO vo);
	
	int cbModify(CboardVO vo);
	
	int cbDelete(CboardVO vo);
	
}
