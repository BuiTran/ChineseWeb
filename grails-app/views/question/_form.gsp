<%@ page import="chineseweb.Question" %>



<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'answers', 'error')} ">
	<label for="answers">
		<g:message code="question.answers.label" default="Answers" />
		
	</label>
	<g:select name="answers" from="${chineseweb.Answer.list()}" multiple="multiple" optionKey="id" size="5" value="${questionInstance?.answers*.id}" class="many-to-many"/>

</div>

<div class="fieldcontain ${hasErrors(bean: questionInstance, field: 'questionText', 'error')} required">
	<label for="questionText">
		<g:message code="question.questionText.label" default="Question Text" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="questionText" required="" value="${questionInstance?.questionText}"/>

</div>

