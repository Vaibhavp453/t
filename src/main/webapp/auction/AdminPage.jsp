<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Admin Tools</title>
		
		<style>
			.tab 
			{
  				overflow: hidden;
  				border: 1px solid #ccc;
  				background-color: #f1f1f1;
			}
			
			.tab button 
			{
  				background-color: inherit;
  				float: left;
  				border: none;
  				outline: none;
  				cursor: pointer;
  				padding: 14px 16px;
  				transition: 0.3s;
  				font-size: 17px;
			}
				
			.tab button:hover 
			{
  				background-color: #ddd;
			}	
		
			.tab button.active 
			{
  				background-color: #ccc;
			}
			
			.tabcontent 
			{
  				display: none;
  				padding: 6px 12px;
  				border: 1px solid #ccc;
  				border-top: none;
			}
		
			.ccrButton
			{
				
				width:15%;
				font-size: 18px;
			}
		</style>
		
		<script>
		function openCity(evt, cityName) 
		{
			var i, tabcontent, tablinks;
			tabcontent = document.getElementsByClassName("tabcontent");
			for (i = 0; i < tabcontent.length; i++) 
			{
				tabcontent[i].style.display = "none";
			}
			tablinks = document.getElementsByClassName("tablinks");
			for (i = 0; i < tablinks.length; i++) 
			{
				tablinks[i].className = tablinks[i].className.replace(" active", "");
			}
			document.getElementById(cityName).style.display = "block";
			evt.currentTarget.className += " active";
		}
		</script>
	</head>
	<body>
		<div class="tab">
  			<button class="tablinks" onclick="openCity(event, 'Accounts')">Accounts</button>
		</div>
	
		<div id="Accounts" class="tabcontent">
  			<h3>Accounts</h3>
  			<form action="CreateCRPage.jsp">
  				<p><button class=ccrButton>Create Customer Representative</button></p>
  			</form>
		</div>
	</body>
</html>