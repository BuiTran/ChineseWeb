<g:if test="${course?.verificationCodes}">
	<table id="tbleStudents">
		<thead>
			<tr>

				<th>First Name</th>

				<th>Last Name</th>

				<th>Email</th>

				<th>Verification Code</th>

				<th></th>

			</tr>
		</thead>
		<tbody>
			<g:each in="${course.verificationCodes}" status="i" var="verCode">
				<tr class="${(i % 2) == 0 ? 'even' : 'odd'}">

					<td>
						${verCode.student.firstName}
					</td>

					<td>
						${verCode.student.lastName}
					</td>

					<td>
						${verCode.student.studentEmail}
					</td>

					<td>
						${verCode.code}
					</td>

					<td><g:form controller="course" id="${course.id}"
							method="DELETE">

							<input type="button" value="Remove"
								onclick='
									result = confirm("${message(code: 'default.button.delete.confirm.message', default: 'Are you sure?')}");
									if (result){
									var id="${course.id }";
									$.ajax({
											type:"POST",
												url:"/ChineseWeb/course/removeCode/"+id,
									
												data: {
													verCodeId: ${verCode.id},
												},
												success:function(data,textStatus){
												jQuery("#tbleAjax").html(data);
												},
												error:function(XMLHttpRequest,textStatus,errorThrown){
												}
												
											});
									}' />

						</g:form></td>

				</tr>
			</g:each>
		</tbody>
	</table>
</g:if>
<script>
  $(function(){
		$('#tbleStudents').dataTable();
  });
  </script>