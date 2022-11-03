<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<%@ include file="dbconn.jsp" %>

<%
    String areacode=request.getParameter("areacode");
    String areaname=request.getParameter("areaname");
    PreparedStatement pstmt=null;
    try{
    	String sql="insert into area1102 values(?,?)";
    	pstmt=conn.prepareStatement(sql);
    	pstmt.setString(1, areacode);
    	pstmt.setString(2, areaname);
    	pstmt.executeUpdate();
    	%>
    	<script>
    	  alert("등록이 완료 되었습니다.");
    	  location.href="areaselect.jsp";
    	</script>
    	<%
    }catch(Exception e){
    	System.out.println("저장 실패");
    	e.printStackTrace();
    }
%>
</body>
</html>