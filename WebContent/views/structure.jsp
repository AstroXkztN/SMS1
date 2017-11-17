<!DOCTYPE html>
<!--
This is a starter template page. Use this page to start your new project from
scratch. This page gets rid of all links and provides the needed markup only.
-->
<html>
<head>
	<%-- <script src="${pageContext.request.contextPath}/js/prototype.js"></script> --%>
  <meta charset="utf-8">
  <meta http-equiv="X-UA-Compatible" content="IE=edge">
  <title>Supplies Management System</title>
  <%-- <!-- Tell the browser to be responsive to screen width -->
  <meta content="width=device-width, initial-scale=1, maximum-scale=1, user-scalable=no" name="viewport">
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bower_components/bootstrap/dist/css/bootstrap.min.css">
  <!-- Font Awesome -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bower_components/font-awesome/css/font-awesome.min.css">
  <!-- Ionicons -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/bower_components/Ionicons/css/ionicons.min.css">
  <!-- Theme style -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dist/css/AdminLTE.min.css">
  <!-- AdminLTE Skins. We have chosen the skin-blue for this starter
        page. However, you can choose any other skin. Make sure you
        apply the skin class to the body tag so the changes take effect. -->
  <link rel="stylesheet" href="${pageContext.request.contextPath}/css/dist/css/skins/skin-blue.min.css">

  <!-- Google Font -->
  <link rel="stylesheet"
        href="https://fonts.googleapis.com/css?family=Source+Sans+Pro:300,400,600,700,300italic,400italic,600italic"> --%>
</head>

<body class="hold-transition skin-blue sidebar-mini" onload="redirect('home')">
<div class="wrapper">

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
          <img src="${pageContext.request.contextPath}/css/dist/img/kenneth.jpg" class="img-circle" alt="User Image">
        </div>
        <div class="pull-left info">
          <p>Kenneth Gutierrez</p>
          <!-- Status -->
          <a href="#"><i class="fa fa-circle text-success"></i> Online</a>
        </div>
      </div>


      <!-- Sidebar Menu -->
      <ul class="sidebar-menu" data-widget="tree">
        <li class="header">MENU PANE</li>
        <!-- Optionally, you can add icons to the links -->
        <li id="btnHome" class="active"><a href="#"><i class="fa fa-home"></i> <span>Home</span></a></li>
        <li class="treeview">
          <a href="#"><i class="fa fa-wrench"></i> <span>Maintenance</span>
            <span class="pull-right-container">
                <i class="fa fa-angle-left pull-right"></i>
              </span>
          </a>
          <ul class="treeview-menu">
            <li id="sidebtnUserMaintenance"><a href="#">User</a></li>
            <li><a href="#">Supply Types</a></li>
			<li><a href="#">Supplies Maintenance</a></li>
          </ul>
        </li>
        <li><a href="#"><i class="fa fa-pencil-square-o"></i> <span>Supplies</span></a></li>
        <li><a href="#"><i class="fa fa-pie-chart"></i> <span>Stocks</span></a></li>
      </ul>
      <!-- /.sidebar-menu -->
    </section>
    <!-- /.sidebar -->
  </aside>

  <!-- Content Wrapper. Contains page content -->
  <div class="content-wrapper" id="mainDiv">
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
<%-- <!-- jQuery 3 -->
<script src="${pageContext.request.contextPath}/css/bower_components/jquery/dist/jquery.min.js"></script>
<!-- Bootstrap 3.3.7 -->
<script src="${pageContext.request.contextPath}/css/bower_components/bootstrap/dist/js/bootstrap.min.js"></script>
<!-- AdminLTE App -->
<script src="${pageContext.request.contextPath}/css/dist/js/adminlte.min.js"></script> --%>
<!-- <script type="text/javascript">var $j = jQuery.noConflict();</script> -->

</body>
</html>
<script type="text/javascript">
	$("btnHome").observe("click",function(){
		redirect("home");
	});
	$("sidebtnUserMaintenance").observe("click",function(){
		redirect("usermaintenance");
	});
	
	function redirect(page){
		try{
			new Ajax.Request("${pageContext.request.contextPath}/homeserv",{
				method : "get",
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