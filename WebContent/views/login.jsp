<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>
<jsp:include page="header.jsp"></jsp:include>
<body class="hold-transition skin-blue sidebar-mini">	
	 
	<div id="mainDiv">
		
		<!--==========================
		Section
		============================-->
		<section id="hero">
			<div class="hero-container">
				<div class="wow fadeIn">
			    	<div class="hero-logo">
			        	<img class="" src="${pageContext.request.contextPath}/img/logo.png" alt="SMS">
			        </div>
			
			        <h1 class="section-title">Supplies Management System</h1>
			        
			        <div id="loginDiv">
				    	<div class="col-md-4 col-md-offset-4" id="loginWindow">
				    		<br>
				    		<h3 class="section-description">LOGIN</h3>
				          	<div class="section-title-divider"></div>
					        	<form>
					        	<div class="row text-left">
						        	<div class="form-group col-md-6">
						        		<label for="txtUserName" style="color: #fff">Username:</label>
						        		<i class="glyphicon glyphicon-user" style="color: #1761a0"></i>
						        		<input type="text" class="form-control" id="txtUserName" aria-describedby="textHelp" placeholder="Enter username" maxlength="40"/>
						        	</div>
						        	
						        	<div class="form-group col-md-6">
						        		<label for="txtPassword" style="color: #fff">Password:</label>
						        		<i class="glyphicon glyphicon-lock" style="color: #1761a0"></i>
						        		<input type="password" class="form-control" id="txtPassword" aria-describedby="passwordHelp" placeholder="Enter password" maxlength="40"/>
						        	</div>
						        	
					        	</div>
					        	<div class="row text-center">
					        		<input type="button" id="btnLogin" class="btn btn-primary rounded-0" value=Login style="margin-top: 10px;width: 135px;"/>
					        		<input type="button" id="btnForgot" class="btn btn-danger" value="Forgot Password" style="margin-top: 10px;margin-left: 5px;" />
							       
							        
					        	</div>
					        	</form>
				        	
				        	<br>
				    	</div>
			    	</div><!--/.loginDiv  -->
			    </div>
			</div>
		</section>
		
		<!--==========================
		Team Section
		============================-->
		<section id="team">
		  <div class="container wow fadeInUp">
		    <div class="row">
		      <div class="col-md-12">
		        <h3 class="section-title">Our Team</h3>
		        <div class="section-title-divider"></div>
		        <p class="section-description">Group Juan Members</p>
		      </div>
		    </div>
		
		    <div class="row">
		      <div class="col-md-2 col-md-offset-1">
		        <div class="member">
		          <div class="pic"><img src="img/amiel.jpg" alt=""></div>
		          <h4>Amiel Palacol</h4>
		          <span>Module 1</span>
		          <div class="social">
		          <a href=""><i class="fa fa-twitter"></i></a>
		          <a href=""><i class="fa fa-facebook"></i></a>
		          <a href=""><i class="fa fa-google-plus"></i></a>
		          <a href=""><i class="fa fa-linkedin"></i></a>
		        </div>
		      </div>
		    </div>
		        
		    <div class="col-md-2">
		      <div class="member">
		        <div class="pic"><img src="img/Kenneth.jpg" alt=""></div>
		        <h4>Kenneth Gutierrez</h4>
		        <span>Module 2</span>
		        <div class="social">
		          <a href=""><i class="fa fa-twitter"></i></a>
		          <a href=""><i class="fa fa-facebook"></i></a>
		          <a href=""><i class="fa fa-google-plus"></i></a>
		          <a href=""><i class="fa fa-linkedin"></i></a>
		        </div>
		      </div>
		    </div>
		
		    <div class="col-md-2">
		      <div class="member">
		        <div class="pic"><img src="img/paul.jpg" alt=""></div>
		        	<h4>Paulino Bandong</h4>
		        	<span>Module 4</span>
		        	<div class="social">
		         		<a href=""><i class="fa fa-twitter"></i></a>
		          		<a href=""><i class="fa fa-facebook"></i></a>
		          		<a href=""><i class="fa fa-google-plus"></i></a>
		          		<a href=""><i class="fa fa-linkedin"></i></a>
		        	</div>
		      </div>
		   </div>
		
		   <div class="col-md-2">
		   		<div class="member">
		            <div class="pic"><img src="img/jem.png" alt=""></div>
		            <h4>Jem Gamban</h4>
		            <span>Module 5</span>
		            <div class="social">
		              <a href=""><i class="fa fa-twitter"></i></a>
		              <a href=""><i class="fa fa-facebook"></i></a>
		              <a href=""><i class="fa fa-google-plus"></i></a>
		              <a href=""><i class="fa fa-linkedin"></i></a>
		            </div>
		        </div>
		   </div>
		
		   <div class="col-md-2">
		   		<div class="member">
		            <div class="pic"><img src="img/ronald.jpg" alt=""></div>
		            <h4>Ronald Magahis</h4>
		            <span>Module 6</span>
		            <div class="social">
		              <a href=""><i class="fa fa-twitter"></i></a>
		              <a href=""><i class="fa fa-facebook"></i></a>
		              <a href=""><i class="fa fa-google-plus"></i></a>
		              <a href=""><i class="fa fa-linkedin"></i></a>
		            </div>
		        </div>
		   </div>
		
		    </div>
		  </div>
		</section>
	</div><!-- mainDiv -->
	
</body>
<script type="text/javascript">
	try{
			
		function login(){
			new Ajax.Request("${pageContext.request.contextPath}/login", {
				method : "POST",
				parameters : {
					action : "login",
				  userName : $F("txtUserName"),
				  password : $F("txtPassword")
				},
				onComplete : function(response){
					$("mainDiv").update(response.responseText);
					
				}
			});
		}//login()
		
		$("btnLogin").observe("click", login);
		
		function forgot(){
			new Ajax.Request("${pageContext.request.contextPath}/login", {
				method : "GET",
				parameters : {
					action : "forgot"
				},
				onComplete : function(response){
					$("loginDiv").update(response.responseText);
				}
			});
		}//forgot()
		
		$("btnForgot").observe("click", forgot);
		
		
		function checkSession(){
			new Ajax.Request("${pageContext.request.contextPath}/login",{
				method : "POST",
				parameters : {
					action : "checkSession"
				},
				onComplete : function(response){
					
					$("mainDiv").update(response.responseText);
				}
			});
		}//checkSession
		
		
		if("${chkSession}" != "Y"){
			checkSession();
		}
		
		
		//VALIDATION FOR LOGIN
		if("${loginMessage}".include("invalid")){
			swal("Invalid Username/Password", "Attempts left: "+"${attempts}","error");
		}else if("${loginMessage}".include("not in database")){
			swal("Oops", "User not found!","error");
			
		}else if("${loginMessage}".include("inactive")){
			swal("Account Locked", "Please contact the Administrator.","error");
		}else if("${isNull}".include("isNull")){
			swal("Oops", "All fields are required!","error");
		}
		
		//VALIDATION FOR FORGOT PASSWORD
		if("${emailStatus}".include("emailActive")){
			swal("Email Sent", "Please check your email!","success");
		}
		
		
		
	}catch(e){
		alert("index.jsp: "+e);
	}
	
	
	
</script>

</html>

