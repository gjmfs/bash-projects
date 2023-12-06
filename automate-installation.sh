#!/bin/bash
echo -e "Hello there\nNice to see you here\nI'm here to provide easy intallation setup for you"
while true
do
    echo -e "Which software you need to install.\nselect a number for doing this stuff"
    sleep 1
    echo -e "available softwares\nbrave-browser: 1\nchrome-browser: 2\nms-teams(unofficial):3\nvs-code:4\nzoom:5\nexit:0"
    sleep 1
    read -p "Choose an number:" user_input
    case $user_input in
    1)
        sudo apt install curl
        sudo curl -fsSLo /usr/share/keyrings/brave-browser-archive-keyring.gpg https://brave-browser-apt-release.s3.brave.com/brave-browser-archive-keyring.gpg
        echo "deb [signed-by=/usr/share/keyrings/brave-browser-archive-keyring.gpg] https://brave-browser-apt-release.s3.brave.com/ stable main"|sudo tee /etc/apt/sources.list.d/brave-browser-release.list
        sudo apt update
        sudo apt install brave-browser
        echo -e "\n\nInstallation Successfully..."
    ;;
    2)
        wget https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb
        sudo dpkg -i google-chrome-stable_current_amd64.deb
        sudo apt-get install -f
        echo -e "\n\nInstallation Successfully..."
    ;;
    3)
        sudo mkdir -p /etc/apt/keyrings
        sudo wget -qO /etc/apt/keyrings/teams-for-linux.asc https://repo.teamsforlinux.de/teams-for-linux.asc
        echo "deb [signed-by=/etc/apt/keyrings/teams-for-linux.asc arch=$(dpkg --print-architecture)] https://repo.teamsforlinux.de/debian/ stable main" | sudo tee /etc/apt/sources.list.d/teams-for-linux-packages.list
        sudo apt update
        sudo apt install teams-for-linux
        echo -e "\n\nInstallation Successfully..."
    ;;
    4)
        sudo apt update
        sudo apt install software-properties-common apt-transport-https wget -y
        wget -q https://packages.microsoft.com/keys/microsoft.asc -O- | sudo apt-key add -
        sudo add-apt-repository "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main"
        sudo apt install code
        echo -e "\n\n$(code --version) \ninstalled successfuly"
    ;;
    5)
        wget https://zoom.us/client/5.16.10.668/zoom_amd64.deb
        sudo dpkg -i zoom_amd64.deb
        sudo apt-get install -f
        echo -e "\n\nInstallation Successfully..."
    ;;
    0)
        break
    ;;
    *)
        echo -e "You made a wrong input\nInput a valid Input\nTry again..."
    esac  
done
echo "Thanks Come Again..."
