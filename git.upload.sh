#!/bin/bash

GIT_FOLDER=/home/pi/smokeping/isp-performance.git
IMAGE_FOLDER=/var/cache/smokeping/images/Internet
DATE=$(date +"%Y-%m-%d_%H-%M-%S")

echo "starting $DATE"

# reload graphics
echo "updating all graphics..."
curl --head  http://localhost/cgi-bin/smokeping.cgi?target=Internet.Google
curl --head  http://localhost/cgi-bin/smokeping.cgi?target=Internet.heise

cd $GIT_FOLDER
echo "working folder is $GIT_FOLDER"
git checkout gh-pages
# git pull
echo "git pull..."
git pull origin gh-pages


# cp folder
echo "copying images to git folder..."
cp $IMAGE_FOLDER/*.png charts/

echo "git committing changes..."
git commit -a -m "updates all charts"

echo "pushing changes to github..."
git push origin gh-pages
