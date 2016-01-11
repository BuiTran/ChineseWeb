
<%@ page import="chineseweb.Lesson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<title>${lessonInstance.lessonTitle}</title>
	</head>
	<body>
		<a href="#show-lesson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" controller="course" action="show" id="${course.id}">Lesson List</g:link></li>
				<li><g:link class="create">New Flashcard</g:link></li>
			</ul>
		</div><!-- nav -->
		
		
		<div id="show-lesson" class="content scaffold-show" role="main">
			<h1>${lessonInstance.lessonTitle }</h1>
			
			
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			
			<div id="lessonInfor">
			<ol class="property-list lesson">
			
				<g:if test="${lessonInstance?.lessonNo}">
				<li class="fieldcontain">
					Lesson Number: ${lessonInstance.lessonNo}
					
				</li>
				</g:if>
			
				<g:if test="${lessonInstance?.lessonTitle}">
				<li class="fieldcontain">
					Lesson Title: ${lessonInstance.lessonTitle}
					
				</li>
				</g:if>
			
			</ol>
			</div>
			
			<g:form url="[resource:lessonInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:remoteLink class="edit" action="edit" controller="lesson" update="show-lesson" id="${lessonInstance.id}">Edit</g:remoteLink>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
