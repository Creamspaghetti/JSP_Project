<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>게시판 | 쇼핑하조</title>
<style>
table {
	margin: 0 auto;
	width: 900px;
}
</style>
</head>
<body>
	<c:set var="board" value="${requestScope.board }" />
	<div>
		<table style="width: 900px; border: 0px;">
			<tr align="center" valign="middle">
				<td>
					<h3>MVC 게시판</h3>
				</td>
			</tr>
		</table>
		<table border="1" style="border-collapse: collapse;">
			<tr height="30px">
				<th align="center" width="150px">제 목</th>
				<td>${board.boardtitle } 
					<span style="font-weight: bold; color: #6a1b9a; float: right;">
						조회수 : ${board.boardreadcount } 
					</span>
				</td>
			</tr>
			<tr height="30px">
				<th align="center" width="150px">글쓴이</th>
				<td>${board.username }</td>
			</tr>
			<tr height="300px">
				<th align="center" width="150px">내 용</th>
				<td valign="top" style="padding: 10px;">
					${board.boardcontents }
				</td>
			</tr>
		</table>
		<table style="border: 0px;">
			<tr align="right" valign="middle">
				<td>
					<a href="/board/BoardList.bo">[목록]</a>
				</td>
			</tr>
		</table>

		<!-- 댓글 -->
		<form name="replyForm" action="/board/AddReply.bo" method="post">
			<input type="hidden" name="boardnum" value="${board.boardnum }">
			<table>
				<tr>
					<td align="center" width="200px">댓 글 <br>
						<hr> 
						이름 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp; <input name="username" maxlength="10" size="10"> 
						<br> 
						비밀번호 <input name="password" type="password" size="10">
					</td>
					<td style="padding-left: 10px">
						<textarea name="replycontents" style="width: 680px; height: 85px; resize: none;"></textarea> 
						<br>
						<a href="javascript:document.replyForm.submit()">[등록]</a>
					</td>
				</tr>
			</table>

			<!-- 댓글 리스트 -->
			<hr>
			<table border="1">
				<tr>
					<td align="center" width="200px"></td>
					<td valign="top" style="padding-left: 10px;">
						<textarea style="text-align: left; border: 0px; width: 680px; height: 85px; resize: none;" name="" id="" readonly></textarea>
                  		<br> 
                  		<a id="" href="">[수정]</a> &nbsp;&nbsp;&nbsp;
						<a id="" href="">[수정 하기]</a> &nbsp;&nbsp;&nbsp; 
						<a id="" href="">[삭제]</a>
					</td>
				</tr>
			</table>
		</form>
	</div>
</body>
</html>