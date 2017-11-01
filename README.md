# bWAPP docker

使用 Docker 部署的 bWAPP，build 後直接使用即可，系统為ubuntu 16.04 版本, 服務器採 apache2 + mysql + php7 搭建。

### 2017-10-31

## 如何使用

1. 建立 docker image

  $ docker build -t bwapp .

2. 建立 docker 容器(container)

   $ docker run -it --name bwapp_vul -p 0.0.0.0:8080:80 bwapp /bin/bash


3.開啟網頁

http://127.0.0.1:8080/bWAPP/login.php 出現bwapp 網站


## 配置说明

* mysql 帳號
> root/bug

* apache2 工作目录
> /var/www/html/

* bWAPP 帳號
> bee/bug

## bWAPP 特性

* SQL, HTML, iFrame, SSI, OS Command, PHP, XML, XPath, LDAP and SMTP injections
* Blind SQL injection and Blind OS Command injection
* Boolean-based and time-based Blind SQL injections
* Drupal SQL injection (Drupageddon)
* AJAX and Web Services issues (JSON/XML/SOAP)
* Heartbleed vulnerability (OpenSSL) + detection script included
* Shellshock vulnerability (CGI)
* Cross-Site Scripting (XSS) and Cross-Site Tracing (XST)
* phpMyAdmin BBCode Tag XSS
* Cross-Site Request Forgery (CSRF)
* Information disclosures: favicons, version info, custom headers,...
* Unrestricted file uploads and backdoor files
* Old, backup & unreferenced files
* Authentication, authorization and session management issues
* Password and CAPTCHA attacks
* Insecure DistCC, FTP, NTP, Samba, SNMP, VNC, WebDAV configurations
* Arbitrary file access with Samba
* Directory traversals and unrestricted file access
* Local and remote file inclusions (LFI/RFI)
* Server Side Request Forgery (SSRF)
* XML External Entity attacks (XXE)
* Man-in-the-Middle attacks (HTTP/SMTP)
* HTTP parameter pollution and HTTP verb tampering
* Denial-of-Service (DoS) attacks: Slow Post, SSL-Exhaustion, XML Bomb,...
* POODLE vulnerability
* BREACH/CRIME/BEAST SSL attacks
* HTML5 ClickJacking and web storage issues
* Insecure iFrame (HTML5 sandboxing)
* Insecure direct object references (parameter tampering)
* Insecure cryptographic storage
* Cross-Origin Resource Sharing (CORS) issues
* Cross-domain policy file attacks (Flash/Silverlight)
* Local privilege escalations: udev, sendpage
* Cookie and password reset poisoning
* Host header attacks: password reset poisoning en cache pollutions
* PHP CGI remote code execution
* Dangerous PHP Eval function
* Local and remote buffer overflows (BOF)
* phpMyAdmin and SQLiteManager vulnerabilities
* Nginx web server vulnerabilities
* HTTP response splitting, unvalidated redirects and forwards
* WSDL SOAP vulnerabilities
* Form-based authentication and No-authentication modes
* Active Directory LDAP integration
* Fuzzing possibilities
* and much more...
* HINT: download our bee-box VM > it has ALL necessary extensions
* bee-box is compatible with VMware and VirtualBox!
* Enjoy it little bees ;)

