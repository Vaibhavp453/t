<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<%
	String userid=(String)session.getAttribute("LOGIN_USER");
	if(userid==null)
	{
    	response.sendRedirect("../login/LoginPage.jsp");
    	return; //the return is important; forces redirect to go now
	}
%>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Profile</title>
		
		<style>
			#popupbox
			{
				margin: 0; 
				margin-left: 40%; 
				margin-right: 40%;
				margin-top: 50px; 
				padding-top: 10px; 
				width: 20%; 
				height: 150px; 
				position: absolute; 
				background: #FBFBF0; 
				border: solid #000000 2px; 
				z-index: 9; 
				font-family: arial; 
				visibility: hidden; 
			}
		</style>
		
		<script language="JavaScript" type="text/javascript">			
			function changeLink()
			{
				<% 
					String user=(String)session.getAttribute("PROFILE_USER");
				%>
				
				var jsUser = "<%=user%>"
				
				console.log(jsUser);
				
				window.history.replaceState({}, "", jsUser);

			}
		
			function login(showhide)
			{
				if(showhide == "show")
				{
    				document.getElementById('popupbox').style.visibility="visible";
				}else if(showhide == "hide")
				{
    				document.getElementById('popupbox').style.visibility="hidden"; 
    				location.replace("ProfilePage.jsp")
				}
			}
			
			function goToHome()
			{
				location.replace("HomePage.jsp")
			}
		</script>
		
		<link href="https://netdna.bootstrapcdn.com/font-awesome/4.0.1/css/font-awesome.css" rel="stylesheet">
		
		
		<style>
			.fa-user
			{
				background: #D3D3D3;
				color: #FFFFFF;
  				padding: 0.25em 0.25em;
			}
			
			.circle
			{
				border-radius: 50%;
				margin: 0.15em;
				font-size: 10em;
				text-align: center;
				border:2px solid black;
			}
			
			.center 
			{
  				text-align: center;
			}
			
			.deleteAccountBtn 
  			{
  				float: right;
  				text-align: right;
     			width: 100%;
  			}
  			
  			.homePageLogo
  			{
  				text-align: center;
  				font-size:50px;
  			}
  			.displayUser
  			{
  				font-weight: bold;
  				font-size:35px;
  			}
		</style>
	</head>
	
	<body onload="changeLink()">
		<div class="homePageLogo">
			<a onclick=goToHome()>Online Auction</a>
		</div>
	
		<div>
			<i class="fa fa-user circle center"></i>
		</div>
		
		<div class="displayUser">
			<% out.println(session.getAttribute("PROFILE_USER")); %>
		</div>
		
		<div id="popupbox"> 
			<form name="login" action="../Processing/DAProcessing.jsp" method="post">
				<center>Username:</center>
				<center><input name="DAuname" size="14" /></center>
				<center>Password:</center>
				<center><input name="DApword" type="password" size="14" /></center>
				<center><input type="submit" name="submit" value="Verify" /></center>
			</form>
			<br/>
			<center><a href="javascript:login('hide');">close</a></center> 
		</div> 
		
		<%
		String currentUser=(String)session.getAttribute("LOGIN_USER");
		String profileUser=(String)session.getAttribute("PROFILE_USER");
		userHandler.UserHandler uh=new userHandler.UserHandler();
		if(currentUser.equals(profileUser) 
				|| uh.isCustomerRep(currentUser)
				|| uh.isAdmin(currentUser)) //Add any profile settings here
		{
			%>
				<form action="javascript:login('show')" method="post">
					<div class="deleteAccountBtn">
        				<button>Delete Account</button>
        			</div>
        		</form>
			<%
		}
		%>
	</body>
</html>