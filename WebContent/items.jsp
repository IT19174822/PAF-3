
<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1" %>
<%@ page import="com.Item" %>
    
<%

	if (request.getParameter("itemCode") != null)  
		
	{ 
		Item itemObj = new Item(); 
		String stsMsg = itemObj.insertItem(request.getParameter("itemCode"), 
				request.getParameter("itemName"), 
				request.getParameter("itemPrice"),   
				request.getParameter("itemDesc"));
		session.setAttribute("statusMsg", stsMsg);
	}
if (request.getParameter("itemID") != null)
{ Item itemObj = new Item(); 
String stsMsg = itemObj.deleteItem(request.getParameter("itemID"));
session.setAttribute("statusMsg", stsMsg);
}

	
%>
    
    
    
    
<!DOCTYPE html>
<html>
<head>
<link rel= "stylesheet" href= "Views/bootstrap.min.css">
<meta charset="ISO-8859-1">
<title>Items Management</title>
</head>
<body>
<div class="container">
<div class="row">
<div class="col">
</div>
</div>
</div>
	<h1>Items Management</h1>
	<form method="post" action="items.jsp">	

		Item code: <input name="itemCode" type="text" class="form-control"><br>
		Item name: <input name="itemName" type="text"><br>
		Item price: <input name="itemPrice" type="text"><br>
		Item description: <input name="itemDesc" type="text"><br>
		<input name ="btnSubmit" type="submit" value="Save" class="btn btn-primary">
	</form>
	<div class ="alert alert-success">
	<% out.print(session.getAttribute("statusMsg")); 
	%>
</div>
	<br>
	<table border="1">
		<tr>
			<th>Item Code</th>
			<th>Item Name</th>
			<th>Item Price</th>
			<th>Item Description</th>
			<th>Update</th>
			<th>Remove</th>
			
			</tr>
			<tr>
				<td><%out.print(session.getAttribute("itemCode")); %>
				</td><td><%out.print(session.getAttribute("itemName")); %>
				</td><td><%out.print(session.getAttribute("itemPrice")); %>
				</td><td><%out.print(session.getAttribute("itemDesc")); %>
				</td><td><input name="btnUpdate"type="button"value="Update"></td>
				<td><input name="btnRemove"type="button"value="Remove" class='btn btn-danger'></td>
			</tr>
	
	</table>
	<%
	Item itemObj = new Item();
	out.print(itemObj.readItems()); 
	%>

</body>
</html>