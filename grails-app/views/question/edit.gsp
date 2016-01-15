<%@ page import="chineseweb.Question"%>
<!DOCTYPE html>
<div id="edit-question" class="content scaffold-edit" role="main">
	<h1>
		Edit Question ${questionInstance.questionNo}
	</h1>
	
	<g:if test="${flash.message}">
		<div class="message" role="status">
			${flash.message}
		</div>
	</g:if>
	
	<g:hasErrors bean="${questionInstance}">
		<ul class="errors" role="alert">
			<g:eachError bean="${questionInstance}" var="error">
				<li
					<g:if test="${error in org.springframework.validation.FieldError}">data-field-id="${error.field}"</g:if>><g:message
						error="${error}" /></li>
			</g:eachError>
		</ul>
	</g:hasErrors>
	
	<g:form method="PUT">
		<g:hiddenField name="version" value="${questionInstance?.version}" />
		<fieldset class="form">
			<g:render template="form" />
		</fieldset>
		<fieldset class="buttons">
			<g:submitToRemote id="${questionInstance.id}" controller="question" update="questionDialog" action="update" type="button" value="Update"/>
		</fieldset>
	</g:form>
</div>


