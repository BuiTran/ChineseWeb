<%@ page import="chineseweb.Lesson" %>



<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'lessonNo', 'error')} required">
	<label for="lessonNo">
		<g:message code="lesson.lessonNo.label" default="Lesson No" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lessonNo" required="" value="${lessonInstance?.lessonNo}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'lessonTitle', 'error')} required">
	<label for="lessonTitle">
		<g:message code="lesson.lessonTitle.label" default="Lesson Title" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="lessonTitle" required="" value="${lessonInstance?.lessonTitle}"/>

</div>

<div class="fieldcontain ${hasErrors(bean: lessonInstance, field: 'courseCode', 'error')} required">
	<label for="courseCode">
		<g:message code="lesson.courseCode.label" default="Course Code" />
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="courseCode" required="" value="${lessonInstance?.courseCode}"/>

</div>

