package dog.domain.board.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;

import dog.domain.board.ReviewReplyVO;
import dog.domain.board.ReviewVO;

@Mapper
public interface ReviewReplyMapp {
	
	int rrplyinsert(ReviewReplyVO vo);
	
	List<ReviewReplyVO> rrplist(ReviewReplyVO vo);
	
	int rrpdel(ReviewReplyVO vo);
	
	List<ReviewReplyVO> bringrvrp(ReviewVO reviewVO);
	
}
