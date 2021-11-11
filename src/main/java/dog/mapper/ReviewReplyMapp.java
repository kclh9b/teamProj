package dog.mapper;

import java.util.List;



import org.apache.ibatis.annotations.Mapper;

import dog.model.ItemVO;
import dog.model.NoticeVO;
import dog.model.ReviewReplyVO;
import dog.model.ReviewVO;

@Mapper
public interface ReviewReplyMapp {
	
	int rrplyinsert(ReviewReplyVO vo);
	
	List<ReviewReplyVO> rrplist(ReviewReplyVO vo);
	
	int rrpdel(ReviewReplyVO vo);
	
	List<ReviewReplyVO> bringrvrp(ReviewVO reviewVO);
	
}
