<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix = "fmt" uri = "http://java.sun.com/jsp/jstl/fmt" %>    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<link rel="stylesheet" href="../css/style_list.css"></link>
<style>
.inputArea { margin: 5px 0; border: 1px solid lightgray; width: 500px; height: 40px; padding: 10px;}
select { width:100px; }
label { display:inline-block; width:100px; padding:5px; border-right: 1px solid lightgray;}
.goods_list input { width:150px; }
input[type="radio"] {width:50px;}
.name_input_1 {display: none; color:green}
.name_input_2 {display: none; color:red;}
</style>
</head>
<body>
<jsp:include page="../header.jsp"/>
<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
<jsp:include page="../adminPage.jsp"/>
<div class="goods_list">
	<h2>상품등록</h2>
	<div>
		<span id="essential"> * 필수입력사항</span>
		<span id="option"> * 선택입력사항</span>
	</div>
	<form action="productReg" method="post" enctype="multipart/form-data" class="productRegForm">
		<table class="basic">
		<tr>
			<td id="title">
			<span id="essential">*</span>
			카테고리
			</td>
			<td>
				<select onchange="categoryChange(this)" id="category">
				    <option value="x">대분류</option>
				    <option value="a">사료</option>
				    <option value="b">관리용품</option>
				    <option value="c">장난감</option>
				    <option value="d">산책용품</option>
				</select>
				<select id="good" name="cateid">
					<option value="">소분류</option>
				</select>
			</td>
		</tr>
				
		<tr>
			<td id="title">
			<span id="essential">*</span>
			상품명</td>
			<td>
				<input type="text" id="name" name="name" placeholder="한글,영문,숫자만 가능">
				<button type="button" id="nmck" onclick="nameck();" value="N">중복확인</button>
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="essential">*</span>
				가격
			</td>	
			<td>
				<input type="text" id="price" name="price" placeholder="8자리숫자">
			</td>
		</tr>	
		
		<tr>
			<td id="title">
				<span id="essential">*</span>
				할인율
			</td>
			<td>
				<input type="text" id="discount" name="discount" placeholder="3자리숫자">
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="essential">*</span>			
				원산지
			</td>
			<td>
				<input type="text" id="origin" name="origin" placeholder="한글만">
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="essential">*</span>			
				제조사
			</td>
			<td>
				<input type="text" id="manufac" name="manufac" placeholder="한글만">
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="essential">*</span>
				수량
			</td>
			<td>
				<input type="text" id="quantity" name="quantity" placeholder="3자리숫자">
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="essential">*</span>			
				메인이미지
			</td>
			<td>
				<input type="file" id="mfile" name="mfile">
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="essential">*</span>				
				상세이미지
			</td>
			<td>
				<input type="file" id="dfile" name="dfile">
			</td>
		</tr>
		
	 	<tr>
	 		<td id="title">
				<span id="option">*</span>
		 		강아지사이즈
	 		</td>
	 		<td>
				<input type="radio" id="size" name="size" value="소">소형견
				<input type="radio" id="size" name="size" value="중">중형견
				<input type="radio" id="size" name="size" value="대">대형견
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="option">*</span>
				강아지털길이
			</td>
			<td>
				<input type="radio" id="fur" name="fur" value="l">장모종
				<input type="radio" id="fur" name="fur" value="s">단모종
			</td>
		</tr>
		
		<tr>
			<td id="title">
				<span id="option">*</span>
				강아지나이
			</td>
			<td>
				<input type="radio" id="age" name="age" value="자견">자견
				<input type="radio" id="age" name="age" value="성견">성견
				<input type="radio" id="age" name="age" value="노견">노견
			</td>
		</tr>	
		
		</table>
		
		<div class="sb">
			<input type="button" id="btn_sb" value="등록하기">
		</div>
	</form>
</div>
<jsp:include page="../footer.jsp"/>
		<script>
		
			function categoryChange(e) {
			    var x = ["소분류"];
			    var food = ["퍼피용", "성견용", "노견용", "소형견용", "중형견용","대형견용", "비만견용", "간식"];
			    var clean = ["배변판/패드", "기저귀", "털제거용품", "이발기구"];
			    var toy = ["봉제장난감", "고무", "공", "원반", "중대형견용"];
			    var outdoor = ["자동줄", "목줄", "하네스", "이동가방", "유모차"];
			    var target = document.getElementById("good");
		
			    if(e.value == "x") {
			        var d = x;
			        var val = [""];
			    }else if(e.value == "a") {
			        var d = food;
			        var val = [101, 102, 103, 104, 105, 106, 107, 108];
			    }
			    else if(e.value == "b") {
			        var d = clean;
			        var val = [201, 202, 203, 204];
			    }
			    else if(e.value == "c") {
			        var d = toy;
			        var val = [301, 302, 303, 304, 305];
			    }else if(e.value == "d") {
			        var d = outdoor;
			        var val = [401, 402, 403, 404, 405];
			    }
		
			    target.options.length = 0;
		
			    for (x in d) {
			        var opt = document.createElement("option");
			        opt.value = val[x];
			        opt.innerHTML = d[x];
			        target.appendChild(opt);
			    }
			}
			
			$("#btn_sb").on("click",function(){
				var nameckVal = $("#nmck").val();
				var selectChk = $('select option:selected').val();

				if(selectChk == 'x') {
					alert("카테고리를 선택해주세요");
					$("#category").focus();
					return false;
					
				}else if($("#name").val()==""){
					alert("상품명을 입력해주세요");
				   $("#name").focus();
				   return false; 
				   
				}else if(nameValidator($("#name").val())==false) {
                	alert("허용되지 않은 양식입니다");
                	$("#name").focus();
                    return false;
                    
                }else if($("#price").val()==""){
					alert("가격을 입력해주세요");
				    $("#price").focus();
				     return false; 
				     
				}else if(priceValidator($("#price").val())==false){
					alert("8자리 숫자만 가능합니다");
				    $("#price").focus();
				     return false; 
				     
				}else if($("#discount").val()==""){
						alert("할인율을 입력해주세요");
					    $("#discount").focus();
					     return false;
				
				}else if(discountValidator($("#discount").val())==false){
						alert("3자리 숫자만 가능합니다");
					    $("#discount").focus();
					     return false;
			
				}else if($("#origin").val()==""){
						alert("원산지를 입력해주세요");
					    $("#origin").focus();
					     return false;
				
				}else if(originValidator($("#origin").val())==false){
						alert("한글만 입력 가능합니다");
					    $("#origin").focus();
					     return false;
		
				}else if($("#manufac").val()==""){
						alert("제조사를 입력해주세요");
					    $("#manufac").focus();
					     return false;
			
				}else if(manufacValidator($("#manufac").val())==false){
						alert("한글만 입력 가능합니다");
					    $("#manufac").focus();
					     return false;
		
				}else if($("#quantity").val()==""){
						alert("수량을 입력해주세요");
					    $("#quantity").focus();
					     return false;
			
				}else if(quantityValidator($("#quantity").val())==false){
						alert("3자리 숫자만 가능합니다");
					    $("#quantity").focus();
					     return false;
	
				}else if($("#mfile").val()==""){
						alert("메인이미지를 등록해주세요");
					    $("#mfile").focus();
					     return false;
		
				}else if($("#dfile").val()==""){
						alert("상세이미지를 등록해주세요");
					    $("#dfile").focus();
					     return false;
	
				}else if(nameckVal == "N")  {
		                alert("상품명 중복확인을 해주세요!");
		                return false;
	                
	            }else if(nameckVal == "Y") {
	                $(".productRegForm").submit();          
	            }
				
				
			});
			
			
			function nameck(){
	            $.ajax({
	            url : "/nameck",
	            type : "post",
	            dataType : "json",
	            data : {"name" : $("#name").val()},
	            success : function(data){
	                if(data == 1){
	                    alert("중복된 상품명입니다.");
	                }else if(data == 0){
	                    $("#nmck").attr("value", "Y");
	                    if( $("#name").val()=="") {
	                        alert("상품명 입력해주세요.");
	                        $("#name").focus();
	                        return false;
	                    
	                    }else if(nameValidator($("#name").val())==false) {
	                    	alert("허용되지 않은 양식입니다");
	                    	$("#name").focus();
	                        return false;
	                        
	                    }else {
		                    alert("사용가능한 상품명입니다.");	                    	
	                    }
	
			                }
			            }
			        }) 
			    }
			
			function nameValidator(args) {
				if(/^[ㄱ-ㅎ|가-힣|a-z|A-Z|0-9\s]+$/.test(args)) {
					return true;
				}
				return false;
			}
			
			function priceValidator(args) {

			    if (/^[0-9]{0,8}$/.test(args)) {
			        return true;
			    }
			    return false;
			}
			
			function discountValidator(args) {

			    if (/^[0-9]{0,3}$/.test(args)) {
			        return true;
			    }
			    return false;
			}
			
			function originValidator(args) {
				if(/^[가-힣]+$/.test(args)) {
					return true;
				}
				return false;
			}
			
			function manufacValidator(args) {
				if(/^[가-힣]+$/.test(args)) {
					return true;
				}
				return false;
			}
			
			function quantityValidator(args) {

			    if (/^[0-9]{0,3}$/.test(args)) {
			        return true;
			    }
			    return false;
			}
		</script>
</body>
</html>