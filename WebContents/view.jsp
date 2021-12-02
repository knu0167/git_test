<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp"%>

<%
    // 넘어온 정보처리
    String custno = request.getParameter("custno"); // 10001
    
    // db 조회 정보 검색 custno = 10001
    sql = "SELECT * FROM MEMBER_TBL WHERE CUSTNO = ? ";
    pstmt = conn.prepareStatement(sql);
    pstmt.setInt(1, Integer.parseInt(custno));
    
    String custname="";
    String phone="";
    String address="";
    String joindate="";
    String grade="";
    String city="";
    
    ResultSet rs = pstmt.executeQuery();
    if(rs.next()) {
        /* int    custno = rs.getInt("custno"); */
    	custname = rs.getString("custname");
    	phone = rs.getString("phone");
    	address = rs.getString("address");
    	joindate = rs.getString("joindate");
    	grade = rs.getString("grade");
    	city = rs.getString("city");
    }
    
    pstmt.close();
    rs.close();
    conn.close();
    

%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css" />
<script>
   window.onload = function() {
	   var btnUpdate = document.getElementById('btnUpdate');
	   btnUpdate.onclick = function() {
		   // 수정페이지로 이동
		   var url = './update.jsp?custno=<%=custno %>';
		   location.href = url;
	   }
	   var btnDelete = document.getElementById('btnDelete');
	   btnDelete.addEventListener('click', function(e) {
		   var url = './deleteaction.jsp?custno=<%=custno %>';
		   location.href = url;
	   })
	   var btnList   = document.getElementById('btnList');
	   btnList.addEventListener('click', function(e) {
		   var url = './list.jsp';
		   location.href = url;
	   })
   }
</script>
</head>
<body>
 <%@ include file="header.jsp" %>
 
 <div class="container">
   <div class="content">
     <h2>홈쇼핑 회원 개인조회 화면</h2>
     <table>
       <colgroup>
         <col width="40%">
         <col width="60%">
       </colgroup>
       <tbody>
         <tr>
           <th>회원번호(자동발생)</th>
           <td><%=custno %></td>
         </tr>
         <tr>
           <th>회원성명</th>
           <td><%=custname %></td>
         </tr>
         <tr>
           <th>회원전화</th>
           <td><%=phone %></td>
         </tr>
         <tr>
           <th>회원주소</th>
           <td><%=address %></td>
         </tr>
         <tr>
           <th>가입일자</th>
           <td><%=joindate %></td>
         </tr>
         <tr>
           <th>고객등급</th>
           <td>
             <%
               String gradeStr="";
               switch(grade) {
               case "A": gradeStr = "VIP"; break;
               case "B": gradeStr = "일반"; break;
               case "C": gradeStr = "직원"; break;
               case "D": gradeStr = "고객"; break;
               }
             %>
             <%=gradeStr %>
           </td>
         </tr>
         <tr>
           <th>도시코드</th>
           <td><%=city %></td>
         </tr>
       </tbody>
     </table>
     <div class="btn_group" style="text-aline:center" >
       <button id="btnUpdate">수정</button>
       <button id="btnDelete">삭제</button>
       <button id="btnList">목록</button>
     </div>
   </div>
 </div>
 
 <%@ include file="bottom.jsp" %>
</body>
</html>