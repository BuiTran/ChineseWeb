 
<%@ page import="chineseweb.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>Course Table</title>
<script
	src="https://cdn.datatables.net/1.10.10/js/jquery.dataTables.min.js"
	type="text/javascript"></script>
<script
	src="https://cdn.datatables.net/1.10.10/js/dataTables.bootstrap.min.js"
	type="text/javascript"></script>
<link rel="stylesheet"
	href="https://cdn.datatables.net/1.10.10/css/dataTables.bootstrap.min.css">
</head>
<body>
	
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><a id="newCourse" class="create"> New Course </a></li>
		</ul>
	</div>
	<div id="list-course" class="content scaffold-list" role="main">
		<h1>Course Table</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table id ="tableCourses">
			<thead>
				<tr>

					<th>Title</th>

					<th>Course Code</th>

					<th></th>


				</tr>
			</thead>

			<tbody>
				<g:each in="${list}" status="i" var="course">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${course.id}">
								${course.courseTitle}
							</g:link></td>

						<td>
							${course.courseCode}
						</td>

						<td id="${course.id}">
						<g:form controller="course" id="${course.id}">
						<input type="button" class="editCourseIndex" value="Edit"/><g:actionSubmit
								class="delete" action="delete"
								value="Delete"
								onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
						</g:form>
						</td>

					</tr>
				</g:each>
				
			</tbody>
		</table>

	</div>
	<div id="courseDialog"></div>
	<script>
	
$(function(){
	$('#tableCourses').dataTable();
	$("#courseDialog").dialog({
		model:true,
		width:"80%",
		height:$(window).height()*0.8,
		autoOpen:false	
		});
	$("#newCourse").click(function(){
		$.ajax({
			url : '/ChineseWeb/course/create',
			success: function(data, textStatus){
				$("#courseDialog").html(data);
				},
			error: function(XMLHttpRequest,textStatus,errorThrown){}
			});
		$("#courseDialog").dialog("open");
			});
	$("#tableCourses").on("click",".editCourseIndex",function(){
		var id=$(this).parents("td:first").prop("id");
		$.ajax({
			url:"/ChineseWeb/course/edit/"+id,
			success:function(data,textStatus){
				$("#courseDialog").html(data);
				},
			error:function(XMLHttpRequest,textStatus,errorThrown){}
			
			});
		$("#courseDialog").dialog("open");
		});
});
</script>
</body>

</html>