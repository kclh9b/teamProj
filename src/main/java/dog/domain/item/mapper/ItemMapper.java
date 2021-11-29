package dog.domain.item.mapper;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import dog.domain.cart.CartItemVO;
import dog.domain.cart.CartVO;
import dog.domain.item.ItemVO;
import dog.domain.member.MemberVO;
import dog.domain.item.RecItemVO;

@Mapper
public interface ItemMapper {
	//어드민 ==============================================================

	//상품 등록
	int save(ItemVO vo);

	//상품명 중복체크
	int ckname(ItemVO vo) throws Exception;

	//상품 수정
	int modi(ItemVO vo);

	//상품 삭제
	int delete(ItemVO vo);

	//상품 목록 조회
	List<ItemVO> adminGetItems(ItemVO vo);

	//전체 상품 갯수
	int itemCnt(ItemVO vo);

	//상품 조회
	ItemVO adminGetItem(ItemVO vo);

	//========== 추천상품 =================================
	//모든 상품코드 가져오기
	ArrayList<ItemVO> getInos();

	//추천상품 코드 가져오기
	ArrayList<RecItemVO> getRecInos();

	//추천상품 변경
	int updateRecInos(ArrayList<RecItemVO> ril);

	//추천상품 가져오기 (선정화면)
	ArrayList<ItemVO> recItemAllList();
	//========== 추천상품 =================================

	//어드민 ==============================================================






	//클라이언트 ==============================================================

	//상품 목록 조회
	ArrayList<ItemVO> itemList(Map map);

	//상품 갯수
	Integer getItemCnt(Map map);

	//상품 조회
	ItemVO itemDetail(ItemVO iv);

	// 추천상품 =================================
	
	//추천상품 가져오기 (메인화면)
	ArrayList<ItemVO> recItemList(ArrayList<RecItemVO> rivl);

	//클라이언트 ==============================================================
}
