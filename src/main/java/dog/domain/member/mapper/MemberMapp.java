package dog.domain.member.mapper;

import java.util.List;
import org.apache.ibatis.annotations.Mapper;

import dog.domain.board.CboardVO;
import dog.domain.member.MemberVO;
import dog.domain.board.QnaVO;
import dog.domain.board.ReviewVO;

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
