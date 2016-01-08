
<%@ page import="chineseweb.Lesson" %>
<!DOCTYPE html>
<html>
	<head>
		<meta name="layout" content="main">
		<g:set var="entityName" value="${message(code: 'lesson.label', default: 'Lesson')}" />
		<title><g:message code="default.show.label" args="[entityName]" /></title>
	</head>
	<body>
		<a href="#show-lesson" class="skip" tabindex="-1"><g:message code="default.link.skip.label" default="Skip to content&hellip;"/></a>
		<div class="nav" role="navigation">
			<ul>
				<li><a class="home" href="${createLink(uri: '/')}"><g:message code="default.home.label"/></a></li>
				<li><g:link class="list" action="index"><g:message code="default.list.label" args="[entityName]" /></g:link></li>
				<li><g:link class="create" action="create"><g:message code="default.new.label" args="[entityName]" /></g:link></li>
			</ul>
		</div>
		<div id="show-lesson" class="content scaffold-show" role="main">
			<h1><g:message code="default.show.label" args="[entityName]" /></h1>
			<g:if test="${flash.message}">
			<div class="message" role="status">${flash.message}</div>
			</g:if>
			<ol class="property-list lesson">
			
				<g:if test="${lessonInstance?.lessonNo}">
				<li class="fieldcontain">
					<span id="lessonNo-label" class="property-label"><g:message code="lesson.lessonNo.label" default="Lesson No" /></span>
					
						<span class="property-value" aria-labelledby="lessonNo-label"><g:fieldValue bean="${lessonInstance}" field="lessonNo"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lessonInstance?.lessonTitle}">
				<li class="fieldcontain">
					<span id="lessonTitle-label" class="property-label"><g:message code="lesson.lessonTitle.label" default="Lesson Title" /></span>
					
						<span class="property-value" aria-labelledby="lessonTitle-label"><g:fieldValue bean="${lessonInstance}" field="lessonTitle"/></span>
					
				</li>
				</g:if>
			
				<g:if test="${lessonInstance?.courseCode}">
				<li class="fieldcontain">
					<span id="courseCode-label" class="property-label"><g:message code="lesson.courseCode.label" default="Course Code" /></span>
					
						<span class="property-value" aria-labelledby="courseCode-label"><g:fieldValue bean="${lessonInstance}" field="courseCode"/></span>
					
				</li>
				</g:if>
			
			</ol>
			<g:form url="[resource:lessonInstance, action:'delete']" method="DELETE">
				<fieldset class="buttons">
					<g:link class="edit" action="edit" resource="${lessonInstance}"><g:message code="default.button.edit.label" default="Edit" /></g:link>
					<g:actionSubmit class="delete" action="delete" value="${message(code: 'default.button.delete.label', default: 'Delete')}" onclick="return confirm('${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}');" />
				</fieldset>
			</g:form>
		</div>
	</body>
</html>
