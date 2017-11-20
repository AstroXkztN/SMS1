<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<html>
<head>
	<!-- Module CSS -->
<script type="text/javascript">var $j = jQuery.noConflict();</script>
	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.4/jquery.min.js"></script>
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/moduleTwo.css">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/css/bootstrap.min.css">
	<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.3.7/js/bootstrap.min.js"></script>
</head>
<body class="skin-blue sidebar-mini" style="height: auto; min-height: 100%;" >
<!-- Content Header (Page header) -->
<div id="subDiv">
    <section class="content-header">
      <h1>
        Account Settings
        <small>Change Password</small>
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Home</li>
        <li class="active">Account Settings</li>
        <li class="active">Change Password</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="callout callout-info">
                <h4>Password Requirements</h4>

                <p>Password should be minimum of 8 and maximum of 20 characters.</p>
              </div>
		<div class="box box-info">
              <div class="box-body">
                <div class="form-group">
                  <label for="txtCurrPassword" class="col-sm-2 control-label">Current Password</label>
                  <div class="col-sm-10">
                    <input type="password" name="form" class="form-control" id="txtCurrPassword" maxlength="100">
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtNewPassword" class="col-sm-2 control-label">New Password</label>

                  <div class="col-sm-10">
                    <input type="password" name="form" class="form-control" id="txtNewPassword" maxlength="100">
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtConfirmPassword" class="col-sm-2 control-label">Confirm Password</label>
                  <div class="col-sm-10">
                    <input type="password" name="form" class="form-control" id="txtConfirmPassword" maxlength="100">
                  </div>
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" id="btnSave" class="btn btn-info pull-right" disabled>Save</button>
              </div>
          </div>
    </section>
</div>


<!-- page script -->
<script>
	var sessionUserID = "${userID}";
	var sessionPassword = "${password}";
	$("btnSave").observe("click",updatePassword);
		function updatePassword(){
			try{
				new Ajax.Request("${pageContext.request.contextPath}/updateuser",{
					method : "get",
					parameters : {
						action : "updatePassword",
						curr_password : $F("txtCurrPassword"),
						new_password : $F("txtNewPassword"),
						last_user : sessionUserID
					} ,
					onComplete : function(response){
						swal("Password Changed", "Password has been successfully updated!","success");
						$("subDiv").update(response.responseText);			 
					}
				});
			}catch(e){
				alert("changePassword.jsp - update password error: " + e);
			}
		}
		function fieldChecker(){
			$$("#btnSave")[0].writeAttribute("disabled","disabled");
			if(($$("#txtCurrPassword")[0].value.length >= 8 &&
				$$("#txtNewPassword")[0].value.length >= 8 &&
				$$("#txtConfirmPassword")[0].value.length >= 8) &&
				($$("#txtNewPassword")[0].value == $$("#txtConfirmPassword")[0].value) &&
				($$("#txtCurrPassword")[0].value == sessionPassword)){
				$$("#btnSave")[0].removeAttribute("disabled");
			}
		}
		( function($) {
			$(document).ready(function(){
				$("#txtCurrPassword").on('keyup',fieldChecker);
				$("#txtNewPassword").on('keyup',fieldChecker);
				$("#txtConfirmPassword").on('keyup',fieldChecker);
			});
		} ) ( jQuery );
		
</script>


</body>
</html>