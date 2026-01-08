<%@ page language="java" contentType="text/html; charset=UTF-8"
         pageEncoding="UTF-8" %>

<%-- 예전 model2엔 <%@page import="frozen.board.dto.BoardDTO"%>가 있었는데 Spring으로 바꾸면서 없음--%>
<%@ taglib prefix="c" uri="jakarta.tags.core" %>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>할 일 목록</title>
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

                <!-- 페이지 이동용으로 이거 한줄만 만들어도 동작했었음 : 이제는 밑에 부분으로 해결함 -->
                <%--<form action="/todo/list" method="get" id="searchForm"></form>--%>

                <!-- 검색 부분 : 진짜 searchForm -->
                <div class="w3-row-padding">
                    <div class="w3-col m12">
                        <div class="w3-card w3-round w3-white">

                            <div class="w3-container w3-padding">
                                <h2 class="w3-opacity">할 일 찾기</h2>
                                <hr>

                                <form action="/todo/list" method="get" id="searchForm">
                                    <input type="hidden" name="size" value="${pageRequestDTO.size}">
                                    <div class="mb-3">
                                        <input type="checkbox" name="finished" ${pageRequestDTO.finished?"checked":""}>완료여부
                                    </div>
                                    <div class="mb-3">
                                        <input type="checkbox" name="types" value="t" ${pageRequestDTO.checkType("t")?"checked":""}>제목
                                        <input type="checkbox" name="types" value="w" ${pageRequestDTO.checkType("w")?"checked":""}>작성자
                                        <input type="text" name="keyword" class="form-control" value="${pageRequestDTO.keyword}">
                                    </div>
                                    <div class="input-group mb-3 dueDateDiv">
                                        <input type="date" name="from" class="form-control" value="${pageRequestDTO.from}">
                                        <input type="date" name="to" class="form-control" value="${pageRequestDTO.to}">
                                    </div>
                                    <div class="input-group mb-3">
                                        <div class="float-end">
                                            <button class="btn btn-primary" type="submit">검색</button>
                                            <button class="btn btn-info" type="reset">초기화</button>
                                        </div>
                                    </div>
                                </form>
                            </div>
                        </div>
                    </div>
                </div>


                <!-- 테이블 부분 -->
                <div class="w3-container w3-card w3-white w3-round w3-margin"
                     style="width: 95%;">

                    <table class="w3-table w3-bordered w3-striped w3-hoverable">
                    <%-- 이전 테이블 흔적
                        <tr>
                            <th width="10%">번호</th>
                            <th width="*">제목</th>
                            <th width="15%">작성자</th>
                            <th width="10%">조회수</th>
                            <th width="15%">작성일</th>
                            <th width="8%">첨부</th>
                        </tr>
                    --%>

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
                            <td colspan="6" align="center">등록된 게시물이 없습니다^^*</td>
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

                            <%-- false:미완료, true:완료 추가 2025-12-16 --%>
                            <td>${dto.finished?"완료✔":"미완료❌"}</td>

                        </tr>
                        </c:forEach>
                        </c:otherwise>
                        </c:choose>
                        <tbody>
                    </table>

                </div>

                <!-- 페이지 부분 -->
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


                <!-- 할 일 등록 -->
                <div class="w3-row-padding">
                    <div class="w3-col m12">
                        <div class="w3-card w3-round w3-white">

                            <div class="w3-container w3-padding">
                                <h2 class="w3-opacity">할 일 등록</h2>
                                <hr>

                                <form method="POST" action="/todo/register"
                                      style="position: relative; padding-right: 120px; padding-bottom: 20px">

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">제목(Title)</span>
                                        <input type="text" name="title" placeholder="할 일"
                                               class="form-control""/>
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">작성자(기본값 : ID)</span>
                                        <input type="text" name="writer" placeholder="작성자를 입력하세요 (기본값: 로그인 ID)"
                                               class="w3-border w3-padding"
                                               value="${loginData.id }"  />
                                    </div>

                                    <div class="input-group mb-3">
                                        <span class="input-group-text">마감 기한(dueDate)</span>
                                        <input type="date" name="dueDate" id="dueDate" class="form-control"/ >
                                    </div>


                                    <button type="submit" class="w3-button w3-theme"
                                            style="position: absolute; right: 0; bottom: 0; margin-top: 20px; padding: 10px 20px;">

                                        <i class="fa fa-pencil"></i>할 일 등록
                                    </button>

                                </form>

                            </div>

                        </div>
                    </div>
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
        crossorigin="anonymous">
</script>

<!-- #searchForm 검색 페이지 -->
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


<%-- 오늘을 자동으로 추가하는 스크립트 = 2025-12-16 --%>
<script>
    const today = new Date().toISOString().split('T')[0]; // YYYY-MM-DD
    document.getElementById('dueDate').value = today;
</script>

</body>
</html>
