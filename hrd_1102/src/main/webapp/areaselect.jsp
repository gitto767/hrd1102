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
<h3>거주지 정보 목록</h3>
<table class="select2">
  <tr>
    <th>no</th>
    <th>거주지 코드</th>
    <th>거구지 이름</th>
    <th>구분</th>
  </tr>
  <%@ include file="dbconn.jsp" %>
  <%
    PreparedStatement pstmt=null;
    ResultSet rs=null;
    int no=0;
    try{
    	String sql="select areacode,areaname from area1102";
    	pstmt=conn.prepareStatement(sql);
    	rs=pstmt.executeQuery();
    	while(rs.next()){
    		String areacode=rs.getString(1);
    		String areaname=rs.getString(2);
    		no++;
    		%>
    	
  <tr>
    <td><%=no %></td>
    <td><%=areacode %></td>
    <td><%=areaname %></td>
    <td><a href="">수정/삭제</a></td>
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