<!DOCTYPE html>
<html>

<div id="create-course" class="content scaffold-create" role="main">

	<h1>New Course</h1>
	<div>WARNING: COURSE CODE IS NOT CHANGEBLE</div>
	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>

	<g:hasErrors bean="${courseInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${courseInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>

	<g:form controller="course" id="${courseInstance.courseCode}">
		<fieldset class="form">
			<g:render template="form" />
			<div
				class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseCode', 'error')} required">
				<label for="courseCode"> Course Code: <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="courseCode" required=""
					value="${courseInstance?.courseCode}" />
			</div>
			
		</fieldset>
		<fieldset class="buttons">
			<g:actionSubmit name="create" action="save"
				value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</fieldset>
	</g:form>
</div>
</html>