#!/bin/bash
echo ">> directory create"
mkdir -p /root/.ssh/ /tmp/zzz ~/.terraform.d/plugins/ $WKDIR/terraform_state ~/.kube/

echo ">> ssh config create"
echo "Host *
	StrictHostKeyChecking no
	UserKnownHostsFile /dev/null" > /root/.ssh/config
echo "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAABgQDGlrRt9T9uhLOujKy1CdEL5ulXip8Bh+kQN1b2e2wbXGJE9J0JqCX3ip9ZhOI0763qwmq/OnH+Kg/NnNMAq+iQ8HiiHsqsKT8DSu1PzhsHqEFoL/6D5phbimeeiuIW5+37xzatdHTI6D/d7ioXrI/KvyK7xOFYdP1F2K3OwlSK89+rMuXXprKFxWEwsnEya3gn8qMqK699bfHS1ZGOuC5UL1W82AwXNu7+LBs/0zB1t9TdBIjNB9oHckMdm2bvXWJRYa9E/+4S4U7iHRcL3oVZYS7deq9VoLVYZxspzo4rmIzzX09mz8WbSAno5PZU4B0PDK4eQjvAPx/57d280RrkW7jleL0kKwWfdWSO0NSzJcLNHPlzWSY+T/6oVYfbbd3gZR+L5sTsNR7QcTzrxhCDM/d5fZo/U2QMph9aAAgowTbmjTOMsYwqLj0JC9S+B7ZoJZotrzpcCZm8lM36tl3PB8qPS1Qvpo8D4K3ySyvnfOzZN02mrLzINGkbF0ylxA8= peter@SKYul-MacPro.local" > /root/.ssh/authorized_keys


#####################	
echo "root:dkdhajfldkvmek!" | chpasswd
echo "Welcome to ZxZ.kr" > /etc/motd

# ssh setting
mv /etc/ssh/sshd_config /etc/ssh/sshd_config.ori; \
#sed -e "s|[#]*AuthorizedKeysCommand none|AuthorizedKeysCommand /usr/local/bin/get_pubkey.sh|g" \
#    -e "s|[#]*AuthorizedKeysCommandUser nobody|AuthorizedKeysCommandUser nobody|g" \
sed -e "s|[#]*PermitRootLogin prohibit-password|PermitRootLogin yes|g" \
    -e "s|[#]*UsePAM yes|UsePAM no|g" \
    -e "s|[#]*PermitUserEnvironment no|PermitUserEnvironment no|g" \
    -e "s|[#]*PubkeyAuthentication yes|PubkeyAuthentication yes|g" \
    /etc/ssh/sshd_config.ori > /etc/ssh/sshd_config;

sed -i 's/cgroup_add_service$/echo "DD ZxZ" #cgroup_add_service#/g' /lib/rc/sh/openrc-run.sh
