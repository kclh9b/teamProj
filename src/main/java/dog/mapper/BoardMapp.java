package dog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;
import org.apache.ibatis.type.Alias;

import dog.model.NoticeVO;

@Mapper
@Alias(value="boardMapp")
public interface BoardMapp {
	
	List<NoticeVO> ntlist();
	List<NoticeVO> ntlist123();
		
	List<NoticeVO> ntlist2(NoticeVO vo);
	int bbTotal(NoticeVO vo);	
	
	NoticeVO ntDetail(NoticeVO vo);
	
	int ntinsert(NoticeVO vo);
	
	int ntModify(NoticeVO vo);
	
	int ntDelete(NoticeVO vo);
	
	void addCount(NoticeVO vo);
	
}
