package dog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.model.CommentVO;
import dog.model.QnaVO;

@Mapper
public interface CommentMapp {

	int commentinsert(CommentVO vo);
	
	List<CommentVO> commentlist(CommentVO vo);
	
	int delcomment(CommentVO vo);
	
	List<CommentVO> bringcm(QnaVO vo);
	
}
