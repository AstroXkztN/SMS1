<html>
<body>
	<div id="loginDiv">
		<div class="col-md-4 col-md-offset-4" id="loginWindow">
			<br>
				<h3 class="section-title">Forgot Password</h3>
				          	
				<form>
					<div class="row text-left">
						<div class="form-group col-md-12">
						    <div class="col-md-10">
						    	<input type="email" class="form-control" id="txtEmail" aria-describedby="textEmail" placeholder="Enter email" maxlength="40"/>
						    </div>
						    	
						    <div class="col-md-2">
						    	<input type="button" id="btnEmail" class="btn btn-primary" value="Send" style="margin-left: -15px;"/>
						    </div>
						   </div>
					</div>
					    
					<div class="row text-center">
						<input type="button" id="btnCancel" class="btn btn-danger" value="Cancel" />
					</div>
				</form>
				<br>
		</div>
	</div><!--/.loginDiv  -->

</body>
<script type="text/javascript">
	try{
		function email(){
			new Ajax.Request("${pageContext.request.contextPath}/login", {
				method: "GET",
				parameters : {
					action : "emailSent",
					email : $F("txtEmail")
				},
				 onComplete : function(response){
					 /* $("loginDiv").update(response.responseText); */
					 var resp = response.responseText;
					 if(resp == "emailNull"){
						 swal("Oops", "Please enter an email!","error");
					 }else if(resp == "emailInactive"){
						 swal("Oops", "Email not in database!","error");
					 }else{
						 $("loginDiv").update(response.responseText);
					 }
				}  
			});
		}//email()
		$("btnEmail").observe("click", email);
		
		function cancel(){
			new Ajax.Request("${pageContext.request.contextPath}/login", {
				method: "GET",
				parameters : {
					action : "cancel"	
				},
				onComplete : function(response){
					$("mainDiv").update(response.responseText);
				}
			});
		}//cancel()
		$("btnCancel").observe("click", cancel);
	}catch(e){
		alert("forgot.jsp: "+e);
	}
	
</script>
</html>