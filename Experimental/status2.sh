#!/bin/bash

# OffSec64's System Status Script
# Status Report is a script I made to export a ton of info into a text file.
# Version 2 BETA
# Last Modified: 17:28 on 8/24/2019
# READ... THE... DOCUMENTATION!!!


# Script to show CPU utilization... Displays a bunch of weird stuff when script is ran...
mpstat > stats.txt

# Line break and header for CPU Temps, then runs the Sensors command and only writes the CPU temps for all cores.
echo   >> stats.txt
echo ***CPU TEMPS*** >> stats.txt
sensors | grep Core | cut -d "(" -f 1 >> stats.txt

# Line break and header for FAN RPM , runs sensors again but only writes the RPM of detected fans.
echo   >> stats.txt
echo ***FAN RPM*** >> stats.txt
sensors | grep RPM >> stats.txt

# Line break and header for Local IP, runs ifconfig to get the IP.
echo   >> stats.txt
echo ***LOCAL IP ADDRESS*** >> stats.txt
ifconfig | grep broadcast | cut -d " " -f 10 >> stats.txt

 # Line break and header for Exernal IP, curls the hopefully not-to-sketchy website ifconfig.me to get the IP. Then another line break.
echo   >> stats.txt                                                                                                                                                                                                                                                            
echo ***PUBLIC IP ADDRESS*** >> stats.txt
curl ifconfig.me >> stats.txt
echo   >> stats.txt

##EXPERIMENTS! EMAIL SUPPORT!

python3 - <<'EOF'

import smtplib
from email.mime.multipart import MIMEMultipart
from email.mime.text import MIMEText
from email.mime.base import MIMEBase
from email import encoders


fromaddr = "email"
toaddr = "email"

msg = MIMEMultipart()

msg['From'] = fromaddr
msg['To'] = toaddr
msg['Subject'] = "Python Gmailer with Attachment"

body = "Python Gmailer test....includes attachment. "

msg.attach(MIMEText(body, 'plain'))

filename = ("stats.txt")
attachment = open("stats.txt")

part = MIMEBase('application', 'octet-stream')
part.set_payload((attachment).read())
encoders.encode_base64(part)
part.add_header('Content-Disposition', "attachment; filename= %s" % filename)

msg.attach(part)

server = smtplib.SMTP('smtp.gmail.com', 587)
server.starttls()
server.login(fromaddr, "password")
text = msg.as_string()
server.sendmail(fromaddr, toaddr, text)
server.quit()


EOF

# Check out my Github @OffSec64
