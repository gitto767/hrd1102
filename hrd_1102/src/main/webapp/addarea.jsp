<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script>
function check(){
	if(document.form.areacode.value==""){
		alert("거주지 코드를 입력해주세요.");
		document.form.areacode.focus();
	}else if(document.form.areaname.value==""){
		alert("거주지 이름을 입력해주세요.");
		document.form.areaname.focus();
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
<h3>거주지 정보 등록 화면</h3>
<form name="form" method=post action="addareaProcess.jsp">
<table class="input">
  <tr>
    <th>거주지 코드</th>
    <td><input type="text" name="areacode"></td>
  </tr>
  <tr>
    <th>거주지 이름</th>
    <td><input type="text" name="areaname"></td>
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