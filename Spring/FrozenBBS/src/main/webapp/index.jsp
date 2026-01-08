<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- 예전 model2엔 <%@page import="frozen.board.dto.BoardDTO"%>가 있었는데 Spring으로 바꾸면서 없음--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>메인 페이지</title>
    <!-- 헤드 -->
    <jsp:include page="/WEB-INF/views/common/head_tag.jsp"/>

    <!-- 부트스트랩 CSS를 CDN방식으로 다운로드 -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
          integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
</head>

<body class="w3-theme-l5">

<!-- Navbar -->
<jsp:include page="/WEB-INF/views/common/navbar.jsp"/>

<!-- Page Container -->
<div class="w3-container w3-content"
     style="max-width: 1400px; margin-top: 80px">
    <!-- The Grid -->
    <div class="w3-row">

        <!-- Left Column -->
        <jsp:include page="/WEB-INF/views/common/left_column.jsp"/>

        <!-- Middle Column -->
        <div class="w3-col m7">

            <!-- 이전 보드에서는 todo 게시판이 아니고 내용 중심 메모 작성 폼이였음 -->
            <div class="w3-row-padding">
                <div class="w3-col m12">
                    <div class="w3-card w3-round w3-white">

                        <div class="w3-container w3-padding">
                            <h6 class="w3-opacity">오늘 있었던 일은?</h6>

                            <form method="POST" action="/todo/register"
                                  style="position: relative; padding-right: 120px; padding-bottom: 20px">

                                <input type="text" name="content" placeholder="오늘의 기분은?"
                                       class="w3-border w3-padding"
                                       style="width: 100%; padding: 10px; margin-bottom: 30px;"/> <input
                                    type="text" name="title" placeholder="제목이 있으시면 적어주세요"
                                    class="w3-border w3-padding"
                                    style="width: 70%; padding: 10px; margin-bottom: 10px;"/>

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
            <!-- 예제표시 : 추후 DB의 일부를 읽어와서 표시할 예정 -->
            <c:if test="${loginData == null}">

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
            <c:if test="${loginData != null}">

                <div class="w3-container w3-card w3-white w3-round w3-margin"
                     style="width: 95%;">

                    <table class="w3-table w3-bordered w3-striped w3-hoverable">
                            <%--<tr>
                                <th width="10%">번호</th>
                                <th width="*">제목</th>
                                <th width="15%">작성자</th>
                                <th width="10%">조회수</th>
                                <th width="15%">작성일</th>
                                <th width="8%">첨부</th>
                            </tr>--%>

                        <thead>
                        <tr>
                            <th scope="col">Tno</th>
                            <th scope="col">Title</th>
                            <th scope="col">Writer</th>
                            <th scope="col">DueDate</th>
                            <th scope="col">Finished</th>
                        </tr>
                        </thead>

                        <tbody>
                        <c:choose>
                        <c:when test="${empty responseDTO.dtoList}">
                        <tr>
                            <td colspan="6" align="center">홈화면에서 아직도 게시물이 안보이니 왼쪽 위에 할 일 목록(/todo/list)를 클릭해주세요</td>
                        </tr>
                        </c:when>

                        <c:otherwise>
                        <c:forEach items="${responseDTO.dtoList}" var="dto">
                        <tr align="center">
                            <th scope="row">${dto.tno}</th>
                            <td><a href="/todo/read?tno=${dto.tno}&${pageRequestDTO.link}" class="text-decoration-none">
                                    ${dto.title}</a></td>
                            <td>${dto.writer}</td>
                            <td>${dto.dueDate }</td>
                            <td>${dto.finished}</td>

                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                        <tbody>
                    </table>

                </div>

                <div class="float-end">
                    <ul class="pagination flex-wrap">
                        <c:if test="${responseDTO.prev}">
                            <li class="page-item">
                                <a class="page-link" data-num="${responseDTO.start-1}">이전</a>
                            </li>
                        </c:if>
                        <c:forEach begin="${responseDTO.start}"
                                   end="${responseDTO.end}"
                                   var="num">
                            <li class="page-item ${responseDTO.page == num ? "active":""}">
                                <a class="page-link" data-num="${num}">${num}</a>
                            </li>
                        </c:forEach>
                        <c:if test="${responseDTO.next}">
                            <li class="page-item">
                                <a class="page-link" data-num="${responseDTO.end+1}">다음</a>
                            </li>
                        </c:if>
                    </ul>
                </div>


            </c:if>

            <!-- End Middle Column -->
        </div>

        <!-- Right Column -->
        <jsp:include page="/WEB-INF/views/common/right_column.jsp"/>

        <!-- End Grid -->
    </div>

    <!-- End Page Container -->
</div>
<br>

<!-- Footer -->
<jsp:include page="/WEB-INF/views/common/footer.jsp"/>

<!-- 페이지 이동용 searchForm -->
<form action="/todo/list" method="get" id="searchForm"></form>

<!-- Javascript -->
<script src="/js/common.js"></script>

<%-- Flash 메시지가 있을 때만 표시(첫 로그인) --%>
<%-- 지금은 flashMessage에 들어있는게 없으니 하려면 추가해야함
	<c:if test="${not empty sessionScope.flashMessage}">
		<script type="text/javascript"> alert("${sessionScope.flashMessage}"); </script>

		&lt;%&ndash; Flash 메시지를 출력한 후 세션에서 제거 &ndash;%&gt;
		<c:set var="flashMessage" value="${sessionScope.flashMessage}" />
		<c:remove var="flashMessage" />
	</c:if>
--%>

<!-- 부트스트랩 JavaScript를 CDN방식으로 다운로드 -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
        crossorigin="anonymous"></script>
<script>
    document.querySelector(".pagination").addEventListener("click", (e) => {
        e.preventDefault();
        e.stopPropagation();
        // 실제로 클릭한 태그를 target변수에 저장
        const target = e.target;
        // a태그를 누른것이 아니라면 실행 종료
        if (target.tagName !== 'A') {
            return;
        }
        // 페이지 태그에 설정한 페이지 값(data-num) 저장
        const num = target.getAttribute("data-num");

        // 검색에 사용하는 form태그 저장
        // form->id=searchForm으로 변경
        const formObj = document.querySelector("#searchForm");
        console.log(num);

        // form태그에 page데이터를 추가
        formObj.innerHTML += `<input type='hidden' name='page' value='\${num}'/>`;
        formObj.submit();
    })
</script>


</body>
</html>
