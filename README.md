# Status-Report
[![Tested On](https://img.shields.io/badge/tested%20with-Ubuntu%2018.04%20LTS-green)](https://github.com/offsec64/status-report/#)

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

## Running the script

Just type `./status.sh` to run! It will output to `stats.txt` in the same directory. 


> You should copy it to your root directory to make running it easier, like with the `cp` command.



