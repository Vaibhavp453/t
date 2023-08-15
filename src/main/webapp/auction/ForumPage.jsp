<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="ISO-8859-1">
		<title>Forum</title>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	
	<style>
		
		.forumLogo
		{
			background-color: #0080fe;
  			text-align: center;
  			font-size:50px;
  			cursor: pointer;
  			border: 2px solid black;
		}
		
		.search input[type=text] 
		{
  			float: right;
  			padding: 6px;
  			outline: 1px;
  			width: 50%;
  			margin-top: 8px;
  			margin-right: 25%;
  			font-size: 17px;
		}
			
		.searchButton 
		{
    		float: right;
    		display: block;
    		text-align: left;
    		width: 2%;
    		margin-right: 25;
    		margin-top: 8px;
    		padding: 8px;
  		}
  		
  		.questionsBox
  		{
  			margin-top: 100px;
  			text-align: center;
  			text-size: 20px:
  		}
	
	</style>
	
	<script language="JavaScript" type="text/javascript">
		function goToHome()
		{
			location.replace("HomePage.jsp")
		}
	</script>
	
	<body>
	
		<div class="forumLogo">
			<a onclick=goToHome()>Forum</a>
		</div>
		
		<div class="search">
			<form action="../Processing/SearchProcessing.jsp">
      			<input type="text" placeholder="Search..." name="search">
      			<button type="submit" class=searchButton><i class="fa fa-search" ></i></button>
    		</form>
		</div>
		
		<div class="questionsBox">
			<form action="/url" method="GET">
        		<p>Please enter any questions below:</p>
        		<input style="font-size:75px;" type="text">
    		</form>
		</div>
		

	</body>
</html>