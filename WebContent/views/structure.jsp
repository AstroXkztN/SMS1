<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt" %>
<!DOCTYPE html>
<html>

<body class="hold-transition skin-blue sidebar-mini" onload="redirect('home')">
<div class="wrapper" id="mainDiv">

  <!-- Main Header -->
  <header class="main-header">

    <!-- Logo -->
    <a class="logo">
      <!-- mini logo for sidebar mini 50x50 pixels -->
      <span class="logo-mini"><b>S</b>MS</span>
      <!-- logo for regular state and mobile devices -->
      <span class="logo-lg"><b>Supplies</b>Management</span>
    </a>

    <!-- Header Navbar -->
    <nav class="navbar navbar-static-top" role="navigation">
      <!-- Sidebar toggle button-->
      <a href="#" class="sidebar-toggle" data-toggle="push-menu" role="button">
        <span class="sr-only">Toggle navigation</span>
      </a>
      
    </nav>
  </header>
  <!-- Left side column. contains the logo and sidebar -->
  <aside class="main-sidebar">

    <!-- sidebar: style can be found in sidebar.less -->
    <section class="sidebar">

      <!-- Sidebar user panel (optional) -->
      <div class="user-panel">
        <div class="pull-left image">
          <img src="${pageContext.request.contextPath}/css/dist/img/avatar5.png" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>${firstname} ${lastname}</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>


      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU PANE</li>
        <!-- Optionally, you can add icons to the links -->
        <li id="btnHome" class="sidePane active"><a href="#"><i class="fa fa-home"></i> <span>Home</span></a></li>
        <c:if test="${accesslevel == 'A'}">
	        <li class="treeview menu-open">
	          <a href="#"><i class="fa fa-wrench"></i> <span>Maintenance</span>
	            <span class="pull-right-container">
	                <i class="fa fa-angle-left pull-right"></i>
	              </span>
	          </a>
	          <ul class="treeview-menu" style="display: block;">
	            <li id="sidebtnUserMaintenance" class="sidePane"><a href="#">User</a></li>
	            <li class="sidePane"><a href="#">Supply Types</a></li>
				<li class="sidePane"><a href="#">Supplies Maintenance</a></li>
	          </ul>
	        </li>
        </c:if>
        <li class="sidePane"><a href="#"><i class="fa fa-pencil-square-o"></i> <span>Supplies</span></a></li>
        <li class="sidePane"><a href="#"><i class="fa fa-pie-chart"></i> <span>Stocks</span></a></li>
      </ul>
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">ACCOUNT SETTINGS</li>
        <!-- Optionally, you can add icons to the links -->
        <li id="btnChangePassword"><a href="#"><i class="fa fa-pencil-square-o"></i> <span>Change Password</span></a></li>
        <li id="btnSignOut"><a href="#"><i class="fa fa-sign-out"></i> <span>Sign out</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="subDiv">
    <!-- Content Header (Page header) -->
    <section class="content-header">
      
      
    </section>

    <!-- Main content -->
    <section class="content container-fluid">


    </section>
    <!-- /.content -->
  </div>
  <!-- /.content-wrapper -->

  <!-- Main Footer -->
  <footer class="main-footer">
    <!-- To the right -->
    <div class="pull-right hidden-xs">
      
    </div>
    <!-- Default to the left -->
    <strong>Copyright &copy; 2017 <a href="#">CPI - Group Juan</a>.</strong> All rights reserved.
  </footer>
</div>
<!-- ./wrapper -->

<!-- REQUIRED JS SCRIPTS -->
 <!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/css/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/css/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/css/dist/js/adminlte.min.js"></script> 
<script type="text/javascript">var $j = jQuery.noConflict();</script> 

</body>
</html>
<script type="text/javascript">
console.log('${accesslevel}');
console.log('${firstname}');
	$("btnHome").observe("click",function(){
		redirect("home");
		activeRemover();
		$$("#btnHome")[0].writeAttribute("class","active");
	});
	$("sidebtnUserMaintenance").observe("click",function(){
		redirect("usermaintenance");
		activeRemover();
		$$("#sidebtnUserMaintenance")[0].writeAttribute("class","active");
	});
	$("btnChangePassword").observe("click",function(){
		redirect("changepassword");
		activeRemover();
		$$("#btnChangePassword")[0].writeAttribute("class","active");
	});
	$("btnSignOut").observe("click",function(){
		activeRemover();
		signout("logout");
	});
	function activeRemover(){
		$$('.sidePane').each(function(x){
			x.removeClassName("active");
		});
	}
	function redirect(page){
		try{
			new Ajax.Request("${pageContext.request.contextPath}/homeserv",{
				method : "get",
				parameters : {
					action : page
				} ,
				onComplete : function(response){
					$("subDiv").update(response.responseText);			 
				}
			});
		}catch(e){
			alert("home.jsp - userMaintenance error: " + e);
		}
		
	}
	redirect("home");
	function signout(page){
		try{
			new Ajax.Request("${pageContext.request.contextPath}/login",{
				method : "post",
				parameters : {
					action : page
				} ,
				onComplete : function(response){
					$("mainDiv").update(response.responseText);			 
				}
			});
		}catch(e){
			alert("home.jsp - userMaintenance error: " + e);
		}
	}
	
</script>