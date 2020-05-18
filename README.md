# Free TON zabbix templates

## Requirements
Tested on zabbix 4.4.6 and zabbix-agent2 only

## Setup
```
git clone https://github.com/SalamAkhin/free-ton-zabbix.git
sudo cp -r ./free-ton-zabbix/etc/zabbix/* /etc/zabbix/
```

Set <<_TON_BUILD_DIR_>> <<_KEYS_DIR_>> in
```
vim /etc/zabbix/zabbix_agent2.d/userparameter_freeton_node.conf
```
Make sure it available for zabbix-agent2 process.

Restart agent
```
sudo systemctl restart zabbix-agent2
```

Import template into your zabbix server and add it to host.


>Suggestions for new metrics are welcome to telegram [@qwertys318](https://t.me/qwertys318)
