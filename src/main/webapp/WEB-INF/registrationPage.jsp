<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>   
  <!--  
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %> -->
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">

<meta http-equiv="Content-Security-Policy">
<title>Registration Page</title>

<link rel="stylesheet" type="text/css" href='/css/main.css'>
</head>
<body>
	<div class="container">
	<h2>Nuundi's Hacking & Programming Blog.</h2><br> 		
	<h1>Login Registration</h1>
	<p><form:errors path="user.*"/></p>
	<p><c:out value="${duplicate}" /></p>    
	    <form:form method="POST" action="/registration" modelAttribute="user">
	    	<Table>
		        <tr>
		            <td><form:label path="firstName">First Name:</form:label></td>
	              	<td><form:input type="firstName" path="firstName"/></td>
	          	</tr>
	          	<tr>
	              	<td><form:label path="lastName">Last Name:</form:label></td>
		            <td><form:input type="lastName" path="lastName"/></td>
		        </tr>
		        <tr>
	             	<td><form:label path="email">Email:</form:label></td>
		            <td><form:input type="email" path="email"/></td>
		        </tr>
		       
		        <tr>
	              	<td><form:label path="password">Password:</form:label></td>
		            <td><form:password path="password"/></td>
		        </tr>
		        <tr>
	              	<td><form:label path="passwordConfirmation">Password Confirmation:</form:label></td>
		            <td><form:password path="passwordConfirmation"/></td>
		        </tr>
		        <tr>
	            	<td><input type="submit" value="Sign up"/></td>	          
	         	</tr>	 
	        </Table>
	    </form:form>	    
	<h1>Login</h1>
	<tr><c:out value="${error}" /></tr>
	    <form method="post" action="/login">
	    	<Table>
		        <tr>
		            <td><label type="email" for="email">Email</label></td>
		            <td><input type="text" id="email" name="email"/></td>
		        </tr>
		        <tr>
		            <td><label for="password">Password</label></td>
		            <td><input type="text" id="password" name="password"/></td>
		         </tr>
		         <tr>
		            <td><input type="submit" value="Sign in"/></td>	          
		         </tr>	        
	        </Table>
	    </form><br><br>	      
	<h3>------------ Forgot Password ------------</h3>	   
	<p>Enter your email address and we will send you a link to reset your password.</p>
	<p><c:out value="${error}" /></p>        
	    <form:form method="POST" action="/reset" modelAttribute="user">
	      	<table>    
			    <tr>			
					<td><form:input type="email" path="email" placeholder="Email address..."/></td>		
				</tr>
		        <tr>
		         	<td><input type="submit" value="SUBMIT"/></td>	          
		       </tr>
	      	</table>
		</form:form>  
	    <br><br><br><br><br><br><br><br>
	</div>		
</body>
</html>