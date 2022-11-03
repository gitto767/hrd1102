<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="header.jsp" %>
<%@ include file="nav.jsp" %>
<section>
<h3>고객 정보 목록</h3>
<table class="select2">
  <tr>
    <th>no</th>
    <th>고객 아이디</th>
    <th>고객 성명</th>
    <th>관심상품</th>
    <th>전화</th>
    <th>이메일</th>
    <th>거주지 코드</th>
    <th>구분</th>
  </tr>
  <%@ include file="dbconn.jsp" %>
  <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    int no=0;
    try{
    	String sql="select custid,author,goods,phone,email,areacode from customer1102";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String custid=rs.getString(1);
    		String author=rs.getString(2);
    		String goods=rs.getString(3);
    		String phone=rs.getString(4);
    		String email=rs.getString(5);
    		String areacode=rs.getString(6);
    		no++;
    		%>
    	
  <tr>
    <td><%=no %></td>
    <td><a href="customerupdate.jsp?custid=<%=custid%>"><%=custid %></a></td>
    <td><%=author %></td>
    <td><%=goods %></td>
    <td><%=phone %></td>
    <td><%=email %></td>
    <td><%=areacode %></td>
    <td><a href="customerdelete.jsp">삭제</a></td>
  </tr>
  	<%
    	}
    }catch(Exception e){
    	System.out.println("조회실패");
    	e.printStackTrace();
    }
  %>
</table>

</section>
<%@ include file="footer.jsp" %>
</body>
</html>