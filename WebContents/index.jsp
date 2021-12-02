<%@page import="java.util.Iterator"%>
<%@page import="java.util.HashMap"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
    
<%
    // jsp inport 단축기 ctrl+shift+M
    HashMap<String, String> cityMap = new HashMap<>();
    cityMap.put("01", "서울");
    cityMap.put("02", "부산");
    cityMap.put("03", "대구");
    cityMap.put("04", "인천");
    cityMap.put("05", "대전");
    cityMap.put("06", "광주");
    cityMap.put("40", "울릉");
    cityMap.put("07", "제주");
    
    String tag = "<select name='city'>";
    Iterator<String> keys = cityMap.keySet().iterator();
    while(keys.hasNext()){
    	String strKey = keys.next();
    	String strValue = cityMap.get(strKey);
    	tag += "<option value='" + strKey + "'>";
    	tag += strValue;
    	tag += "</option>";
    }
    tag       += "</select>";
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
   <form action="./action.jsp" method="post">
     <h2>홈쇼핑 회원 등록 화면</h2>
     <table>
       <colgroup>
         <col width="40%">
         <col width="60%">
       </colgroup>
       <tbody>
         <tr>
           <th>회원번호(자동발생)</th>
           <td><input type="text" value="" /></td>
         </tr>
         <tr>
           <th>회원성명</th>
           <td><input type="text" name="custname" /></td>
         </tr>
         <tr>
           <th>회원전화</th>
           <td><input type="text" name="phone" /></td>
         </tr>
         <tr>
           <th>회원주소</th>
           <td><input type="text" name="address" /></td>
         </tr>
         <tr>
           <th>가입일자</th>
           <td><input type="text" name="joindate" /></td>
         </tr>
         <tr>
           <th>고객등급</th>
           <td>
             <input type="radio" name="grade" value="A" id="rdvip" />
             <label for="rdvip" >VIP</label>
             <input type="radio" name="grade" value="B" id="rdnomal" checked />
             <label for="rdnomal" >일반</label>
             <input type="radio" name="grade" value="C" id="rdemp" />
             <label for="rdemp" >직원</label>
             <input type="radio" name="grade" value="D" id="rdguest" />
             <label for="rdguest" >고객</label>
           </td>
         </tr>
         <tr>
           <th>도시코드</th>
           <td><%=tag %></td>
         </tr>
       </tbody>
     </table>
     <div class="btn_group" style="text-aline:center" >
       <button type="submit">등록</button>
       <button type="button" onclick="history.back();">취소</button>
     </div>
   </form>
   </div>
 </div>
 
 <%@ include file="bottom.jsp" %>
</body>
</html>