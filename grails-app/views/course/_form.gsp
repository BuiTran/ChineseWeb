<%@ page import="chineseweb.Course" %>



<div class="fieldcontain ${hasErrors(bean: courseInstance, field: 'courseTitle', 'error')} required">
	<label for="courseTitle">
		Course Title: 
		<span class="required-indicator">*</span>
	</label>
	<g:textField name="courseTitle" required="" value="${courseInstance?.courseTitle}"/>

</div>

<g:hiddenField name="courseId" value="${courseInstance.courseCode}"/>