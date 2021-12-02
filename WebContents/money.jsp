<%@page import="java.awt.font.NumericShaper.Range"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file="DBConnection.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css" />
<style>
   td { text-align : center;}
</style>
<script>
   window.onload = function() {

	   var btnMonIsert   = document.getElementById('btnMonIsert');
	   btnMonIsert.addEventListener('click', function(e) {
		   var url = './moneyaction.jsp';
		   location.href = url;
	   })
   }
</script>
</head>
<body>
 <%@ include file="header.jsp" %>
 
 <div class="container">
   <div class="content">
     <h2>회원 매출 조회</h2>
     <table>
       <colgroup>
         <col width="25%">
         <col width="25%">
         <col width="25%">
         <col width="25%">
       </colgroup>
       <thead>
         <tr>
           <th>회원번호</th>
           <th>회원성명</th>
           <th>고객등급</th>
           <th>매출</th>
         </tr>
       </thead>
       <tbody>
         <%  /* 회원정보 list 가져오기 */
           sql  = "SELECT R.CUSTNO, R.CUSTNAME, R.GRADE, SUM(Y.PRICE) as tot";
           sql += " FROM MEMBER_TBL R JOIN MONEY_TBL Y "; 
           sql += " ON R.CUSTNO = Y.CUSTNO ";
           sql += " GROUP BY R.CUSTNO, R.CUSTNAME, R.GRADE ";
          
           pstmt = conn.prepareStatement(sql);
           ResultSet rs = pstmt.executeQuery();
           
           while(rs.next()) { 
        	   
        	   int sum = rs.getInt("tot");
        	   
               String grade = rs.getString("grade");
               switch(grade) {
               case "A": grade = "VIP"; break;
               case "B": grade = "일반"; break;
               case "C": grade = "직원"; break;
               case "D": grade = "손님"; break;
               }
               
               %>
         <tr>
           <td>
             <%=rs.getInt("custno") %>
           </td>
           <td><%=rs.getString("custname") %></td>
           <td><%=grade %></td>
           <td><%=sum %></td>
         </tr>
         <%
           } // while end
           rs.close();
           pstmt.close();
           conn.close();
            %>
         
       </tbody>
     </table>
     <div class="btn_group" style="text-aline:center" >
       <button id="btnMonIsert">추가</button>
     </div>
   </div>
 </div>
 
 <%@ include file="bottom.jsp" %>
</body>
</html>