<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ include file = "DBConnection.jsp" %>

<% 
    String custno = request.getParameter("custno");
    
    sql = "DELETE FROM MEMBER_TBL WHERE CUSTNO = ?";
    pstmt = conn.prepareStatement(sql);
    
    pstmt.setInt(1,Integer.parseInt(custno));
    pstmt.executeUpdate();

    pstmt.close();
    conn.close();
    
    String tourl = "./list.jsp";
    response.sendRedirect(tourl);
%>