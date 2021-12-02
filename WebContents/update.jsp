<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%> 

<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConnection.jsp"%>    
<%
   // update.jsp?custno=10003
   //수정할 글번호를 넘겨받는다
   int custno = Integer.parseInt(request.getParameter("custno"));

   //조회
   sql  = "SELECT * FROM MEMBER_TBL";
   sql += " WHERE CUSTNO =? ";
   pstmt = conn.prepareStatement(sql);
   pstmt.setInt(1,custno);
   
   ResultSet rs = pstmt.executeQuery();
   String custname = "";
   String phone = "";
   String address = "";
   String joindate = "";
   String grade = "";
   String city = "";
   
   if(rs.next()){
      custname    = rs.getString("custname");
      phone      = rs.getString("phone");
      address      = rs.getString("address");
      joindate    = rs.getString("joindate");
      grade      = rs.getString("grade");
      city      = rs.getString("city");
   }
   
    // jsp import 단축키 : ctrl+shift+M
    HashMap<String, String> cityMap = new HashMap<>(); 
    cityMap.put("01", "서울");
    cityMap.put("02", "부산");
    cityMap.put("03", "대구");
    cityMap.put("04", "인천");
    cityMap.put("05", "대전");
    cityMap.put("06", "광주");
    cityMap.put("40", "울릉");
    cityMap.put("07", "제주");
    
    String tag  =  "<select name='city'>";
    Iterator<String> keys =  cityMap.keySet().iterator(); 
    while( keys.hasNext()  ) {
       String  strKey   = keys.next();
       String  strValue = cityMap.get(strKey);
      tag += "<option value='" + strKey + "'"; 
      if( strKey.equals(city) ) {
          tag += " selected ";  
      }
      tag += ">";
      tag += strValue;       
      tag += "</option>";       
    }
      tag   += "</select>";
      
      pstmt.close();
      conn.close();
      rs.close();
   
%>    

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
      
      <form action="./updateaction.jsp" method ="POST">
      
      
         <h2>홈쇼핑 회원 수정</h2>
         <table>
            <colgroup>
               <col width="40%">
               <col width="60%">
            </colgroup>
               <tr>
                  <th>회원번호(자동발생)</th>
                  <td><input type="text" name="custno" value="<%= custno %>" readonly/></td> <!-- name속성을 안주면 값이 넘어가지 않는다  -->
               </tr>
               <tr>
                  <th>회원성명</th>
                  <td><input type="text" name="custname" value="<%= custname %>" readonly/></td>
               </tr>
               <tr>
                  <th>회원전화</th>
                  <td><input type="text" name="phone" value="<%= phone %>"/></td>
               </tr>
               <tr>
                  <th>회원주소</th>
                  <td><input type="text" name="address" value="<%= address %>"/></td>
               </tr>
               <tr>
                  <th>가입일자</th>
                  <td><input type="text" name="joindate" value="<%= joindate %>" readonly/></td>
               </tr>
               <tr>
                  <th>고객등급</th>
                  <td>
                     <input type="radio" name="grade" value="A" id="rbvip"
                       <% if(grade.equals("A")) { %>
                    	   checked 
                       <% } %>
                     />
                     <label for="rbvip">VIP</label> &nbsp;
                     <input type="radio" name="grade" value="B" id="rbnomal"
                       <% if(grade.equals("B")) { %>
                    	   checked 
                       <% } %>
                     />
                     <label for="rbvip">일반</label> &nbsp;
                     <input type="radio" name="grade" value="C" id="rbmp"
                       <% if(grade.equals("C")) { %>
                    	   checked 
                       <% } %>
                     />
                     <label for="rbvip">직원</label> &nbsp;
                     <input type="radio" name="grade" value="D" id="rbguest"
                       <% if(grade.equals("D")) { %>
                    	   checked 
                       <% } %>
                     />
                     <label for="rbvip">손님</label> &nbsp;
                  </td>
               </tr>
               <tr>
                  <th>도시코드</th>
                  <td>
                  <%=tag %>
                  </td>
               </tr>
            
            <tbody>                 
         </table>
         
         <div class="btn_group" style="text-align:center">
            <button type="submit">수정</button>
            <button type="button" onclick="history.back();">조회</button>
         </div>
         
         </form>
         
      </div>
   </div>
   
   <%@ include file="bottom.jsp" %>
</body>
</html>