package dog.domain.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.domain.board.CboardReplyVO;

@Mapper
public interface CBoardReplyMapp {

	int crplyinsert(CboardReplyVO vo);
	
	List<CboardReplyVO> crplist(CboardReplyVO vo);
	
	int cbrpdel(CboardReplyVO vo);
	
}
