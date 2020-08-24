<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec"%>

<%@ include file="include/header.jsp"%>
	
<!-- Home Section -->
<section id="home" class="main-home parallax-section">
     <div class="overlay"></div>
     <div id="particles-js"></div>
     <div class="container">
          <div class="row">
               <div class="col-md-12 col-sm-12">
                    <h1>Welcome Develop Blog!</h1>
                    <h4>Responsive Blog HTML CSS Website Template</h4>
               </div>
          </div>
     </div>
</section>

<%@ include file="include/footer.jsp"%>
<script src="<c:url value="../resources/js/particles.min.js"/>"></script>
<script src="<c:url value="../resources/js/app.js"/>"/></script>