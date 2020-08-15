<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>
<%@ page import="org.springframework.security.core.context.SecurityContextHolder" %>
<%@ page import="org.springframework.security.core.Authentication" %>
<%@ page import="org.yona.login.LoginVO" %>

<%--	로그인 정보 확인 	
<%
	Authentication auth = SecurityContextHolder.getContext().getAuthentication();
	Object principal = auth.getPrincipal();
	
	String username="";
	
	if ( principal instanceof LoginVO ) System.out.println(" VO Object ");
	else System.out.println(" No VO Object " + principal.getClass().toString());
	
	if ( principal != null && principal instanceof LoginVO ){
		username = ((LoginVO)principal).getUsername();
		System.out.println(" VO Object : " + username);
	}else {
		username = (String)principal ;
		System.out.println(" String Object : " + username);
	}	
%> --%>

<%@ include file="include/header.jsp"  %>

<sec:authorize access="isAnonymous()">
   <h5><a href="/signin">로그인</a></h5>
   <h5><a href='<c:url value="/signup"/>'>SignUp</a></h5>
</sec:authorize>
<sec:authorize access="isAuthenticated()">
	<a href="#" onclick="document.getElementById('logout-form').submit();">로그아웃</a>
	<form id="logout-form" action="/logout" method="post">
		<input name="${_csrf.parameterName}" type="hidden" value="${_csrf.token}"/>
	</form>

   <p><sec:authentication property="principal.username"/>${username }님, 반갑습니다.</p>
</sec:authorize>

<a href='<c:url value="/"/>'>GUEST</a>
<a href='<c:url value="/user/main"/>'>USER</a>
<sec:authorize access="hasRole('ROLE_ADMIN')">
	<a href='<c:url value="/admin/main"/>'>ADMIN</a>
</sec:authorize>

<%@ include file="include/footer.jsp" %>

<script>
	var result = '${msg}';
	
	if(result == 'register'){
		alert("환영합니다 로그인해주세요");
	}
		
</script>
