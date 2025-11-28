<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="ko">
<head>
  <title>로그인 페이지</title>
  <!-- Navbar -->
  <jsp:include page="/WEB-INF/common/head_tag.jsp" />
</head>

<body class="w3-theme-l5">

  <!-- Navbar -->
  <jsp:include page="/WEB-INF/common/navbar.jsp" />

	<!-- Page Container -->
	<div class="w3-container w3-content" style="max-width:1400px;margin-top:80px">    
	  <!-- The Grid -->
	  <div class="w3-row">
	  
	    <!-- Left Column -->
	    <jsp:include page="/WEB-INF/common/left_column.jsp" />
	    
	    <!-- Middle Column -->
    <div class="w3-col m7">
    
      <div class="w3-row-padding">
        <div class="w3-col m12">
          <div class="w3-card w3-round w3-white">
            <div class="w3-container w3-padding">
              <h6 class="w3-opacity">회원가입</h6>
              
              
	           	<!-- bodytext_area -->
				<div class="w3-container w3-padding w3-light-grey w3-round-large ">
				
					<!-- appForm -->
					<form action="/join.do" class="appForm" method="post">
					
						<!-- user_id -->
							<label for="id_lbl" class="w3-container w3-padding">아이디</label>
							<div class="app_content"><input type="text" name="user_id" class="w3-input w3-border w3-round" id="id_lbl" placeholder="아이디를 입력해주세요" required/></div>
						
						<!-- name -->	
							<label for="name_lbl" class="w3-container w3-padding">이름</label>
							<div class="app_content"><input type="text" name="name" class="w3-input w3-border w3-round" id="name_lbl" placeholder="이름을 입력해주세요" required/></div>
						
						<!-- password -->	
							<label for="pwd_lbl" class="w3-container w3-padding">비밀번호</label>
							<div class="app_content"><input type="password" name="password" class="w3-input w3-border w3-round" id="pwd_lbl" placeholder="비밀번호를 입력해주세요" required/></div>
							<label for="pwd2_lbl" class="w3-container w3-padding">비밀번호 확인</label>
							<div class="app_content"><input type="password" class="w3-input w3-border w3-round" id="pwd2_lbl" placeholder="비밀번호를 다시 한번 입력해주세요" required/></div>
					
						<p class="btn_line">
							<button type="submit" class="w3-button w3-theme-d2 w3-margin-bottom">등록</button>
						</p>
						
					</form>
					<!-- //appForm -->
				
				</div>
			<!-- //bodytext_area -->     
		          
            </div>
          </div>
        </div>
      </div>
      
    <!-- End Middle Column -->
    </div>
	    
	    <!-- Right Column -->
		<jsp:include page="/WEB-INF/common/right_column.jsp" />
	    
	  <!-- End Grid -->
	  </div>
	  
	<!-- End Page Container -->
	</div>
	<br>
	
	<!-- Footer -->
	<jsp:include page="/WEB-INF/common/footer.jsp" />

	<!-- Javascript -->
	<script src="/js/common.js"></script>
	
	<script>
    document.querySelector("form").addEventListener("submit", function(event) {
        const password = document.getElementById("pwd_lbl").value;
        const passwordConfirm = document.getElementById("pwd2_lbl").value;

        if (password !== passwordConfirm) {
            alert("비밀번호가 일치하지 않습니다.");
            event.preventDefault();  // 폼 제출을 막음
        }
    });
	</script>

</body>
</html> 
