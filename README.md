# Status-Report
[![Tested On Ubuntu 2018.04 LTS](https://img.shields.io/badge/tested%20with-Ubuntu%2018.04%20LTS-green)](https://github.com/offsec64/status-report/#status-report)
[![Sends from Gmail](https://img.shields.io/badge/email%20sends%20from-GMAIL-yellow)](https://github.com/offsec64/status-report/#status-report)

**Special Thanks to the following**

Roland Smith (StackOverFlow) for the code to use python in shell

@project7io (github) for the python email script

## Status Report is a great way to export a lot of information into one TXT file.
It exports the following:
* CPU Utilization
* CPU Temps on all cores
* Fan RPM
* Local IP Address
* External IP Address

## Prerequisite
_This is based off of the ubuntu shell, specifically 18.04 LTS_

From the Ubuntu shell type in the following command:

`git clone https://github.com/offsec64/Status-Report`

Then you have to get the application to collect sensor data.

`sudo apt-get install lm-sensors`

From there, type `cd Status-Report` to get into the clone's directory.

Then to allow execution of the shell script, type:

`sudo chmod +x status.sh`

Now, open up the `status.sh` file

`sudo nano status.sh`

Go to line 46, and enter the email the report will be sending from, replacing `email`.

Go to line 47, and enter the email the report will be sent to, replacing `email`.

Go to line 75, and enter the password for the email the report will be sending from, replacing `password`.

## Running the script

Just type `./status.sh` to run! It will output to `stats.txt` in the same directory. 


> You should copy it to your root directory to make running it easier, like with the `cp` command.

> If you open up status.sh, on line 72 you can change your SMTP server to work with other platforms besides gmail.