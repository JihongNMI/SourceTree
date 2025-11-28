<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>

<%@page import="frozen.board.dto.BoardDTO"%>
<%@page import="java.util.List"%>

<%@ taglib prefix="c" uri="jakarta.tags.core"%>

<!DOCTYPE html>
<html lang="ko">
<head>
<title>메인 페이지</title>
<!-- 헤드 -->
<jsp:include page="/WEB-INF/common/head_tag.jsp" />
</head>

<body class="w3-theme-l5">

	<!-- Navbar -->
	<jsp:include page="/WEB-INF/common/navbar.jsp" />

	<!-- Page Container -->
	<div class="w3-container w3-content"
		style="max-width: 1400px; margin-top: 80px">
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
								<h6 class="w3-opacity">오늘 있었던 일은?</h6>

								<form method="POST" action="/login.do"
									style="position: relative; padding-right: 120px; padding-bottom: 20px">

									<input type="text" name="content" placeholder="오늘의 기분은?"
										class="w3-border w3-padding"
										style="width: 100%; padding: 10px; margin-bottom: 30px;" /> <input
										type="text" name="title" placeholder="제목이 있으시면 적어주세요"
										class="w3-border w3-padding"
										style="width: 70%; padding: 10px; margin-bottom: 10px;" />


									<button type="submit" class="w3-button w3-theme"
										style="position: absolute; right: 0; bottom: 0; margin-top: 20px; padding: 10px 20px;">

										<i class="fa fa-pencil"></i>제출
									</button>

								</form>

							</div>

						</div>
					</div>
				</div>

				<!-- 로그인 안 했을경우 -->
				<c:if
					test="${empty sessionScope.isLoggedIn || !sessionScope.isLoggedIn}">

					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <img src="/static/w3images/avatar2.png" alt="Avatar"
							class="w3-left w3-circle w3-margin-right" style="width: 60px">
						<span class="w3-right w3-opacity">1 min</span>
						<h4>John Doe</h4>
						<br>
						<hr class="w3-clear">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						<div class="w3-row-padding" style="margin: 0 -16px">
							<div class="w3-half">
								<img
									src="${pageContext.request.contextPath}/static/w3images/lights.jpg"
									style="width: 100%" alt="Northern Lights"
									class="w3-margin-bottom">
							</div>
							<div class="w3-half">
								<img
									src="${pageContext.request.contextPath}/static/w3images/nature.jpg"
									style="width: 100%" alt="Nature" class="w3-margin-bottom">
							</div>
						</div>
						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<button type="button"
							class="w3-button w3-theme-d2 w3-margin-bottom">
							<i class="fa fa-comment"></i>  Comment
						</button>
					</div>

					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <img src="/static/w3images/avatar5.png" alt="Avatar"
							class="w3-left w3-circle w3-margin-right" style="width: 60px">
						<span class="w3-right w3-opacity">16 min</span>
						<h4>Jane Doe</h4>
						<br>
						<hr class="w3-clear">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<button type="button"
							class="w3-button w3-theme-d2 w3-margin-bottom">
							<i class="fa fa-comment"></i>  Comment
						</button>
					</div>

					<div class="w3-container w3-card w3-white w3-round w3-margin">
						<br> <img
							src="${pageContext.request.contextPath}/static/w3images/avatar6.png"
							alt="Avatar" class="w3-left w3-circle w3-margin-right"
							style="width: 60px"> <span class="w3-right w3-opacity">32
							min</span>
						<h4>Angie Jane</h4>
						<br>
						<hr class="w3-clear">
						<p>Have you seen this?</p>
						<img
							src="${pageContext.request.contextPath}/static/w3images/nature.jpg"
							style="width: 100%" class="w3-margin-bottom">
						<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit,
							sed do eiusmod tempor incididunt ut labore et dolore magna
							aliqua. Ut enim ad minim veniam, quis nostrud exercitation
							ullamco laboris nisi ut aliquip ex ea commodo consequat.</p>
						<button type="button"
							class="w3-button w3-theme-d1 w3-margin-bottom">
							<i class="fa fa-thumbs-up"></i>  Like
						</button>
						<button type="button"
							class="w3-button w3-theme-d2 w3-margin-bottom">
							<i class="fa fa-comment"></i>  Comment
						</button>
					</div>

				</c:if>

				<!-- 로그인 했을경우 -->
				<c:if
					test="${not empty sessionScope.isLoggedIn && sessionScope.isLoggedIn}">

					<div class="w3-container w3-card w3-white w3-round w3-margin"
						style="width: 95%;">

						<table class="w3-table w3-bordered w3-striped w3-hoverable">
							<tr>
								<th width="10%">번호</th>
								<th width="*">제목</th>
								<th width="15%">작성자</th>
								<th width="10%">조회수</th>
								<th width="15%">작성일</th>
								<th width="8%">첨부</th>
							</tr>

							<c:choose>
								<c:when test="${empty boardLists}">
									<tr>
										<td colspan="6" align="center">등록된 게시물이 없습니다^^* ${ boardLists.size() }=0</td>

									</tr>
								</c:when>
								
								<c:otherwise>
									<c:forEach items="${boardLists}" var="row" varStatus="loop">
										<tr align="center">
											<td>${map.totalCount - (((map.pageNum-1)*map.pageSize)+loop.index)}</td>
											<td align="left"><a
												href="${pageContext.request.contextPath}/view.do?idx=${row.idx}">${row.title }</a></td>
											<td>${row.name }</td>
											<td>${row.visitcount }</td>
											<td>${row.postdate}</td>
											<td><c:if test="${not empty row.ofile }">
													<a
														href="${pageContext.request.contextPath}/download.do?ofile=${row.ofile}&sfile=${row.sfile}&idx=${row.idx}">
														[다운]
													</a>
												</c:if>
											</td>
										</tr>
									</c:forEach>
								</c:otherwise>
							</c:choose>
						</table>

						<table class="w3-table w3-bordered w3-striped w3-hoverable">
							<tr
								style="display: flex; justify-content: center; align-items: center;">
								<td>${map.pagingImg }</td>
								
							</tr>
						</table>
					</div>

				</c:if>

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

	<%-- Flash 메시지가 있을 때만 표시(첫 로그인) --%>
	<c:if test="${not empty sessionScope.flashMessage}">
		<script type="text/javascript"> alert("${sessionScope.flashMessage}"); </script>

		<%-- Flash 메시지를 출력한 후 세션에서 제거 --%>
		<c:set var="flashMessage" value="${sessionScope.flashMessage}" />
		<c:remove var="flashMessage" />
	</c:if>

</body>
</html>
