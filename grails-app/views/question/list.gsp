
<%@ page import="chineseweb.Question" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
	<title>Quiz Questions</title>
	<script	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
	</head>
	<body>
		<a href="#list-question" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link controller="lesson" action="show" id="${lessonInstance.id}">Lesson</g:link>
				<li><a class="create" id="new-question">New Question</a></li>
			</ul>
		</div>
		
		<div id="list-question" class="content scaffold-list" role="main">
			<h1>Quiz Questions</h1>
			<br/>
			<g:if test="${flash.message}">
				<div class="message" role="status">${flash.message}</div>
			</g:if>
			<table id="questionTable">
			<thead>
					<tr>
					
						<th>No. </th>
						<th>Question</th>
						<th></th>
					
					</tr>
				</thead>
				<tbody>
				<g:each in="${list}" status="i" var="questionInstance">
					<tr id="${questionInstance.id}" class="${(i % 2) == 0 ? 'even' : 'odd'}">
					
						<td>${questionInstance.questionNo}</td>
						<td><a class="showQuestion">${questionInstance.questionText}</a></td>
						<td>
							<g:form url="[resource:questionInstance, action:'delete']"
			method="DELETE">
			
				<input type="button" value="Edit" class="editQuestion"/>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			
		</g:form>
						</td>
					</tr>
				</g:each>
				</tbody>
			</table>
		</div>
		<div id="questionDialog">
		</div>
		<script>
		$(function(){
			$("#questionTable").dataTable();
			$("#questionDialog").dialog({
				model:true,
				width:"80%",
				height:$(window).height()*0.8,
				autoOpen:false	
				});
			$("#new-question").click(function(){
				$.ajax({
					url:"/ChineseWeb/question/create",
					data:{lessonId:"${lessonInstance.id}"},
					success:function(data,textStatus){
							$("#questionDialog").html(data);
						},
					error:function(XMLHttpRequest,textStatus,errorThrown){}
					});
				$("#questionDialog").dialog("open");
				});
			$("#questionTable").on("click",".editQuestion",function(){
				var id=$(this).parents("tr:first").prop("id");
				$.ajax({
					url:"/ChineseWeb/question/edit/"+id,
					success:function(data,textStatus){
							$("#questionDialog").html(data);
						},
					error:function(XMLHttpRequest,textStatus,errorThrown){}
					});
				$("#questionDialog").dialog("open");
				});
			$("#questionTable").on("click",".showQuestion",function(){
				var id=$(this).parents("tr:first").prop("id");
				$.ajax({
					url:"/ChineseWeb/question/show/"+id,
					success:function(data,textStatus){
							$("#questionDialog").html(data);
						},
					error:function(XMLHttpRequest,textStatus,errorThrown){}
					});
				$("#questionDialog").dialog("open");
				});
			});
	</script>
	</body>
	
</html>
