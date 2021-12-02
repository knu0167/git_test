<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConnection.jsp" %>

<%
    // 넘어온 값 저장
    request.setCharacterEncoding("UTF-8");

    int custno = Integer.parseInt(request.getParameter("custno"));   
    String custname = request.getParameter("custname");
    String phone = request.getParameter("phone");
    String address = request.getParameter("address");
    String joindate = request.getParameter("joindate");
    String grade = request.getParameter("grade");
    String city = request.getParameter("city");
    
    sql  = "UPDATE MEMBER_TBL ";
    sql += " SET PHONE=?, ADDRESS=?, GRADE=?, CITY=? "; 
    sql += " WHERE CUSTNO =? ";
    pstmt = conn.prepareStatement(sql);
    
    pstmt.setString(1, phone);
    pstmt.setString(2, address);
    pstmt.setString(3, grade);
    pstmt.setString(4, city);
    pstmt.setInt(5, custno);
    
    pstmt.executeUpdate();
    
    pstmt.close();
    conn.close();
    
    String tourl = "./list.jsp";
    
    response.sendRedirect(tourl);
   
%>