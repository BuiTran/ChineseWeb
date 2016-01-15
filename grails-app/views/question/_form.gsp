<%@ page import="chineseweb.Question" %>
<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'questionText', 'error')} required">
	<label for="questionText">
		<g:message code="question.questionText.label" default="Question Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="questionText" required="" value="${questionInstance?.questionText}"/>
</div>

<g:each in="${questionInstance.answers}" var="answerInstance" status="i">
<div class="fieldcontain ${hasErrors(bean: answerInstance, field: 'choice', 'error')} required">
	<label for="choice">
		<g:message code="answer.choice.label" default="Choice" />
	</label>
	<g:textField name="${answerInstance.id}" required="" value="${answerInstance?.choice}"/>
	<g:if test="${answerInstance.correct}">
		<g:checkBox name="correct" value="${answerInstance.id}" checked="true"/>
	</g:if>
	<g:else>
		<g:checkBox name="correct" value="${answerInstance.id}" checked="false"/>
	</g:else>
</div>
</g:each>



