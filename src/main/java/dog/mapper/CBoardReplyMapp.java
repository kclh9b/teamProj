package dog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.model.CboardReplyVO;

@Mapper
public interface CBoardReplyMapp {

	int crplyinsert(CboardReplyVO vo);
	
	List<CboardReplyVO> crplist(CboardReplyVO vo);
	
	int cbrpdel(CboardReplyVO vo);
	
}
