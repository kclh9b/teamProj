<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="../css/style_list.css"></link>
<style>
.inputArea { margin: 5px 0; border: 1px solid lightgray; width: 500px; height: 40px; padding: 10px;}
select { width:100px; }
label { display:inline-block; width:100px; padding:5px; border-right: 1px solid lightgray;}
input { width:150px; }
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
	<form action="productReg" method="post" enctype="multipart/form-data" class="productRegForm">
		<table border="">
		<div class="inputArea">
			<label>카테고리</label>
			<select onchange="categoryChange(this)">
			    <option value="x">대분류</option>
			    <option value="a">사료</option>
			    <option value="b">관리용품</option>
			    <option value="c">장난감</option>
			    <option value="d">산책용품</option>
			</select>
			<select id="good" name="cateid">
				<option value="">소분류</option>
			</select>
		</div>
				
		<div class="inputArea">
			<label for="name">상품명</label>
			<input type="text" id="name" name="name">
			<button type="button" id="nmck" onclick="nameck();" value="N">중복확인</button>
		</div>
		
		<div class="inputArea">
			<label for="price">가격</label>
			<input type="text" id="price" name="price">
		</div>	
		
		<div class="inputArea">
			<label for="discount">할인율</label>
			<input type="text" id="discount" name="discount">
		</div>
		
		<div class="inputArea">
			<label for="origin">원산지</label>
			<input type="text" id="origin" name="origin">
		</div>
		
		<div class="inputArea">
			<label for="manufac">제조사</label>
			<input type="text" id="manufac" name="manufac">
		</div>
		
		<div class="inputArea">
			<label for="quantity">수량</label>
			<input type="text" id="quantity" name="quantity">
		</div>
		
		<div class="inputArea">
			<label for="mfile">메인이미지</label>
			<input type="file" id="mfile" name="mfile">
		</div>
		
		<div class="inputArea">
			<label for="dfile">상세이미지</label>
			<input type="file" id="dfile" name="dfile">
		</div>
		
	 	<div class="inputArea">
			<label for="size">강아지사이즈</label>
			<input type="radio" id="size" name="size" value="소">소형견
			<input type="radio" id="size" name="size" value="중">중형견
			<input type="radio" id="size" name="size" value="대">대형견
		</div>
		
		<div class="inputArea">
			<label for="fur">강아지털길이</label>
			<input type="radio" id="fur" name="fur" value="l">장모종
			<input type="radio" id="fur" name="fur" value="s">단모종
		</div>
		
		<div class="inputArea">
			<label for="age">강아지나이</label>
			<input type="radio" id="age" name="age" value="자견">자견
			<input type="radio" id="age" name="age" value="성견">성견
			<input type="radio" id="age" name="age" value="노견">노견
		</div>
		
		<div class="inputArea">
			<label for="fatyn">강아지비만</label>
			<input type="radio" id="fatyn" name="fatyn" value="y">비만견
			<input type="radio" id="fatyn" name="fatyn" value="n">일반견
		</div>
		
		
		<div class="inputArea">
			<input type="button" id="btn_sb" value="등록하기">
		</div>
		
		</table>
	</form>
</div>
<jsp:include page="../footer.jsp"/>
		<script>
			$(document).ready(function(){
				
			})
		
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
				if($("#name").val()==""){
					alert("상품명을 입력해주세요");
				   $("#name").focus();
				   return false; 
				   
				}else if($("#price").val()==""){
						alert("상품명을 입력해주세요");
					    $("#price").focus();
					     return false; 
					     
				}else if($("#discount").val()==""){
						alert("할인율을 입력해주세요");
					    $("#discount").focus();
					     return false;
				
				}else if($("#origin").val()==""){
						alert("원산지를 입력해주세요");
					    $("#origin").focus();
					     return false;
				
				}else if($("#manufac").val()==""){
						alert("제조사를 입력해주세요");
					    $("#manufac").focus();
					     return false;
			
				}else if($("#quantity").val()==""){
						alert("수량을 입력해주세요");
					    $("#quantity").focus();
					     return false;
			
				}else if(nameckVal == "N")  {
	                alert("상품명 중복확인을 해주세요!");
	                return false;
	                
	            }else if(nameckVal == "Y") {
	                alert("등록완료");
	                console.log(document.regform);
	                document.regform.submit(); 
	            }
				
				
			})
			
			
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
	                    $("#nameck").attr("value", "Y");
	                    if( $("#name").val()=="") {
	                        alert("상품명 입력해주세요.");
	                        $("#name").focus();
	                        return false;
	                    }
	                    alert("사용가능한 상품명입니다.");
	
			                }
			            }
			        }) 
			    }
			
		</script>
</body>
</html>