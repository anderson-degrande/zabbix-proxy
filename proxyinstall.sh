##SetTimezone.
timedatectl set-timezone America/Sao_Paulo
 
##Instalar utilitários 
yum install -y unixODBC-devel.x86_64 net-tools vim nano wget curl tcpdump epel-release  git chrony net-snmp-utils freetds-devel
yum  -y update 


## instalar agent Zabbix
wget https://repo.zabbix.com/zabbix/5.2/rhel/8/x86_64/zabbix-agent-5.2.0-1.el8.x86_64.rpm
yum install -y zabbix-agent-5.2.0-1.el8.x86_64.rpm
yum remove -y docker*
##Instalar o Docker
curl -fsSL https://get.docker.com/ | sh

systemctl enable zabbix-agent
systemctl enable docker
systemctl enable --now chronyd

systemctl start docker
docker swarm init
systemctl start zabbix-agent
systemctl start chronyd
