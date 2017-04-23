<%@page import="org.springframework.dao.support.DaoSupport"%>
<%@page import="first.common.signup.MemberVO"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Insert title here</title>
<style>
  table {border: 2px double pink; width:666px}
  td,th{border:1px pink solid ; text-align: center; padding:5px}
</style>

</head>
<body>
 <!--
        1. dao객체 선언한다.
        2. dao쪽의 select하는 메소드를 호출하여 그 결과를 리턴하여 테이블에 예쁘게 출력한다.
    -->
   
    <jsp:useBean id="dao" class="first.common.signup.JDBC_memberDAO" />
    <%
    ArrayList<MemberVO> list = dao.getMemberlist();
    %>
   
    <h2>Member Info</h2>
    <table>
        <tr bgcolor="pink">
        <th>아이디</th><th>이름</th><th>비밀번호</th><th>나이</th><th>주소</th><th>주민번호</th>
        </tr>
    <%
    for(MemberVO vo : list){
    %> 
        <tr>
            <td><%=vo.getId() %></td>
            <td><%=vo.getName() %></td>
            <td><%=vo.getPwd() %></td>
            <td><%=vo.getAge() %></td>
            <td><%=vo.getAddr() %></td>
            <td><%=vo.getJumin1()%> - <%=vo.getJumin2()%></td>
        </tr>
               
    <%
    }
     %>
    </table>

</body>
</html>