<!DOCTYPE html>
<html>
<div id="create-lesson" class="content scaffold-create" role="main">
	<h1>
		<g:message code="default.create.label" args="[entityName]" />
	</h1>
	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>
	<g:hasErrors bean="${lessonInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${lessonInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	<g:form controller="lesson" id="${lessonInstance.lessonNo}">
		<fieldset class="form">

			<div
				class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'lessonNo', 'error')} required">
				<label for="lessonNo"> <g:message
						code="lesson.lessonNo.label" default="Lesson No" /> <span
					class="required-indicator">*</span>
				</label>
				<g:textField name="lessonNo" required=""
					value="${lessonInstance?.lessonNo}" />

			</div>

			<g:render template="form" />
		</fieldset>
		<fieldset class="buttons">
			<g:actionSubmit name="create" action="save" class="save"
				value="${message(code: 'default.button.create.label', default: 'Create')}" />
		</fieldset>
	</g:form>
</div>
</html>
