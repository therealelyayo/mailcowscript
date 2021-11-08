# &hearts; &hearts;mailcowscript  &hearts; &hearts; &hearts; &hearts;
  - simple one liner script to setup sharply. Make sure to set rdns  **{mail.domain.tld}** and matching records below.
  
| Name | Type  | Value |
| ------ | ------ |------ |
| mail | **A** | ipaddy |
| autodiscover | **CNAME** | mail |
| MX TO D@ OR HOSTNAME | **MX** | POINTS TO HOSTNAME |
| autoconfig | **CNAME** | mail |
| @ | **TXT** | v=spf1 mx -all |
| dkim._domainkey | **TXT** | v=DKIM1; k=rsa; t=s; s=email; p={get-this-from-web-after-install-and-domain-add} |
| _dmarc | **TXT** | v=DMARC1; p=reject; rua=mailto:mailauth-reports@example.org |
---
### Installation
- (assuming you have and telling you to have root permissions. )
-  and your head is correct lol

```sh
apt update -y && apt install wget -y && wget https://raw.githubusercontent.com/therealelyayo/mailcowscript/master/install.sh && chmod u+x install.sh && ./install.sh
```
- Now in the mailcow folder finish off with {Use  **{mail.domain.tld}** as hostname when asked.} in next code.

```sh
cd /opt
cd mailcow-dockerized
./generate_config.sh
	nano mailcow.conf
	{OPTIONAL!! - Change configurationin **{mailcow.conf }** if you want or need to here before proceeding}
	docker-compose pull
	docker-compose up -d
```

## Congrats!!!

You can now access https://${MAILCOW_HOSTNAME} with the default credentials admin + password moohoo.(if you get hsts error use https://ipaddress )

------------------------------------------

###Mailcow Configuration
- Open the Mailcow web interface under the domain of your server in your web browser via HTTPS. 

- Log in with the username "admin" and the default password "moohoo".
- Click on "Edit" right next to the "admin" user under "Edit administrator details".
- Change the password of the administrator user. You can also change the username if you want. - After you've done this, click on the "Save changes" button.
- Click on "Configuration" in the top menu and then click on "Mail Setup" to switch to the mail configuration.
- The tab "Domains" is already selected. Add your domain by clicking on the "Add domain" button. - In the dialog that appears, enter the domain in the "Domain" text box and a description in the "Description" text box. You can change the rest of the settings (e.g. the maximum amount of possible mailboxes or the mailbox quota), but the default values should be fine in most cases. - 
- Next, click on the button called "Add domain and restart SOGo".
- Switch to the "Mailboxes" tab and add a new mailbox by clicking on "Add mailbox". You have to enter the following information:
**Username: Left part of the e-mail address (before the "@")
**
**Domain: Domain to which the mailbox belongs
**
**Full name: First and last name of the mailbox user
**
**Quota (MiB): Quota of this mailbox (default 3072 MiB)
**
**Password: Password of the mailbox user
**

- Then click on the "Add" button to create the mailbox.

###Find Dns settings
Mailcow is now basically set up. However, it's recommended to perform further configurations such as the DKIM configuration. The DKIM configuration is explained in the next step of this tutorial. For further information, the Mailcow documentation is very helpful.
#####DKIM Configuration
- Log in to the Mailcow web interface and click on "Configuration" at the top menu. Then click on "Configuration & Details".

- Click on the "Configuration" tab and then on "ARC/DKIM keys"

- Enter your domain in the "Domain/s" text box under "Add ARC/DKIM key".

- You can leave the DKIM selector (text box "Selector") at "dkim" or you can change it if you want.

- Then select "2048 bits" as the "DKIM key length (bits)" in the dropdown menu.

- Click on the "Add" button to generate a DKIM key for your domain.

- Now copy the contents of the text box above (public key matching the domain, starting with "v=DKIM1;k=rsa;t=s;s=email;p=") under "ARC/DKIM keys".
-  Finally, add a TXT record for "dkim._domainkey.testdomain.com" (matching the DKIM selector) in your domain's DNS settings and set the previously copied content from the text box as the value of this TXT record.

###Using the Webmail Client "SOGo"
Of course, you can use mail clients like Thunderbird or Outlook, but Mailcow also offers it's own webmail client. Using this webmail client, you can also read your e-mails directly in the browser:

- In the top menu of the Mailcow web interface, click on "Apps" and then click on "Webmail" or open the webmail client directly by appending "/SOGo" to the domain of your server.
- Now log in to the webmail client. Enter the complete e-mail address of the mailbox as user name and enter the corresponding password.

You should already see an e-mail in the inbox, because a personal calendar was automatically created for you. Now you can use the SOGo webmail client.
Setting up a Mail Client (e.g. Thunderbird)
Of course, you can also add your mailboxes to traditional mail clients such as Thunderbird, Outlook or Apple Mail. Usually, you only need to specify the username (e-mail address of the mailbox) and the password. The server settings should be determined automatically. If this doesn't work, use the following server settings:

Server	Protocol	Server Hostname	Port	SSL	Authentication
Incoming	IMAP	FQDN of the mail server (usually mail.testdomain.com)	993	SSL/TLS	Normal password
Outgoing	SMTP	FQDN of the mail server (usually mail.testdomain.com)	587	STARTTLS	Normal password

| Server | Protocol | Server Hostname | Port | SSL | Authentication |
| ------ | ------ | ------ | ------ | ------ | ------ |
| Incoming | IMAP | FQDN of the mail server (usually mail.testdomain.com) | 993 | SSL/TLS | Normal password | 
| Outgoing | SMTP | FQDN of the mail server (usually mail.testdomain.com) | 587 | STARTTLS | Normal password | 


----------------------

congrats you done installed # mailcow: dockerized - 🐮 + 🐋 = 💕

[![Build Status](https://travis-ci.org/joemccann/dillinger.svg?branch=master)](https://travis-ci.org/joemccann/dillinger)
