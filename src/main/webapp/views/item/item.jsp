<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">

<link rel="stylesheet" href="<c:url value="/css/style_item.css"/>"></link>
</head>
<body>
<jsp:include page="../header.jsp"/>
<div class="itemWrapper">
	<div class="itemTop">
		<div class="mainImgBox">
			<img class="mainImg" src="<c:url value="/up/item/${item.main_img }"/>" width="400px" alt="메인이미지">
		</div>
		<div class="infoBox">
			<div class="infoTitle">
				${item.name }
			</div>
			<div class="infoDetail">
				<table class="infoTable">
					<colgroup><col width="100px;"></colgroup>
					<tr><td>분류</td><td>${item.gname } / ${item.sname }</td></tr>
					<tr><td>정가</td><td class="originPrice"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.price }" />원</td></tr>
					<tr><td>판매가</td><td><strong style="font-size: 20px;"><fmt:formatNumber type="number" maxFractionDigits="3" value="${item.calprice }" />원</strong>(${item.discount }% 할인)</td></tr>
					<tr><td>원산지</td><td>${item.origin }</td></tr>
					<tr><td>제조사</td><td>${item.manufac }</td></tr>
					<tr><td>평점</td><td><fmt:formatNumber value="${item.r_avg }" pattern="0.0"/></td></tr>
				</table>
				<form action="/checkout" name="buyfrm">
					<table class="quantity">
						<colgroup><col width="100px;"></colgroup>
						<tr>
							<td>수량</td>
							<td>
								<div class="addButton" onclick="addQuantity(-1)" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">-</div>
								<div class="quanValue"><input id="quanValue" class="quanValue" type="text" name="arr[0].quantity" value="1"></div>
								<div class="addButton" onclick="addQuantity(1)" oncontextmenu="return false" ondragstart="return false" onselectstart="return false">+</div>
							</td>
						</tr>
					</table>
					<input type="hidden" name="state" value="1">
					<input type="hidden" name="arr[0].ino" value="${item.ino }">
					<input type="hidden" name="arr[0].name" value="${item.name }">
					<input type="hidden" name="arr[0].main_img" value="${item.main_img }">
					<input type="hidden" name="arr[0].calprice" value="${item.calprice }">
					<div class="buttonBox">
						<input type="button" class="actionButton tocart" id="addCart" value="장바구니" onclick="to_ajax('${id}', '${black }')" >					
						<input type="button" class="actionButton direct" value="바로구매" onclick="tobuy('${id}', '${black }')">
					</div>
				</form>
			</div>
		</div>
		
		<div class="itemContent">
			<div id="detail">
				<div class="itemTab">
					<div class="detail">
						<ul>
							<li class="on"><a href="#detail">상품상세정보</a></li>
							<li><a href="#reviews">상품후기</a></li>
							<li><a href="#qna">상품문의</a></li>
							<li><a href="#delivery">배송안내</a></li>
							<li><a href="#exchange">취소 및 반품안내</a></li>
						</ul>
					</div>
				</div>
				
				<div class="detail_cont">
					<h3>상품상세정보</h3>
					<div class="detailBox">
						<img src="<c:url value="/up/item/${item.detail_img }"/>" alt="소개이미지">
					</div>
				</div>
			</div> <!-- detail end -->
			
			<div id="reviews">
				<div class="itemTab">
					<div class="exchange">
						<ul>
							<li><a href="#detail">상품상세정보</a></li>
							<li class="on"><a href="#reviews">상품후기</a></li>
							<li><a href="#qna">상품문의</a></li>
							<li><a href="#delivery">배송안내</a></li>
							<li><a href="#exchange">취소 및 반품안내</a></li>
						</ul>
					</div>
				</div>
			
				<div class="revContent">
					<h3 style="margin:0 0 5px 0;">상품후기</h3>
					<div class="btnReview">
						<a href="/board/review" style="color:#3e3d3c; background-color: #eee;" >상품후기 전체보기</a>
						<a href="/board/writeRev?ino=${item.ino }" style="color:#fff; background-color: #343434;">상품후기 글쓰기</a>
					</div>
					<div class="reviewsList">
						<div>
							<table class="reviewTable">
								<colgroup>
									<col width="13%">
									<col>
									<col width="13%">
									<col width="13%">
								</colgroup>
								<thead></thead>
								<tbody>
									
								<c:forEach items="${rv }" var="vo" varStatus="no">
								
									<!-- for문 쓰면 여기에서 시작 -->
									<tr class="reviewRow" id="review1">
										<td class="star">${vo.score } 점</td>
										<td><div class="reviewTitleBox"><a href="javascript:void(0)" onclick="openReview(event)">${vo.content }</a></div></td>
										<td>${vo.uid }</td>
										<td>${vo.regdate }</td>
									</tr>
									<tr class="reviewDetail">
										<td class="revDetailBox" colspan="4">
											<div class="revContent">
												<div class="revView">
													<br>
													<br>
													<p>
														${vo.content }
														<br>
														<br>											
														<br>
														<br>
														<a href="/board/revDet?revno=${vo.revno }">상세보기 & 댓글달기</a>
														<br>
													</p>
												</div>
												
												<div class="commentBox">

													<!-- <div class="commentTop">
														<span>0개의 댓글이 있습니다</span>
													</div> -->
													
													<div class="commentList">
													<c:forEach items="${vo.rvrp }" var="rrp" varStatus="no">												
													
														<ul>
															<li>
																<p>작성자 : ${rrp.uid }</p>
																<p>등록날짜 : ${rrp.regdate }</p>
																<span>댓글 : </span>
																<span>${rrp.content }</span>																
															</li>															
														</ul>
													
													</c:forEach>	
														
													</div>
												</div>
											</div>
										</td>
									</tr> <!-- reviewDetailBox end -->
									
									</c:forEach>
						
								</tbody>
							</table>
						</div>
					</div>
				</div> <!-- reviewContent end -->
			</div> <!-- reviews end -->
		
			<div id="qna">
				<div class="itemTab">
					<div class="exchange">
						<ul>
							<li><a href="#detail">상품상세정보</a></li>
							<li><a href="#reviews">상품후기</a></li>
							<li class="on"><a href="#qna">상품문의</a></li>
							<li><a href="#delivery">배송안내</a></li>
							<li><a href="#exchange">취소 및 반품안내</a></li>
						</ul>
					</div>
				</div>
				
				<div class="revContent">
					<h3 style="margin:0 0 5px 0;">상품 Q&A</h3>
					<div class="btnReview">
						<a href="/board/qna" style="color:#3e3d3c; background-color: #eee;" >상품문의 전체보기</a>
						<a href="/board/writeQna?ino=${item.ino }" style="color:#fff; background-color: #343434;">상품문의 글쓰기</a>
					</div>
					<div class="reviewsList">
						<div>
							<table class="reviewTable">
								<colgroup>
									<col width="13%">
									<col>
									<col width="13%">
									<col width="13%">
								</colgroup>
								<thead></thead>
								<tbody>								
									
									<c:forEach items="${rp }" var="vo" varStatus="no">
									
									<!-- for문 쓰면 여기에서 시작 -->
									<tr class="reviewRow">
										<td class="star">문의 제목</td>											
										
                                        <c:if test="${vo.open=='n' }">
                                        <c:if test="${uid!=vo.uid && uid!='admin'}">
                                        <td class="td123"><div class="reviewTitleBox">
                                            비밀글 입니다.
                                            </div>
                                            </td>
                                        </c:if>

                                        <c:if test="${uid==vo.uid || uid=='admin'}">
                                            <td class="td123"><div class="reviewTitleBox">
                                            <a href="javascript:void(0)" onclick="openReview(event)">${vo.title }</a>
                                            </div>
                                            </td>
                                        </c:if>

                                        </c:if>

                                        <c:if test="${vo.open=='y' }">
                                        <td class="td123"><div class="reviewTitleBox">
                                            <a href="javascript:void(0)" onclick="openReview(event)">${vo.title }</a>
                                            </div>
                                            </td>
                                        </c:if>
						
										
										<td>${vo.uid }</td>
										<td>${vo.regdate }</td>
									</tr>
									<tr class="reviewDetail">
										<td class="revDetailBox" colspan="4">
											<div class="revContent">
												<div class="revView">
													<br>
													<br>
													<p>
														${vo.content }
														<br>
														<br>														
														<br>
														<br>
														<c:if test="${uid=='admin' }">
														<a href="/board/qnaDet?qnano=${vo.qnano }">상세보기 & 코멘트달기</a>
														</c:if>
														<br>
													</p>
												</div>
												
												<div class="commentBox">
												
													<!-- <div class="commentTop">
														<span>0개의 코멘트가 있습니다</span>
													</div> -->
													
													<div class="commentList">
													
													<c:forEach items="${vo.qncm }" var="cmm" varStatus="no">																							
																										
														<ul>
															<li><div class="no_data">☞	관리자 코멘트	☜</div></li>
															<li><div class="no_data">${cmm.content }</div></li>
														</ul>
													
													</c:forEach>
													
													</div>
												</div>
											</div>
										</td>
									</tr> <!-- reviewDetailBox end -->
									
									</c:forEach>									
									
									
								</tbody>
							</table>
						</div>
					</div>
				</div> <!-- qnaContent end -->
				
				<div id="delivery">
					<div class="itemTab">
						<div class="delivery">
							<ul>
								<li><a href="#detail">상품상세정보</a></li>
								<li><a href="#reviews">상품후기</a></li>
								<li><a href="#qna">상품문의</a></li>
								<li class="on"><a href="#delivery">배송안내</a></li>
								<li><a href="#exchange">취소 및 반품안내</a></li>
							</ul>
						</div>
					</div>
					
					<div class="delContent" style="line-height:20px;">
						<h3 style="line-height:30px;">배송 안내</h3>
						<div class="delConCon">
							<p>1. 배송안내</p>
							<p>
								<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
								<span><font style="color:rgb(255,0,0);">· 주문하신 상품 중 오후 5시 이전(토요일은 1시 이전)까지 입금확인 된 상품은 부득이 한 경우를 제외하고는 당일출고되며 이후 입금 확인된</font> 주문은 <br> 
								&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;입금 다음날 (공휴일 등 택배사 휴무일일 경우 업무시작일) 출고됩니다.</span><br>
								<span style="color:rgb(255,0,0);">&nbsp;&nbsp;</span>
								<span>· 제품 출고 후 보통 1~3일 안에 주문하신 제품을 받아보실 수 있으나 택배사 사저에 의해 지연될 수 있습니다.</span>
								<p>&nbsp;&nbsp;&nbsp;· 상품의 <font style="color:rgb(255,0,0);">배송비(2,500원)은 총 구매금액이 2만원 이상일 때 무료배송이며</font>, 배송비는 물품구매시 자동 계산됩니다.</p>
							</p>
							<p>&nbsp;&nbsp;</p>
							
							<p>2. 업체배송</p>
							<p>
								<span>&nbsp;&nbsp;</span>
								<span>· 업체배송 상품은 해당 제조사 또는 수입사에서 직접 발송하는 상품이므로 <font style="color:rgb(255,0,0);">배송일이 3~4일 정도 더 소요될 수</font> 있습니다.</span><br>
								<span>&nbsp;&nbsp;</span>
								<span>· 업체배송 제품만 단독 주문시 샘플 및 사은품은 포함되지 않습니다.</span><br>
							</p>
							<p>&nbsp;&nbsp;</p>
						</div>
					</div>
				</div> <!-- delivery end -->
			
				<div id="exchange">
					<div class="itemTab">
						<div class="exchange">
							<ul>
								<li><a href="#detail">상품상세정보</a></li>
								<li><a href="#reviews">상품후기</a></li>
								<li><a href="#qna">상품문의</a></li>
								<li><a href="#delivery">배송안내</a></li>
								<li class="on"><a href="#exchange">취소 및 반품안내</a></li>
							</ul>
						</div>
					</div>
			
					<div class="exContent" style="line-height:20px;">
						<h3 style="line-height:30px;">취소 및 반품안내</h3>
						<div class="exConCon">
							<p>1. 취소 안내</p>
							<p>
								<span>&nbsp;&nbsp;</span>
								<span>· 주문 취소는 결제완료 및 배송준비중 상태일때만 가능하며 그 이후로는 반품 신청만 가능합니다.</span><br>
								<span>&nbsp;&nbsp;</span>
							</p>
							
							<p>2. 반품 안내</p>
							<p>
								<span>&nbsp;&nbsp;</span>
								<span>· 상품의 불량 및 하자시 100% 환불이 가능하며 발생되는 택배비용은 전액 당사가 부담하는것을 원칙으로 합니다.</span><br>
								<span>&nbsp;&nbsp;</span>
								<span>· 반품 시 반송하는 <font style="color:rgb(255,0,0);">제품이 훼손되거나 재판매가 불가능할 경우는 반품 불가능</font>합니다.</span><br>
								<span>&nbsp;&nbsp;</span>
								<span>· 환불의 경우 반송된 제품의 물류센터 입고일로부터 3일 이내에 처리됩니다</span><br>
							</p>
							<p>&nbsp;&nbsp;</p>
							
							<p>3. 반품이 불가능한 경우</p>
							<p>
								<span>&nbsp;&nbsp;</span>
								<span>· 사료나 간식을 개봉한 후 보관 부주의로 인한 변질은 환불이 불가하며 수령이로부터 7일 경과 시 사용 유,무와 관계없이 반품은 불가능합니다.</span><br>
								<span>&nbsp;&nbsp;</span>
								<span>· <font style="color:rgb(255,0,0);">문의 사항이나 반품 및 교환접수는 고객지원센터로 연락주시면 신속하게 처리 해 드리겠습니다.</font></span><br>
							</p>
						</div>
					</div>
				</div> <!-- exchange end -->
			</div>
		</div>
	</div>
</div>
<jsp:include page="../footer.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<script>
	function tobuy(id, black) {
		if(black=='y') {
			alert("블랙리스트 회원입니다.");
			return;
		}
		var num_check=/^[0-9]*$/;
		var quantity = document.getElementById("quanValue");
		if(num_check.test(quantity.value)){
			
		}else {
			alert ( "숫자만 입력할 수 있습니다." );
			quantity.value="1"
			quantity.focus();
			return;
		}
		
		if(id=="" || id==null) {
			alert("로그인 해주시기 바랍니다");
			location.href="/member/MemberLogin";
			return;
		}
		document.buyfrm.submit();
		
	}
	
	function to_ajax(id, black){
		if(black=='y') {
			alert("블랙리스트 회원입니다.");
			return;
		}
		var num_check=/^[0-9]*$/;
		var quantity = document.getElementById("quanValue");
		if(num_check.test(quantity.value)){
			
		}else {
			alert ( "숫자만 입력할 수 있습니다." );
			quantity.value="1"
			quantity.focus();
			return;
		}
		
		if(id=="" || id==null) {
			alert("로그인 해주시기 바랍니다");
			location.href="/member/MemberLogin";
			return;
		}
		var formData = $("form[name=buyfrm]").serialize();
		
		var wWidth = '400';
	    var wHeight = '250';
		
		var wLeft = Math.ceil(( window.screen.width - wWidth )/2);
	    var wTop = Math.ceil(( window.screen.height - wHeight )/2 -120);
		
		var w = window.open("about:blank","content","width="+wWidth+", height="+wHeight+", left="+wLeft+", top="+wTop);
		
		// ajax process
		$.ajax({
			url:"/cart/add",
			method:"post",
			data:formData,
			dataType:"html",
			success: eventSuccess,
			error: function(xhr, status, error) {alert(error);}
		});
	
		function eventSuccess(data)
		{
			//여기서 팝업된 창의 주소를 변경하자.
			w.location.href = "/cart/add";
		}
		
	}
	
	function addQuantity(add) {
		var quantity = document.getElementById("quanValue");
		if(!(quantity.value==1 && add==-1)) {
			quantity.value = Number(quantity.value)+Number(add);			
		}
	}
	
	function openReview(event) {
		var tr = event.target.parentNode.parentNode.parentNode.nextSibling;
		var trNext = tr.nextSibling;
		if(trNext.style.display=="" || trNext.style.display=="none") {
			trNext.style.display="table-row";			
		}else {
			trNext.style.display="none";			
		}
		
	}
</script>
</body>
</html>