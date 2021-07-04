if [ $USER != "root" ];then
    echo   -e "${red}请使用root用户执行本脚本!! ${black}"
    exit 1
fi



service dnat stop
systemctl disable dnat
rm -f /lib/systemd/system/dnat.service
rm -rf /etc/dnat
