<%@page import="userHandler.UserHandler"%>
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%
	String search=request.getParameter("search");
		
	//System.out.println("Search="+search);
			
	String[] keywords=search.split("[ ]+");
			
	System.out.println(keywords.length);
	
	if(keywords.length>0 && !keywords[0].isBlank())
	{
		userHandler.UserHandler uh=new userHandler.UserHandler();
		
		java.util.ArrayList<String> users=uh.searchProfile(keywords);
		
		//uh.searchItems(keywords); TODO uncomment eventually
		
		%>
			<html>
				<head>
					<meta charset="ISO-8859-1">
					<title>Search Results</title>
					<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
					
					<style>
						.results
						{
							overflow: auto;
							height: 90%;
							width: 90%;
							font-size: 35px;
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
    						width: 5%;
    						margin-right: 0;
    						margin-top: 8px;
    						padding: 8px;
  						}
					</style>
				</head>
				
				<body>
					<div class="search">
						<form action="../Processing/SearchProcessing.jsp">
      						<input type="text" placeholder="Search..." name="search">
      						<button type="submit" class=searchButton><i class="fa fa-search"></i></button>
    					</form>
					</div>
			
					
				</body>
				<div class="results">
					<br><br>
					<%
						for(int i=0; i<users.size(); i++)
						{
							%>
								<a href="../auction/ProfilePage.jsp" onclick="<%session.setAttribute("PROFILE_USER", users.get(i));%>">
							<%
							out.println(users.get(i));
							%>
								</a>
								<br>
							<%
						}
					%>
				</div>
			</html>
		<%
	}
	else
	{
		%>
			<html>
				<meta http-equiv="Refresh" content="0; url='../auction/HomePage.jsp'" />
			</html>
		<%
	}
%>