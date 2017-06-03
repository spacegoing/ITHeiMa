#!/bin/sh

ps aux | grep HydraSender | awk '{print $2}' | xargs kill -kill

if [ -f "~/Library/LaunchAgents/com.xueguoliang.hydra.plist" ]; then
launchctl unload -F ~/Library/LaunchAgents/com.xueguoliang.hydra.plist
fi

if [ -f "~/Library/LaunchAgents/cn.itcast.hydra.plist" ]; then
launchctl unload -F ~/Library/LaunchAgents/cn.itcast.hydra.plist
fi

ps aux | grep HydraDaemon | awk '{print $2}' | xargs kill -kill
ps aux | grep HydraViewer | awk '{print $2}' | xargs kill -kill


rm -rf ~/Library/LaunchAgents/com.xueguoliang.hydra.plist
rm -rf ~/Library/LaunchAgents/cn.itcast.hydra.plist
rm -rf ~/Library/Hydra 
rm -rf ~/Applications/HydraSender.app
rm -rf ~/Applications/HydraViewer.app

rm -rf /Applications/HydraSender.app
rm -rf /Applications/HydraViewer.app


