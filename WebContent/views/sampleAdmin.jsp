<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<body>
<div id="mainDiv">
	<h1>Admin Dashboard</h1>
	<h2>Welcome ${user}</h2>
			<input type="button" id="btnLogout" value="Logout"/>
</div>
</body>
<script type="text/javascript">
	try{		
		function logout(){
			new Ajax.Request("${pageContext.request.contextPath}"+'/login', {
				method: 'POST',
				parameters: {
					action : "logout"
				},
				onComplete: function(response){
					$("mainDiv").update(response.responseText);
					
				}    
			}); 
			
		}//logout();
		
		$("btnLogout").observe("click", logout);
		
	}catch(e){
		alert("admin.jsp: "+e);
	}
</script>
</html>