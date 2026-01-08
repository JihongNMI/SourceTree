<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!-- 로그인 안했을경우 -->
<c:if test="${loginData == null}">
	<!-- Right Column -->
	<div class="w3-col m2">
	  <div class="w3-card w3-round w3-white w3-center">
	    <div class="w3-container">
	      <p>Upcoming Events:</p>
	      🎁🎁
	      <p><strong>Holiday</strong></p>
	      <p>Friday 15:00</p>
	      <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
	    </div>
	  </div>
	  <br>
	  
	  <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
	    <p>광고</p>
	  </div>
	  <br>
	  
	  <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
	    <p>ADS</p>
	  </div>
	  <br>
	  
	  <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
	    <p><i class="fa fa-bug w3-xxlarge"></i></p>
	  </div>
	  
	<!-- End Right Column -->
	</div>
</c:if>


<!-- 로그인 했을경우 -->
<c:if test="${loginData != null}">
    
	<!-- Right Column -->
	<div class="w3-col m2">
	  <div class="w3-card w3-round w3-white w3-center">
	    <div class="w3-container">
	      <p>Upcoming Events:</p>
	      🎁🎁
		  <p><strong>Holiday</strong></p>
	      <p>Friday 15:00</p>
	      <p><button class="w3-button w3-block w3-theme-l4">Info</button></p>
	    </div>
	  </div>
	  <br>
	  
	  
	  
	  <div class="w3-card w3-round w3-white w3-center">
	    <div class="w3-container">
	      <p>Friend Request</p>
	      ✌✌
	      
	      <span>Jane Doe</span>
	      <div class="w3-row w3-opacity">
	        <div class="w3-half">
	          <button class="w3-button w3-block w3-green w3-section" title="Accept"><i class="fa fa-check"></i></button>
	        </div>
	        <div class="w3-half">
	          <button class="w3-button w3-block w3-red w3-section" title="Decline"><i class="fa fa-remove"></i></button>
	        </div>
	      </div>
	    </div>
	  </div>
	  <br>
	  
	  <div class="w3-card w3-round w3-white w3-padding-16 w3-center">
	    <p>ADS</p>
	  </div>
	  <br>
	  
	  <div class="w3-card w3-round w3-white w3-padding-32 w3-center">
	    <p><i class="fa fa-bug w3-xxlarge"></i></p>
	  </div>
	  
	<!-- End Right Column -->
	</div>

</c:if>