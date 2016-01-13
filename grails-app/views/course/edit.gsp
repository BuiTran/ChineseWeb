<%@ page import="chineseweb.Course" %>
<!DOCTYPE html>
<html>
		<div id="edit-course" class="content scaffold-edit" role="main">
			<h1>Edit ${courseInstance.courseTitle}</h1>
			
			<g:if test="${flash.message}">
			<div  id="courseEdit" class="message" role="status">${flash.message}</div>
			</g:if>
			
			<g:hasErrors bean="${courseInstance}">
			<ul class="errors" role="alert">
				<g:eachError bean="${courseInstance}" var="error">
				<li <g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>>${error.field} has error</li>
				</g:eachError>
			</ul>
			</g:hasErrors>
			
			<g:form controller="course" id="${courseInstance.id}" method="PUT" >
				<g:hiddenField name="version" value="${courseInstance?.version}" />
				<fieldset class="form">
					<g:render template="form"/>
				</fieldset>
				<fieldset class="buttons">
					<g:actionSubmit class="save" action="update" value="${message(code: 'default.button.update.label', default: 'Update')}" />
				</fieldset>
			</g:form>
		</div>
</html>