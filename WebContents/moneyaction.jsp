<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<link rel="stylesheet" href="css/common.css" />
</head>
<body>
 <%@ include file="header.jsp" %>
 
 <div class="container">
   <div class="content">
   <form action="./money.jsp" method="post">
     <h2>매출정보 추가</h2>
     <table>
       <colgroup>
         <col width="40%">
         <col width="60%">
       </colgroup>
       <tbody>
         <tr>
           <th>고객번호</th>
           <td><input type="text" name="custno" /></td>
         </tr>
         <tr>
           <th>판매번호</th>
           <td><input type="text" name="salenol" /></td>
         </tr>
         <tr>
           <th>단가</th>
           <td><input type="text" name="pcost" /></td>
         </tr>
         <tr>
           <th>수량</th>
           <td><input type="text" name="amount" /></td>
         </tr>
         <tr>
           <th>가격</th>
           <td><input type="text" name="price" /></td>
         </tr>
         <tr>
           <th>상품코드</th>
           <td><input type="text" name="pcode" /></td>
         </tr>
         <tr>
           <th>판매일자</th>
           <td><input type="text" name="sdate" /></td>
         </tr>
       </tbody>
     </table>
     <div class="btn_group" style="text-aline:center" >
       <button type="submit">등록</button>
       <button type="button">취소</button>
     </div>
   </form>
   </div>
 </div>
 
 <%@ include file="bottom.jsp" %>
</body>
</html>