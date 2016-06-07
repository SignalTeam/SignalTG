```sh
# Install dependencies.
# Tested on Ubuntu 14.04. For other OSs, check out https://github.com/yagop/telegram-bot/wiki/Installation
sudo apt-get install libreadline-dev libconfig-dev libssl-dev lua5.2 liblua5.2-dev libevent-dev make unzip git redis-server g++ libjansson-dev libpython-dev expat libexpat1-dev

# Let's install the bot.
cd $HOME
git clone https://github.com/SIGNALTEAM/SignalTG.git
cd SignalTG
chmod +x launchfix2.sh
chmod +x launch.sh
chmod +x autolaunch.sh
chmod +x steady.sh
./launch.sh install
cd .luarocks
cd bin
./luarocks-5.2 install luafilesystem
./luarocks-5.2 install lub
./luarocks-5.2 install luaexpat
cd $HOME
cd SignalTG
./launch.sh install
./launch.sh # Enter a phone number & confirmation code.
```

**دقـــــــــــيق مثل همین عمل کنید**

```
# Auto Launch Bot With :

killall screen
killall tmux
killall telegram-cli
tmux new-session -s script "bash steady.sh -t"
```

# Auto Launch Confiure :

**go to steady.sh and config it !**

***Then Go To line 9 - 10 and change bot folder name and reload time!***
