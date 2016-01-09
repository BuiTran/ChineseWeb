<!-- Detailed information about the current course -->
<%@ page import="chineseweb.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>course.courseTitle</title>
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
			<li><g:link class="list" controller="course" action="index">Course List</g:link></li>
			<li><g:link controller="lesson" id="${course.id}" action="create" class="create">New Lesson</g:link></li>
		</ul>
	</div>
	<!-- nav -->



	<div id="show-course" class="content scaffold-show" role="main">

		<h1>
			${course.courseTitle}
		</h1>

		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>

		<!-- Basic Information -->
		<ol class="property-list course">

			<g:if test="${course?.courseTitle}">
				<li class="fieldcontain">Title: ${course.courseTitle}

				</li>
			</g:if>

			<g:if test="${course?.courseCode}">
				<li class="fieldcontain">Course Code: ${course.courseCode}</li>
			</g:if>
		</ol>



		<!-- Lesson Table -->
		<g:if test="${course?.lessons}">
			<table id="tbleLessons">

				<thead>
					<tr>

						<th>Lesson Number</th>

						<th>Lesson Title</th>

						<th></th>

					</tr>
				</thead>
				<tbody>
					<g:each in="${course.lessons}" status="i" var="lesson">
						<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

							<td><g:link action="show" controller="lesson"
									id="${lesson.id}">
									${lesson.lessonNo}
								</g:link></td>

							<td>
								${lesson.lessonTitle}
							</td>

							<td><g:form controller="lesson" id="${lesson.id}"
									method="DELETE">

									<g:link class="edit" controller="lesson" action="edit" id=" ${lesson.id}">
										<g:message code="default.button.edit.label" default="Edit" />
									</g:link>
									<g:actionSubmit class="delete" action="delete"
										value="${message(code: 'default.button.delete.label', default: 'Delete')}"
										onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />

								</g:form></td>

						</tr>
					</g:each>
				</tbody>
			</table>
		</g:if>

		<!-- Edit or delete the course -->
		<g:form url="[resource:course, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:remoteLink class="edit" update="show-course" action="edit"
					resource="${course}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:remoteLink>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>


	</div>
	<g:javascript>
			$(function() {
				$('#tbleLessons').dataTable()
			})
	</g:javascript>
</body>
</html>