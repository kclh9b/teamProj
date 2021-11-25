package dog.domain.board.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.domain.board.CommentVO;
import dog.domain.board.QnaVO;

@Mapper
public interface CommentMapp {

	int commentinsert(CommentVO vo);
	
	List<CommentVO> commentlist(CommentVO vo);
	
	int delcomment(CommentVO vo);
	
	List<CommentVO> bringcm(QnaVO vo);
	
}
