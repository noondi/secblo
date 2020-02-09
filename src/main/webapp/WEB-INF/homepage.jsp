<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
	<meta charset="UTF-8">
	<title></title>

	<link rel="stylesheet" type="text/css" href='/css/main.css'>
</head>
<body>

	<div class="container">
		<h2>Nuundi's Hacking & Programming Blog.</h2><br>
		<p>Welcome <span class="white">${user.getFirstName()}!</span> |
			<a href="/registration">Sign in</a>|
			<a href="/registration">Sign up</a>
		</p><br>
		 <p>Walkthroughs</p> 
 		 <p><a href="/#">CTF London</a></p>
		 <p><a href="/#">CTF Japan</a></p>
		<p>Vuln boxes writeups are classified according to the way thier privilege escalations are done.</p>

		<p><h3>CRONTAB <span class="white">TECHNIQUE</span></h3>
		<ul style="list-style-type:none;">
			<li><a href="vulnhub/jarbas1">Jarbas 1.0</a></li>
	  		<li><a href="vulnhub/bsides2018vancouver"> BSides Vancouver: 2018 (Workshop) </a></li>
			<li><a href="vulnhub/born2root">Born2Root</a></li>
	   		<li><a href="vulnhub/billymadison">Billy Madison</a></li>
			<li><a href="vulnhub/spjerome1">SP: Jerome 1</a></li>
		</ul>  </p><br>

		<h3>PATH VARIABLE TECHNIQUE <span class="white">TECHNIQUE</span></h3>
		<ul style="list-style-type:none;">
			<li><a href="jedis/new">Nullbyte</a></li>
	  		<li><a href="jedis/new">Gemini 1</a></li>
			<li><a href="jedis/new">Symfonos1</a></li>
	   		<li><a href="jedis/new">Silky</a></li>
			<li><a href="jedis/new">PWNLAB</a></li>
			<li><a href="jedis/new">The Beast</a></li>
			<li><a href="jedis/new">USV</a></li>
		</ul>  
		</p> <br>		
		<div class="parallax">
			

		</div>
		<p><h3>SUID BIT TECHNIQUE</h3>
		<ul style="list-style-type:none;">
			<li><a href="jedis/new">BSides 2018 Vancouver by Abatchy</a></li>
	  		<li><a href="jedis/new">Gemini 1</a></li>
			<li><a href="jedis/new">Symfonos1</a></li>
	   		<li><a href="jedis/new">Silky</a></li>
			<li><a href="jedis/new">PWNLAB</a></li>
			<li><a href="jedis/new">The Beast</a></li>
			<li><a href="jedis/new">USV</a></li>
		</ul> </p> <br>
		<p><p><h3>BUFFEROVERFLOW TECHNIQUE</h3>
		<ul style="list-style-type:none;">
			<li><a href="jedis/new">BSides 2018 Vancouver by Abatchy</a></li>
	  		<li><a href="jedis/new">Gemini 1</a></li>
			<li><a href="jedis/new">Symfonos1</a></li>
	   		<li><a href="jedis/new">Silky</a></li>
			<li><a href="jedis/new">PWNLAB</a></li>
			<li><a href="jedis/new">The Beast</a></li>
			<li><a href="jedis/new">USV</a></li>
		</ul> </p>
		<div class="parallax">
			
		</div>
		<p><p><h3>WRITABLE /etc/passwd FILE</h3>
		<ul style="list-style-type:none;">
			<li><a href="jedis/new">BSides 2018 Vancouver by Abatchy</a></li>
	  		<li><a href="jedis/new">Gemini 1</a></li>
			<li><a href="jedis/new">Symfonos1</a></li>
	   		<li><a href="jedis/new">Silky</a></li>
			<li><a href="jedis/new">PWNLAB</a></li>
			<li><a href="jedis/new">The Beast</a></li>
			<li><a href="jedis/new">USV</a></li>
		</ul> </p>
		<p><p><h3>WILDCARD INJECTION</h3>
		<ul style="list-style-type:none;">
			<li><a href="jedis/new">BSides 2018 Vancouver by Abatchy</a></li>
	  		<li><a href="jedis/new">Gemini 1</a></li>
			<li><a href="jedis/new">Symfonos1</a></li>
	   		<li><a href="jedis/new">Silky</a></li>
			<li><a href="jedis/new">PWNLAB</a></li>
			<li><a href="jedis/new">The Beast</a></li>
			<li><a href="jedis/new">USV</a></li>
		</ul> </p>
		<div class="parallax">
			
		</div>
		<p><h3>CRONTAB TECHNIQUE</h3>
		<ul style="list-style-type:none;">
			<li><a href="jedis/new">BSides 2018 Vancouver by Abatchy</a></li>
	  		<li><a href="jedis/new">Gemini 1</a></li>
			<li><a href="jedis/new">Symfonos1</a></li>
	   		<li><a href="jedis/new">Silky</a></li>
			<li><a href="jedis/new">PWNLAB</a></li>
			<li><a href="jedis/new">The Beast</a></li>
			<li><a href="jedis/new">USV</a></li>
		</ul> </p>
	<br><br><br>
	<div>
		<p><a href="/logout">Log out here!</a></p>
	</div>
	</div>

</body>
</html>