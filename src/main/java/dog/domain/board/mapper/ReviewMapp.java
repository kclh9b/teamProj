package dog.domain.board.mapper;

import java.util.List;


import org.apache.ibatis.annotations.Mapper;

import dog.domain.item.ItemVO;
import dog.domain.board.ReviewVO;

@Mapper
public interface ReviewMapp {
	
	ReviewVO revDetail(ReviewVO vo);
	
	void addCount(ReviewVO vo);	
	
	List<ReviewVO> rvlist2(ReviewVO vo);
	int bbTotal(ReviewVO vo);
	
	List<ItemVO> itemlist();
	
	int revinsert(ReviewVO vo);
	
	int revDel(ReviewVO vo);
	
	int revModify(ReviewVO vo);
	
	List<ReviewVO> bringrv(ReviewVO vo);
	
}
