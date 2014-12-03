Raspberry PI script to measure the performance of your internet service provider (isp-performance)
===============
The script uses the smokeping-tool to measure the performance of an internet service provider:
With this setup here, the graph results will be pushed to a github-account regularly so they are available for everybody.

# Preliminary
Setup your smokeping-server. - See the smokeping folder for an example.

# Setup the github update script
Find here the steps to setup the script on your own raspberry pi:
* create a github-project (or clone this project) 
* create a public-private key without password-protection*
* put the public key to your github settings (rtfm)
* clone your github repository on your raspberry pi
* adapt the `git.upload.sh` script with your local paths
* set the execution-bit for the user running the script (`chmod u+x git.upload.sh`)
* create a crontab entry with `crontab -e`
	```05 */2 * * * /home/pi/smokeping/bin/git.upload.sh >> /home/pi/smokeping/logs/git.upload.log 2>&1```
  (updates the graphics every 2nd hour)


Note
You can test your script be manually calling the github.upload.sh

*) I don't know how to include a ssh-agent into the crontab-script, so that a password is not required when accessing the private key.
