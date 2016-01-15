
<%@ page import="chineseweb.Question"%>
<!DOCTYPE html>
<html>
	<div id="show-question" class="content scaffold-show" role="main">
		<h1>
			<g:if
					test="${questionInstance?.questionNo}">

					${questionInstance.questionNo}. 

				</g:if> <g:if test="${questionInstance?.questionText}">

					${questionInstance.questionText}

				</g:if>
		</h1>
		
		<g:if test="${flash.message}">
			<div class="message" role="status">
				${flash.message}
			</div>
		</g:if>
		
		<ol style="list-style-type:upper-alpha;">
			<g:if test="${questionInstance?.answers}">
			<g:each in="${questionInstance.answers}" status="i" var="a">
				 
				<li class="fieldcontain">
					<g:if test="${a?.correct}">
						<b>${a.choice}</b>
					</g:if>
					<g:else>${a.choice}</g:else>
					
				</li>	
			</g:each>
		</g:if>
			
		</ol>
		
		
	
	</div>

</html>
