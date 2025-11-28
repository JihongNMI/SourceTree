<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- 로그인 안했을경우 -->
<c:if test="${empty sessionScope.isLoggedIn || !sessionScope.isLoggedIn}">

<!-- Left Column -->
	<div class="w3-col m3">
	  <!-- Profile -->
	  <div class="w3-card w3-round w3-white">
	    <div class="w3-container">
	     <h4 class="w3-center">My Profile</h4>
	     
	     <p class="w3-center">계속하려면 로그인하세요</p>
	     <hr>
	     
	    </div>
	  </div>
	  <br>
	  
	  <!-- Accordion -->
	  <div class="w3-card w3-round">
	    <div class="w3-white">
	      <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
	      <div id="Demo1" class="w3-hide w3-container">
	        <p>Some text..</p>
	      </div>
	      <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
	      <div id="Demo2" class="w3-hide w3-container">
	        <p>Some other text..</p>
	      </div>
	      <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
	      <div id="Demo3" class="w3-hide w3-container">
	     <div class="w3-row-padding">
	     <br>
	       <div class="w3-half">
	         <img src="${pageContext.request.contextPath}/static/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
	       </div>
	       <div class="w3-half">
	         <img src="${pageContext.request.contextPath}/static/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
	       </div>
	       <div class="w3-half">
	         <img src="${pageContext.request.contextPath}/static/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
	       </div>
	       <div class="w3-half">
	         <img src="${pageContext.request.contextPath}/static/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
	       </div>
	       <div class="w3-half">
	         <img src="${pageContext.request.contextPath}/static/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
	       </div>
	       <div class="w3-half">
	         <img src="${pageContext.request.contextPath}/static/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
	       </div>
	     </div>
	      </div>
	    </div>      
	  </div>
	  <br>
	  
	  <!-- Interests --> 
	  <div class="w3-card w3-round w3-white w3-hide-small">
	    <div class="w3-container">
	      <p>Interests</p>
	      <p>
	        <span class="w3-tag w3-small w3-theme-d5">News</span>
	        <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
	        <span class="w3-tag w3-small w3-theme-d3">Labels</span>
	        <span class="w3-tag w3-small w3-theme-d2">Games</span>
	        <span class="w3-tag w3-small w3-theme-d1">Friends</span>
	        <span class="w3-tag w3-small w3-theme">Games</span>
	        <span class="w3-tag w3-small w3-theme-l1">Friends</span>
	        <span class="w3-tag w3-small w3-theme-l2">Food</span>
	        <span class="w3-tag w3-small w3-theme-l3">Design</span>
	        <span class="w3-tag w3-small w3-theme-l4">Art</span>
	        <span class="w3-tag w3-small w3-theme-l5">Photos</span>
	      </p>
	    </div>
	  </div>
	  <br>
	  
	  <!-- Alert Box -->
	  <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
	    <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
	      <i class="fa fa-remove"></i>
	    </span>
	    <p><strong>Hey!</strong></p>
	    <p>계속하시려면 로그인</p>
	  </div>
	
	<!-- End Left Column -->
	</div>

</c:if>

<!-- 로그인 했을경우 -->
<c:if test="${not empty sessionScope.isLoggedIn && sessionScope.isLoggedIn}">

<!-- Left Column -->
<div class="w3-col m3">
  <!-- Profile -->
  <div class="w3-card w3-round w3-white">
    <div class="w3-container">
     <h4 class="w3-center">My Profile</h4>
     <p class="w3-center">
	     <img src="${pageContext.request.contextPath}/static/w3images/avatar3.png" class="w3-circle" style="height:106px;width:106px" alt="Avatar">
	 </p>
     <p class="w3-center">${sessionScope.UserName}</p>
     <hr>
     <p><i class="fa fa-pencil fa-fw w3-margin-right w3-text-theme"></i> ID : ${sessionScope.UserId}</p>
     <p><i class="fa fa-home fa-fw w3-margin-right w3-text-theme"></i> 오늘 기분 : ${sessionScope.UserMood}</p>
     <p><i class="fa fa-birthday-cake fa-fw w3-margin-right w3-text-theme"></i> >${sessionScope.UserRegidate}</p>
    </div>
  </div>
  <br>
  
  <!-- Accordion -->
  <div class="w3-card w3-round">
    <div class="w3-white">
      <button onclick="myFunction('Demo1')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-circle-o-notch fa-fw w3-margin-right"></i> My Groups</button>
      <div id="Demo1" class="w3-hide w3-container">
        <p>Some text..</p>
      </div>
      <button onclick="myFunction('Demo2')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-calendar-check-o fa-fw w3-margin-right"></i> My Events</button>
      <div id="Demo2" class="w3-hide w3-container">
        <p>Some other text..</p>
      </div>
      <button onclick="myFunction('Demo3')" class="w3-button w3-block w3-theme-l1 w3-left-align"><i class="fa fa-users fa-fw w3-margin-right"></i> My Photos</button>
      <div id="Demo3" class="w3-hide w3-container">
     <div class="w3-row-padding">
     <br>
       <div class="w3-half">
         <img src="/static/w3images/lights.jpg" style="width:100%" class="w3-margin-bottom">
       </div>
       <div class="w3-half">
         <img src="/static/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
       </div>
       <div class="w3-half">
         <img src="/static/w3images/mountains.jpg" style="width:100%" class="w3-margin-bottom">
       </div>
       <div class="w3-half">
         <img src="/static/w3images/forest.jpg" style="width:100%" class="w3-margin-bottom">
       </div>
       <div class="w3-half">
         <img src="/static/w3images/nature.jpg" style="width:100%" class="w3-margin-bottom">
       </div>
       <div class="w3-half">
         <img src="/static/w3images/snow.jpg" style="width:100%" class="w3-margin-bottom">
       </div>
     </div>
      </div>
    </div>      
  </div>
  <br>
  
  <!-- Interests --> 
  <div class="w3-card w3-round w3-white w3-hide-small">
    <div class="w3-container">
      <p>Interests</p>
      <p>
        <span class="w3-tag w3-small w3-theme-d5">News</span>
        <span class="w3-tag w3-small w3-theme-d4">W3Schools</span>
        <span class="w3-tag w3-small w3-theme-d3">Labels</span>
        <span class="w3-tag w3-small w3-theme-d2">Games</span>
        <span class="w3-tag w3-small w3-theme-d1">Friends</span>
        <span class="w3-tag w3-small w3-theme">Games</span>
        <span class="w3-tag w3-small w3-theme-l1">Friends</span>
        <span class="w3-tag w3-small w3-theme-l2">Food</span>
        <span class="w3-tag w3-small w3-theme-l3">Design</span>
        <span class="w3-tag w3-small w3-theme-l4">Art</span>
        <span class="w3-tag w3-small w3-theme-l5">Photos</span>
      </p>
    </div>
  </div>
  <br>
  
  <!-- Alert Box -->
  <div class="w3-container w3-display-container w3-round w3-theme-l4 w3-border w3-theme-border w3-margin-bottom w3-hide-small">
    <span onclick="this.parentElement.style.display='none'" class="w3-button w3-theme-l3 w3-display-topright">
      <i class="fa fa-remove"></i>
    </span>
    <p><strong>Hey!</strong></p>
    <p>People are looking at your profile. Find out who.</p>
  </div>

<!-- End Left Column -->
</div>

</c:if>
