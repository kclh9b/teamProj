package dog.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import dog.model.CboardVO;
import dog.model.MemberVO;
import dog.model.QnaVO;
import dog.model.ReviewVO;

@Mapper
public interface MemberMapp {
	List<MemberVO> mmList(MemberVO vo);
	int mmInsert(MemberVO vo);
	MemberVO mmLogin(MemberVO vo);
	int mmDelete(MemberVO vo);
	MemberVO mmsearchid(MemberVO vo);
	MemberVO mmsearchpw(MemberVO vo);
	MemberVO mmListOne(MemberVO vo);
	MemberVO mmSelectMem(MemberVO vo);
	Integer mmAdminModify(MemberVO vo);
	List<CboardVO> mmWrite1(CboardVO vo);
	List<ReviewVO> mmWrite2(ReviewVO vo);
	List<QnaVO> mmWrite3(QnaVO vo);
	int mmModify(MemberVO vo);
	int mmModifyps(MemberVO vo);
	int ckid(MemberVO vo) throws Exception;
	int mmBlackA(MemberVO vo);
	int mmBlackF(MemberVO vo);
	int ckemail(MemberVO vo) throws Exception;
}
