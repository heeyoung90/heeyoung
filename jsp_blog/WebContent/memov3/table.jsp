<%@ page contentType="text/html; charset=UTF-8" %> 
<% request.setCharacterEncoding("utf-8"); %> 

<!DOCTYPE html> 
<html> 
<head> 
<meta charset="UTF-8"> 
<title></title> 
<style type="text/css"> 
*{ 
  font-family: gulim; 
  font-size: 20px; 
}
table {
	margin:auto;
}
table, th{
	border: 2px solid black;
	align:center;
	padding:20px;
	border-spacing:5px;
}
</style> 
</head> 
<body> 
<table>
	<tr>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th rowspan='5' bgcolor='#AAFFAA'> 6% </th>
	</tr>
	<tr>
		<th></th>
		<th></th>
		<th></th>
		<th></th>
		<th rowspan='4' bgcolor='#AAFFAA'> 5% </th>
	</tr>
	<tr>
		<th></th>
		<th></th>
		<th rowspan='3' bgcolor='#AAFFAA'> 3% </th>
		<th></th>
	</tr>
	<TR>
	    <TH> </TH>
	    <TH rowspan='2' bgcolor='#AAFFAA'> 2% </TH>
	    <TH rowspan='2' bgcolor='#AAFFAA'> 4% </TH>
	</TR>
	<TR>
    	<TH rowspan='1' bgcolor='#AAFFAA'> 1% </TH>
	</TR>
</table>
</body> 
</html> 