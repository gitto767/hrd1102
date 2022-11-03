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
<%@ include file="dbconn.jsp" %>
<h3>고객 정보 수정</h3>
<%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    String custid=request.getParameter("custid");
    try{
    	String sql="select * from customer1102 where custid=?";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, custid);
    	rs=pstmt.executeQuery();
    	if(rs.next()){
    		String author=rs.getString("author");
    		String goods=rs.getString("goods");
    		String phone=rs.getString("phone");
    		String email=rs.getString("email");
    		String areacode=rs.getString("areacode");
    		String err[]=phone.split("-");
    		String em[]=email.split("@");
    		String gds[]=goods.split(",");
    	%>

<form name="form" method=post action="addcustomerProcess.jsp">
<table class="input">
  <tr>
    <th>고객 아이디</th>
    <td><input type="text" name="custid" value="<%=custid %>"></td>
  </tr>
   <tr>
    <th>고객 성명</th>
    <td><input type="text" name="author" value="<%=author %>"></td>
  </tr>
   <tr>
    <th>관심 상품</th>
    <td class="checkbox">
      <label><input type="checkbox" name="goods" value="의류" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("의류")){out.print("checked");} }%>>의류</label>
      <label><input type="checkbox" name="goods" value="식료품" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("식료품")){out.print("checked");} }%>>식료품</label>
      <label><input type="checkbox" name="goods" value="컴퓨터" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("컴퓨터")){out.print("checked");} }%>>컴퓨터</label>
      <label><input type="checkbox" name="goods" value="공산품" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("공산품")){out.print("checked");} }%>>공산품</label>
      <label><input type="checkbox" name="goods" value="관광" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("관광")){out.print("checked");} }%>>관광</label>
      <label><input type="checkbox" name="goods" value="전자제품" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("전자제품")){out.print("checked");} }%>>전자제품</label>
      <label><input type="checkbox" name="goods" value="건강제품" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("건강제품")){out.print("checked");} }%>>건강제품</label>
      <label><input type="checkbox" name="goods" value="운동기구" <%for(int i=0;i<gds.length;i++){if(gds[i].equals("운동기구")){out.print("checked");} }%>>운동기구</label>
    </td>
  </tr>
   <tr>
    <th>전 화</th>
    <td class="phone"><input type="text" name="hp1" value="<%=err[0] %>">-<input type="text" name="hp2" value="<%=err[1] %>">-<input type="text" name="hp3" value="<%=err[2] %>"></td>
  </tr>
   <tr>
    <th>이메일</th>
    <td class="email"><input type="text" name="email1" value="<%=em[0] %>">@<input type="text" name="email2" value="<%=em[1] %>"></td>
  </tr>
   <tr>
    <th>거주지</th>
    <td>
      <select name="areacode">
      <option value="101" <%if(areacode.equals("101")){ %>selected<%} %>>서울</option>
      <option value="102" <%if(areacode.equals("102")){ %>selected<%} %>>경기</option>
      <option value="103" <%if(areacode.equals("103")){ %>selected<%} %>>대전</option>
      <option value="104" <%if(areacode.equals("104")){ %>selected<%} %>>부산</option>
      <option value="105" <%if(areacode.equals("105")){ %>selected<%} %>>광주</option>
      <option value="106" <%if(areacode.equals("106")){ %>selected<%} %>>울산</option>
      <option value="107" <%if(areacode.equals("107")){ %>selected<%} %>>대구</option>
      <option value="108" <%if(areacode.equals("108")){ %>selected<%} %>>강원</option>
      <option value="109" <%if(areacode.equals("109")){ %>selected<%} %>>경상</option>
      <option value="110" <%if(areacode.equals("110")){ %>selected<%} %>>충청</option>
      <option value="111" <%if(areacode.equals("111")){ %>selected<%} %>>제주</option>      
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

 <%   
 }
    }catch(Exception e){
    	e.printStackTrace();
    }
%>
</form>


</section>
<%@ include file="footer.jsp" %>
</body>
</html>