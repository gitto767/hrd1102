<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.custid.value==""){
		alert("고객 아이디를 입력해주세요.");
		document.form.custid.focus();
	}else if(document.form.author.value==""){
		alert("고객 성명을 입력해주세요.");
		document.form.author.focus();
	}else{
		document.form.submit();
	}
}
</script>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h3>고객 정보 등록 화면</h3>
<form name="form" method=post action="addcustomerProcess.jsp">
<table>
  <tr>
    <th>고객 아이디</th>
    <td><input type="text" name="custid"></td>
  </tr>
   <tr>
    <th>고객 성명</th>
    <td><input type="text" name="author"></td>
  </tr>
   <tr>
    <th>관심 상품</th>
    <td class="checkbox">
      <label><input type="checkbox" name="goods" value="의류">의류</label>
      <label><input type="checkbox" name="goods" value="식료품">식료품</label>
      <label><input type="checkbox" name="goods" value="컴퓨터">컴퓨터</label>
      <label><input type="checkbox" name="goods" value="공산품">공산품</label>
      <label><input type="checkbox" name="goods" value="관광">관광</label>
      <label><input type="checkbox" name="goods" value="전자제품">전자제품</label>
      <label><input type="checkbox" name="goods" value="건강제품">건강제품</label>
      <label><input type="checkbox" name="goods" value="운동기구">운동기구</label>
    </td>
  </tr>
   <tr>
    <th>전 화</th>
    <td><input type="text" name="phone"></td>
  </tr>
   <tr>
    <th>이메일</th>
    <td><input type="text" name="email"></td>
  </tr>
   <tr>
    <th>거주지</th>
    <td>
      <select name="areacode">
      <option value="101">서울</option>
      <option value="102">경기</option>
      <option value="103">대전</option>
      <option value="104">부산</option>
      <option value="105">광주</option>
      <option value="106">울산</option>
      <option value="107">대구</option>
      <option value="108">강원</option>
      <option value="109">경상</option>
      <option value="110">충청</option>
      <option value="111">제주</option>      
      </select>
    </td>
  </tr>
   <tr>
      <td colspan=2 class="last">
        <input class="buttons" type="button" value="등록" onclick="check()">
        <input class="buttons" type="reset" value="취소">
      </td>
    </tr>
</table>
</form>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>