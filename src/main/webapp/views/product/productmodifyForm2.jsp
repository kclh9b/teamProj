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
.inputArea { margin:10px 0; }
select { width:100px; }
label { display:inline-block; width:100px; padding:5px; }
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
	<h2>상품수정</h2>
	<form action="productmodifyReg" method="post" enctype="multipart/form-data" class="productRegForm">
		<table class="basic">
			<tr>
				<td id="title">상품코드</td>
				<td>
					<input type="text" id="ino" name="ino" value="${pro.ino }">
				</td>
			</tr>
		
		<tr>
			<td id="title">카테고리</td>
			<td>
				<select id="main_good" onchange="categoryChange(this)">
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
			<td id="title">상품명</td>
			<td>
				<input type="text" id="name" name="name" value="${pro.name }">
			</td>
		</tr>
		
		<tr>
			<td id="title">가격</td>
			<td>
				<input type="text" id="price" name="price" value="${pro.price }">
			</td>
		</tr>	
		
		<tr>
			<td id="title">할인율</td>
			<td>
				<input type="text" id="discount" name="discount" value="${pro.discount }">
			</td>
		</tr>
		
		<tr>
			<td id="title">원산지</td>
			<td>
				<input type="text" id="origin" name="origin" value="${pro.origin }">
			</td>
		</tr>
		
		<tr>
			<td id="title">제조사</td>
			<td>
				<input type="text" id="manufac" name="manufac" value="${pro.manufac }">
			</td>
		</tr>
		
		<tr>	
			<td id="title">수량</td>
			<td>
				<input type="text" id="quantity" name="quantity" value="${pro.quantity }">
			</td>
		</tr>
		
	 	<tr>
	 		<td id="title">강아지사이즈</td>
	 		<td>
				<input type="radio" id="size" name="size" value="소">소형견
				<input type="radio" id="size" name="size" value="중">중형견
				<input type="radio" id="size" name="size" value="대">대형견
			</td>
		</tr>
		
		<tr>
			<td id="title">털길이</td>
			<td>
				<input type="radio" id="fur" name="fur" value="l">장모종
				<input type="radio" id="fur" name="fur" value="s">단모종
			</td>
		</tr>
		
		<tr>
			<td id="title">강아지나이</td>
			<td>
				<input type="radio" id="age" name="age" value="자견">자견
				<input type="radio" id="age" name="age" value="성견">성견
				<input type="radio" id="age" name="age" value="노견">노견
			</td>
		</tr>
		
		</table>
		
		<div class="sb">
			<input type="submit" value="수정하기">
			<button type="button" class="back">이전으로</button>
		</div>
	</form>
</div>
<jsp:include page="../footer.jsp"/>
		<script>
		
		$(".back").click(function (){
			history.back();
		});
		
		var req_cateid = "";
		
		$(document).ready(function(){
					
			var main_cate = "";
			var rtn_cateid = "";
			
			req_cateid = "" + ${pro.cateid};
			
			main_cate = req_cateid.substring(0, 1);
					
			if(main_cate == "1")
			{
				rtn_cateid = "a";
			}
			else if(main_cate == "2")
			{
				rtn_cateid = "b";
			}	
			else if(main_cate == "3")
			{
				rtn_cateid = "c";
			}
			else if(main_cate == "4")
			{
				rtn_cateid = "d";
			}
				
			categoryChange(rtn_cateid);	
			
			$("input:radio[name='size']:radio[value='${pro.size}']").prop('checked', true);
			$("input:radio[name='fur']:radio[value='${pro.fur}']").prop('checked', true);
			$("input:radio[name='age']:radio[value='${pro.age}']").prop('checked', true);
			$("input:radio[name='fatyn']:radio[value='${pro.fatyn}']").prop('checked', true);
			
		});
		
		function categoryChange(e) {
				
			var cate_index = 0;
			
		    var x = ["소분류"];
		    var food = ["퍼피용", "성견용", "노견용", "소형견용", "중형견용","대형견용", "비만견용", "간식"];
		    var clean = ["배변판/패드", "기저귀", "털제거용품", "이발기구"];
		    var toy = ["봉제장난감", "고무", "공", "원반", "중대형견용"];
		    var outdoor = ["자동줄", "목줄", "하네스", "이동가방", "유모차"];
		    var target = document.getElementById("good");
	
		    if(e.value == "x") {
		        var d = x;
		        var val = [""];
		    }else if(e.value == "a" || e == "a") {
		        var d = food;
		        var val = [101, 102, 103, 104, 105, 106, 107, 108];
		        var good_index = "";  
		        
		        $("#main_good option:eq(1)").attr("selected","selected");	  
		        
		        for(var i=0; i<val.length; i++){
		        	if(req_cateid == val[i]){
		        		cate_index = i;
		        	}
		        }
		        
	
		     }
		    else if(e.value == "b" || e == "b") {
		        var d = clean;
		        var val = [201, 202, 203, 204];
		        var good_index = "";  
		        
		        $("#main_good option:eq(2)").attr("selected","selected"); 
		        
		        for(var i=0; i<val.length; i++){
		        	if(req_cateid == val[i]){
		        		cate_index = i;
		        	}
		        }
		    }
		    else if(e.value == "c" || e == "c") {
		        var d = toy;
		        var val = [301, 302, 303, 304, 305];
		        var good_index = "";  
		        
		        $("#main_good option:eq(3)").attr("selected","selected");        	        
		        
		        for(var i=0; i<val.length; i++){
		        	if(req_cateid == val[i]){
		        		cate_index = i;
		        	}
		        }
		        
		    }else if(e.value == "d" || e == "d") {
		        var d = outdoor;
		        var val = [401, 402, 403, 404, 405];
		        var good_index = "";
		        
		        $("#main_good option:eq(4)").attr("selected","selected"); 
		        
		        for(var i=0; i<val.length; i++){
		        	if(req_cateid == val[i]){
		        		cate_index = i;
		        	}
		        }
		    }
	
		    target.options.length = 0;
	
		    for (x in d) {
		        var opt = document.createElement("option");
		        opt.value = val[x];
		        opt.innerHTML = d[x];
		        target.appendChild(opt);
		    }
		    
		    category_selected(cate_index);
		}
		
		function category_selected(cate_index){
			
			 $("#good option:eq("+ cate_index + ")").attr("selected","selected");
		}
	
		</script>
</body>
</html>