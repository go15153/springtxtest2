<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<link rel="stylesheet" href="resources/css/nstyle.css" />
<title>Insert title here</title>
</head>


<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
<%
//컨텍스트메소드 호출
String path=request.getContextPath();

%>

<script>	
function relist() {
	<c:set var="num" value="1"></c:set>//함수에서 주입되는 내용
	var htmltxt="";
	$.ajax({
		type:"post",
		url:"<%=path%>/test/membersList",
		success:function(result){
			
			htmltxt="<table border='1'>";
			for ( var ele in result) {
				console.log(result[ele].id)
				htmltxt=htmltxt+"<tr><td>NO : "+result[ele].deptno+"</td><td>DNAME : "+result[ele].dname+"</td></tr>";
				//htmltxt=htmltxt+'<c:if test="${result[ele].dname == 1}"></c:if>';//이런형식으로 바로 사용가능
				htmltxt=htmltxt+'<c:if test="${num == 1}">';//html에서 표현되는 내용
				htmltxt=htmltxt+"hhhhhhhhhhhh";
				htmltxt=htmltxt+'</c:if>';	
			}
			htmltxt=htmltxt+"</table>";
			$("#display").html(htmltxt);
		}
	});
}
</script>
<script>
function function1()
{
  var variable1=12;
  function2(variable1);
}

function function2(val)
{
  var variableOfFunction1 = val;
  alert(variableOfFunction1);
}


</script>
<body>
<h3>content_view.jsp</h3>
<c:if test="${1==2}">
hh
</c:if>
<table>
	<form action="modify" method="post">
		<input type="hidden" name="bid" value="${content_view.bid }" />
		<tr>
			<td class="left">번호</td>
			<td>${content_view.bid }</td>
		</tr>
		<tr>
			<td class="left">히트</td>
			<td>${content_view.bhit }</td>
		</tr>
		<tr>
			<td class="left">이름</td>
			<td><input type="text" name="bName" value="${content_view.bname }" /> </td>
		</tr>
		<tr>
			<td class="left">제목</td>
			<td><input type="text" name="bTitle" value="${content_view.btitle }" /> </td>
		</tr>
		<tr>
			<td class="left">내용</td>
			<td><textarea name="bContent" rows="10">${content_view.bcontent }</textarea> </td>
		</tr>
		
		<tr>
			<td class="left">첨부</td>
			<td>
				<a href="download?p=resources/upload/&f=${content_view.filesrc }
						&bid=${content_view.bid }"> ${content_view.filesrc } </a>
			</td>
		</tr>
		<tr>
			<td colspan="2">
				<input type="submit" value="수정" /> &nbsp;&nbsp;
				<a href="list">목록보기</a> &nbsp;&nbsp;
				<a href="delete?bid=${content_view.bid }">삭제</a> &nbsp;&nbsp;
				<a href="reply_view?bid=${content_view.bid }">답변</a> &nbsp;&nbsp;
			</td>
		</tr>
	</form>
</table>

<c:if test="${content_view.filesrc ne null }">
	<div >
	<img  border="1" width="100" height="100"
	 src="resources/upload/ ${content_view.filesrc }" alt="" />
	</div>
</c:if>
<hr />
<hr />
<h2>DB접속 컨트롤러 호출</h2>

<a href="javascript:relist();">relist</a> : RE리스트호출 <br />
<hr />
<div id="display"></div>

<hr />
<a href="javascript:function1();">func1</a> : RE리스트호출 <br />


</body>
</html>