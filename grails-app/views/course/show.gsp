
<%@ page import="chineseweb.Course"%>
<!DOCTYPE html>
<html>
<head>
<meta name="layout" content="main">
<title>course.courseTitle</title>
</head>

<body>

	<div class="nav" role="navigation">
		<ul>
			<li><a class="home" href="${createLink(uri: '/')}"><g:message
						code="default.home.label" /></a></li>
			<li><g:link class="list" action="index">Course List</g:link></li>
			<li><g:link class="create">New Lesson</g:link></li>
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
		<ol class="property-list course">

			<g:if test="${course?.courseTitle}">
				<li class="fieldcontain">Title: ${course.courseTitle}

				</li>
			</g:if>

			<g:if test="${course?.courseCode}">
				<li class="fieldcontain">Course Code: ${course.courseCode}</li>
			</g:if>

			<g:if test="${course?.lessons}">
				<li class="fieldcontain"><span id="lessons-label"
					class="property-label"><g:message
							code="course.lessons.label" default="Lessons" /></span> <g:each
						in="${course.lessons}" var="l">
						<span class="property-value" aria-labelledby="lessons-label"><g:link
								controller="lesson" action="show" id="${l.id}">
								${l?.encodeAsHTML()}
							</g:link></span>
					</g:each></li>
			</g:if>

		</ol>
		<g:form url="[resource:course, action:'delete']" method="DELETE">
			<fieldset class="buttons">
				<g:remoteLink class="edit" update="show-course" action="edit" resource="${course}">
					<g:message code="default.button.edit.label" default="Edit" />
				</g:remoteLink>
				<g:actionSubmit class="delete" action="delete"
					value="${message(code: 'default.button.delete.label', default: 'Delete')}"
					onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
			</fieldset>
		</g:form>
	</div>
</body>
</html>
