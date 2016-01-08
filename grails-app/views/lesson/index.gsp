
<%@ page import="chineseweb.Lesson"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<g:set var="entityName"
	value="${message(code: 'lesson.label', default: 'Lesson')}" />
<title><g:message code="default.list.label" args="[entityName]" /></title>
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

	<g:javascript>
			$(function() {
				$('#tbleLessons').dataTable()
			})
	</g:javascript>
	<a href="#list-lesson" class="skip" tabindex="-1"><g:message
			code="default.link.skip.label" default="Skip to content&hellip;" /></a>
	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="create" action="create">
					<g:message code="default.new.label" args="[entityName]" />
				</g:link></li>
		</ul>
	</div>
	<div id="list-lesson" class="content scaffold-list" role="main">
		<h1>
			<g:message code="default.list.label" args="[entityName]" />
		</h1>
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		<table id="tbleLessons">
			<thead>
				<tr>

					<g:sortableColumn property="lessonNo"
						title="${message(code: 'lesson.lessonNo.label', default: 'Lesson No')}" />

					<g:sortableColumn property="lessonTitle"
						title="${message(code: 'lesson.lessonTitle.label', default: 'Lesson Title')}" />

					<g:sortableColumn property="courseCode"
						title="${message(code: 'lesson.courseCode.label', default: 'Course Code')}" />

				</tr>
			</thead>
			<tbody>
				<g:each in="${lessonInstanceList}" status="i" var="lessonInstance">
					<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

						<td><g:link action="show" id="${lessonInstance.id}">
								${fieldValue(bean: lessonInstance, field: "lessonNo")}
							</g:link></td>

						<td>
							${fieldValue(bean: lessonInstance, field: "lessonTitle")}
						</td>

						<td>
							${fieldValue(bean: lessonInstance, field: "courseCode")}
						</td>

					</tr>
				</g:each>
			</tbody>
		</table>
		<div class="pagination">
			<g:paginate total="${lessonInstanceCount ?: 0}" />
		</div>
	</div>
</body>
</html>
