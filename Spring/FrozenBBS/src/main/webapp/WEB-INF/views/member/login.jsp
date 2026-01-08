<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>로그인 페이지</title>
  <!-- Navbar -->
  <jsp:include page="/WEB-INF/views/common/head_tag.jsp" />
</head>

<body class="w3-theme-l5">

  <!-- Navbar -->
  <jsp:include page="/WEB-INF/views/common/navbar.jsp" />

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
	  <!-- The Grid -->
	  <div class="w3-row">
	  
	    <!-- Left Column -->
	    <jsp:include page="/WEB-INF/views/common/left_column.jsp" />
	    
	    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding w3-center">
              <h6 class="w3-opacity">로그인</h6>
              
                <form method="post" action="/member/login">
                  <input type="hidden" name="" value="">

                      <label for="loginid" class="w3-bold">아이디</label>
                      <input name="id" type="text" id="loginid">
              		  <p></p>
                              
                      <label for="pwd" class="w3-bold">비밀번호</label>
                      <input name="pw" type="password" id="pwd">
                      <p></p>
                        
                      <label><input name="rememberme" type="checkbox" value="forever">로그인 유지</label>
                      <button type="submit" class="w3-button w3-theme"> <i class="fa fa-pencil"></i> 로그인</button> 
                      
                      <p></p>

                      <div align="right" class="">
                        <a href="">비밀번호 찾기</a>
                        <a href="/member/join">회원 가입</a>
                      </div>

                </form>
               
            </div>
          </div>
        </div>
      </div>
      
    <!-- End Middle Column -->
    </div>
	    
    <!-- Right Column -->
    <jsp:include page="/WEB-INF/views/common/right_column.jsp" />
    
    <!-- End Grid -->
    </div>
  <!-- End Page Container -->
  </div>
<br>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp" />

<!-- Javascript -->
<script src="/WEB-INF/views/common/js/common.js"></script>

</body>
</html> 
