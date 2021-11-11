package dog.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import dog.model.QnaVO;

@Mapper
public interface QnaMapp {
	
	List<QnaVO> qnalist(QnaVO vo);
	int bbTotal(QnaVO vo);
	
	QnaVO qnaDetail(QnaVO vo);
	
	int qnainsert(QnaVO vo);
	
	int qnaDel(QnaVO vo);
	
	int qnaModify(QnaVO vo);
	
	List<QnaVO> bringqn(QnaVO vo);
	
}
