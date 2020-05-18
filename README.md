# Free TON zabbix templates

## Requirements
Tested on zabbix 4.4.6 and zabbix-agent2 only

## Setup
```
cd
git clone https://github.com/SalamAkhin/free-ton-zabbix.git
sudo cp -r ./free-ton-zabbix/etc/zabbix/* /etc/zabbix/
sudo mkdir /var/lib/ton-metrics
sudo chown `whoami`:`whoami` /var/lib/ton-metrics
```

Add to cron
```
* * * * * . <PATH_TO_TON_env.sh> && ~/free-ton-zabbix/do.sh
```

Restart agent
```
sudo systemctl restart zabbix-agent2
```

Import template into your zabbix server and add it to host.


>Suggestions for new metrics are welcome to telegram [@qwertys318](https://t.me/qwertys318)
