### 학원 프로젝트로 진행한 반려견 용품 쇼핑몰입니다.

sts로 프로젝트 마무리 후 IntelliJ로 리팩토링중입니다.

+ 작업환경
  + language : java 8
  + framework : SpringBoot 2.5.2
  + Database : mysql 5.5
  + ORM framework : MyBatis
  + view template : jsp, thymeleaf


- 작업내역
  - 웰컴페이지
  - 상품 검색 및 조회
  - 장바구니
  - 결제 (bootpay api 이용, 결제 완료시에도 결제는 되지 않는 테스트 결제입니다.)
  - 정산 (chart.js 이용, 전체 상품 or 상품별 판매금액을 그래프로 보여주고 판매건수와 판매량, 총 판매금액의 데이터 표시)


* 리팩토링
  * 객체 및 기능별 directory 정리, 도메인 구분
  * 상품, 장바구니, 결제
    * Controller, Service 분리
    * resource에 따른 url 계층 구성
    * HttpMethod(Get, Post, Put, Delete) 구성
    * jsp -> thymeleaf 변경
    