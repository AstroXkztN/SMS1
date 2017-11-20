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
        User Maintenance
        <!-- <small>Welcome Kenneth!</small> -->
      </h1>
      <ol class="breadcrumb">
        <li><i class="fa fa-dashboard"></i> Home</li>
        <li class="active">Maintenance</li>
        <li class="active">User</li>
      </ol>
    </section>

    <!-- Main content -->
    <section class="content">
		<div class="box box-info col-sm-10">
              <div class="box-body">
                <div class="form-group">
                  <label for="txtUserID" class="col-sm-2 control-label">User ID</label>
                  <div class="col-sm-10">
                    <input type="hidden" id="txtCurrUserID" disabled>
                    <input type="text" name="form" class="form-control" id="txtUserID" maxlength="20" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtPassword" class="col-sm-2 control-label">Password</label>

                  <div class="col-sm-10">
                    <input type="password" name="form" class="form-control" id="txtPassword" maxlength="100" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtFirstName" class="col-sm-2 control-label">First Name</label>
                  <div class="col-sm-10">
                    <input type="text" name="form" class="form-control" id="txtFirstName" maxlength="50" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtLastName" class="col-sm-2 control-label">Last Name</label>

                  <div class="col-sm-10">
                    <input type="text" name="form" class="form-control" id="txtLastName" maxlength="50" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtMiddleInitial" class="col-sm-2 control-label">Middle Initial</label>
                  <div class="col-sm-10">
                    <input type="text" name="form" class="form-control" id="txtMiddleInitial" maxlength="3" disabled>
                  </div>
                </div>
                <div class="form-group">
                  <label for="txtEmailAddress" class="col-sm-2 control-label">Email Address</label>

                  <div class="col-sm-10">
                    <input type="text" name="form" class="form-control" id="txtEmailAddress" maxlength="100" disabled>
                  </div>
                </div>
				<div class="form-group">
					<label class="col-sm-2 control-label">Active Tag</label>
                  <div class="col-sm-10" class="radio">
					<label>
						<input type="radio" name="activeID" id="rdoActive" value="Y" disabled>
						Yes
					</label>
					<label>
						<input type="radio" name="activeID" id="rdoInactive" value="N" disabled>
						No
					</label>
                  </div>
                </div>
				<div class="form-group">
                  <label class="col-sm-2 control-label">Access Level</label>
                  <div class="col-sm-10">
                    <select id="selAccessLevel" class="form-control" disabled>
                    	<option value="U">User</option>
                    	<option value="A">Admin</option>
                  	</select>
                  </div>
                  
                </div>
              </div>
              <!-- /.box-body -->
              <div class="box-footer">
                <button type="submit" id="btnSave" class="btn btn-info pull-right" disabled>Save</button>
                <button type="submit" id="btnCancel" class="btn btn-default" disabled>Cancel</button>
              </div>
          </div>
		<div class="callout callout-info col-sm-2">
                <h4>Input Field Requirements</h4>
				<p>Save Button will enable once the following requirements are fulfilled:</p>
                <li>ALL fields are required except for Middle Initial.</li>
                <li>User ID doesn't exist in the Users MasterList.</li>
                <li>Password should be minimum of 8 and maximum of 20 characters.</li>
        </div>
        </div>
	<hr>
      <div class="row" id="userTable" style="visibility:visible">
        <div class="col-xs-12">
          

          <div class="box">
            <div class="box-header">
              <h3 class="box-title">Users MasterList</h3>
            </div>
            <!-- /.box-header -->
            <div class="box-body">
              <div id="example2_wrapper" class="dataTables_wrapper form-inline dt-bootstrap">
              	<div class="row">
              		<div class="col-sm-6">
					<input class="btn btn-primary" type="button" id="btnAdd" value="Add New User">
              		</div>
              		<div class="col-sm-6 form-group pull-right" align="right">
              			<label>Search <i class="fa fa-search"></i> <input type="text" class="search form-control input-sm" placeholder="What are you looking for?" aria-controls="example1"></label>
              		</div>
              	</div>
              	<div class="row">
              		<div class="col-sm-12">
              			<table id="example2" class="table table-bordered dataTable" role="grid" aria-describedby="example2_info">
                			<thead>
				                <tr role="row">
									<th class="sorting_asc" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="User ID: activate to sort column descending" style="width: 182px;" aria-sort="ascending">User ID</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="First Name: activate to sort column ascending" style="width: 224px;">First Name</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Last Name: activate to sort column ascending" style="width: 199px;">Last Name</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="M.I.: activate to sort column ascending" style="width: 156px;">M.I.</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Email Address: activate to sort column ascending" style="width: 112px;">Email Address</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Active Tag: activate to sort column ascending" style="width: 112px;">Active Tag</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Access Level: activate to sort column ascending" style="width: 112px;">Access Level</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Entry Date: activate to sort column ascending" style="width: 112px;">Entry Date</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Last Login: activate to sort column ascending" style="width: 112px;">Last Login</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Last Updated By: activate to sort column ascending" style="width: 112px;">Last Updated By</th>
									<th class="sorting" tabindex="0" aria-controls="example2" rowspan="1" colspan="1" aria-label="Last Update: activate to sort column ascending" style="width: 112px;">Last Update</th>
								</tr>
				            </thead>
                <tbody>
				<c:forEach var="i" items="${userTable}">
			        <tr role="row" class="data">
						<td class="sorting_1">
							<c:out value="${i.userID}"/>
						</td>
						<td>
							<c:out value="${i.firstName}"/>
						</td>
						<td>
							<c:out value="${i.lastName}"/>
						</td>
						<td>
							<c:out value="${i.middleInitial}"/>
						</td>
						<td>
							<c:out value="${i.emailAddress}"/>
						</td>
						<td>
							<c:out value="${i.activeTag}"/>
						</td>
						<td>
							<c:out value="${i.accessLevel}"/>
						</td>
						<td>
							<c:out value="${i.entryDate}"/>
						</td>
						<td>
							<c:out value="${i.lastLogin}"/>
						</td>
						<td>
							<c:out value="${i.lastUpdatedBy}"/>
						</td>
						<td>
							<c:out value="${i.lastUpdate}"/>
						</td>
					</tr>
				</c:forEach>
				</tbody>
                <tfoot>
                <tr>
					<th rowspan="1" colspan="1">User ID</th>
					<th rowspan="1" colspan="1">First Name</th>
					<th rowspan="1" colspan="1">Last Name</th>
					<th rowspan="1" colspan="1">M.I.</th>
					<th rowspan="1" colspan="1">Email Address</th>
					<th rowspan="1" colspan="1">Active Tag</th>
					<th rowspan="1" colspan="1">Access Level</th>
					<th rowspan="1" colspan="1">Entry Date</th>
					<th rowspan="1" colspan="1">Last Login</th>
					<th rowspan="1" colspan="1">Last Updated By</th>
					<th rowspan="1" colspan="1">Last Update</th>
				</tr>
                </tfoot>
              </table>
			  </div>
			  </div>
			  
			</div>
            </div>
            <!-- /.box-body -->
          </div>
          <!-- /.box -->
        </div>
        <!-- /.col -->
      </div>
      <!-- /.row -->
    </section>
</div>


<!-- page script -->
<script>
	var sessionUserID = "${userID}";
	var activeTag = "";
	var accessLevel = "";
		$$('tr[class="data"]').each(function(x){
			x.observe("click",function(){
				$$('tr').each(function(y){
					if(x!=y)y.removeClassName("selected");
				});
				x.removeClassName("hoverIn");
				x.addClassName("selected");
				if(x.hasClassName("selected")){
					showData();
				}
			});
			x.observe("mouseover",function(){
				if(x.hasClassName("selected")){
				}else{
					x.addClassName("hoverIn");
				}
			});
			x.observe("mouseout",function(){
				x.removeClassName("hoverIn");
			});
		});
		function showData(){
			$$('tr[class="data selected"]').each(function(a){
				$$("#txtPassword")[0].value = "********";
				$$("#btnAdd")[0].writeAttribute("disabled","disabled");
				$$('input[type="hidden"]')[0].value = a.down(0).innerHTML.trim();
				$$('input[type="text"]')[0].value = a.down(0).innerHTML.trim();
				$$('input[type="text"]')[1].value = a.down(1).innerHTML.trim();
				$$('input[type="text"]')[2].value = a.down(2).innerHTML.trim();
				$$('input[type="text"]')[3].value = a.down(3).innerHTML.trim();
				$$('input[type="text"]')[4].value = a.down(4).innerHTML.trim();
				if(a.down(5).innerHTML.trim() == "Y"){
					$$("#rdoInactive")[0].removeAttribute("checked");
					$$("#rdoActive")[0].writeAttribute("checked","checked");
				}else if(a.down(5).innerHTML.trim() == "N"){
					$$("#rdoActive")[0].removeAttribute("checked");
					$$("#rdoInactive")[0].writeAttribute("checked","checked");
				}
				$("selAccessLevel").value = a.down(6).innerHTML.trim();
				disableRemover();
			});
		}
		$("btnCancel").observe("click",defaultValues);
		function defaultValues(){
			$("userTable").setAttribute('style','visibility:visible');
			$$('input[class="form-control"]').each(function(x){
				x.value = "";
				x.writeAttribute("disabled","disabled");
			});
			$$('input[type="radio"]').each(function(z){
				z.writeAttribute("disabled","disabled");
				z.removeAttribute("checked");
			});
			$$("#txtPassword")[0].value = "";
			$$('select').each(function(y){
				y.selectedIndex = 0;
				y.writeAttribute("disabled","disabled");
			});
			$$("#btnAdd")[0].removeAttribute("disabled");
			$$("#btnSave")[0].writeAttribute("disabled","disabled");
			$$("#btnCancel")[0].writeAttribute("disabled","disabled");
			$$('tr').each(function(y){
				y.removeClassName("selected");
			});
			$("userTable").setAttribute('style','visibility:visible');
			$("userTable").removeClassName('invisible');
		}
		$("btnSave").observe("click",updateUser);
		function updateUser(){
			try{
				new Ajax.Request("${pageContext.request.contextPath}/updateuser",{
					method : "get",
					parameters : {
						action : "updateUser",
						user_id : $F("txtUserID"),
						first_name : $F("txtFirstName"),
						last_name : $F("txtLastName"),
						middle_initial : $F("txtMiddleInitial"),
						email_address : $F("txtEmailAddress"),
						active_tag : document.querySelector('input[name="activeID"]:checked').value,
						access_level : $("selAccessLevel").value,
						last_user : sessionUserID,
						curr_id : $F("txtCurrUserID")
					} ,
					onComplete : function(response){
						swal("User Updated", "User details has been successfully updated!","success");
						$("subDiv").update(response.responseText);			 
					}
				});
			}catch(e){
				alert("userMaintenance.jsp - update error: " + e);
			}
		}
		$("btnAdd").observe("click",addUser);
		function addUser(){
			$("userTable").setAttribute('style','visibility:hidden');
			$("userTable").addClassName('invisible');
			disableRemover();
			$$("#btnSave")[0].writeAttribute("disabled","disabled");
			$$("#rdoActive")[0].writeAttribute("checked","checked");
			$$("#txtPassword")[0].removeAttribute("disabled");
			if($("userTable").hasClassName('invisible')){
				$("btnSave").observe("click",saveUser);
			}
		}
		function fieldChecker(){
			$$("#btnSave")[0].writeAttribute("disabled","disabled");
			if($$("#txtUserID")[0].value != "" && 
				$$("#txtPassword")[0].value.length >= 8 &&
				$$("#txtFirstName")[0].value != "" &&
				$$("#txtLastName")[0].value != "" &&
				$$("#txtEmailAddress")[0].value != ""){
				$$("#btnSave")[0].removeAttribute("disabled");
			}
		}
		function saveUser(){
			try{
				new Ajax.Request("${pageContext.request.contextPath}/updateuser",{
					method : "get",
					parameters : {
						action : "addUser",
						user_id : $F("txtUserID"),
						password : $F("txtPassword"),
						first_name : $F("txtFirstName"),
						last_name : $F("txtLastName"),
						middle_initial : $F("txtMiddleInitial"),
						email_address : $F("txtEmailAddress"),
						active_tag : document.querySelector('input[name="activeID"]:checked').value,
						access_level : $("selAccessLevel").value,
						last_user : sessionUserID
					} ,
					onComplete : function(response){
						$("subDiv").update(response.responseText);			 
					}
				});
			}catch(e){
				alert("userMaintenance.jsp - add error: " + e);
			}
		}
		function disableRemover(){
			$$("#btnSave")[0].removeAttribute("disabled");
			$$("#btnCancel")[0].removeAttribute("disabled");
			$$('input[type="text"]').each(function(x){
				x.removeAttribute("disabled");
			});
			$$("#rdoActive")[0].removeAttribute("disabled");
			$$("#rdoInactive")[0].removeAttribute("disabled");
			$$("#selAccessLevel")[0].removeAttribute("disabled");
		}
		( function($) {
			$(document).ready(function(){
			    $('.search').on('keyup',function(){//id of search bar
			        var searchTerm = $(this).val().toLowerCase();
			        $('#example2 tbody tr').each(function(){ //id of table row
			            var lineStr = $(this).text().toLowerCase();
			            if(lineStr.indexOf(searchTerm) === -1){
			                $(this).hide();
			            }else{
			                $(this).show();
			            }
			        });
			    });
				$("#txtUserID").on('keyup',fieldChecker);
				$("#txtPassword").on('keyup',fieldChecker);
				$("#txtFirstName").on('keyup',fieldChecker);
				$("#txtLastName").on('keyup',fieldChecker);
				$("#txtMiddleInitial").on('keyup',fieldChecker);
				$("#txtEmailAddress").on('keyup',fieldChecker);
			});
		} ) ( jQuery );
		
</script>


</body>
</html>