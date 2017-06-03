#!/bin/sh
basepath=$(cd `dirname $0`; pwd)

$basepath/uninstall.command

mkdir -p ~/Library/LaunchAgents
cat $basepath/cn.itcast.hydra.plist | sed "s#\~#$HOME#" >  ~/Library/LaunchAgents/cn.itcast.hydra.plist

rm -rf ~/Library/Hydra
mkdir ~/Library/Hydra
cp -R $basepath/HydraDaemon.app ~/Library/Hydra

rm -rf /Applications/HydraSender.app
rm -rf ~/Applications/HydraSender.app
cp -R $basepath/HydraSender.app ~/Applications

rm -rf /Applications/HydraViewer.app
rm -rf ~/Applications/HydraViewer.app
cp -R $basepath/HydraViewer.app ~/Applications


echo "start daemon"
#launchctl load ~/Library/LaunchAgents/cn.itcast.hydra.plist
echo "end daemon"
