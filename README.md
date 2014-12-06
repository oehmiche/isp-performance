# Raspberry PI script to measure the performance of your internet service provider (isp-performance)
The script uses the [smokeping-tool](https://github.com/oetiker/SmokePing) to measure the performance of an internet service provider:
With this setup here, the graph results will be pushed to a github-account regularly so they are available for everybody.

## Preliminary
Setup your smokeping-server. 

The [blog.kugelfish.com](http://blog.kugelfish.com/2013/05/raspberry-pi-internet-access-monitor.html) or the [how-to on the spiceworks community page](http://community.spiceworks.com/how_to/show/96949-raspberrypi-rpi-smokeping-setup-and-configuration) are a good starting point. 
Find the configuration files in ```/etc/smokeping/config.d/``` (see my my configuration in the folder ```smokeping.config.d``` in this repository)

Start smokeping with ```/etc/init.d/smokeping start```


## Steps for setting up the Gitup push script
Here are the steps to setup the script on your own raspberry pi:
* create a github-project (or clone this project) 
* create a public-private key without password-protection*
* put the public key to your github settings (rtfm)
* clone your github repository on your raspberry pi
* adapt the [git.upload.sh](git.upload.sh) script with your local paths
* set the execution-bit for the user running the script (`chmod u+x git.upload.sh`)
* create a crontab entry with `crontab -e`
	```
	05 */2 * * * /home/pi/smokeping/bin/git.upload.sh >> /home/pi/smokeping/logs/git.upload.log 2>&1
	```
  (updates the graphics every 2nd hour)


## Note
* You can test your script be manually calling the github.upload.sh
* If you want to use the configuration files from this repository, change the paths in the ```/etc/smokeping/config```.

## Sites
* [Unitymedia](http://oehmiche.github.io/isp-performance/) - Frankfurt Ostend
* [Telekom](http://tiggar.github.io/isp-performance/) - Frankfurt Nordend

*): I don't know how to include a ssh-agent into the crontab-script, so that a password is not required when accessing the private key.
