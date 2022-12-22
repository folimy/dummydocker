#!/bin/bash
## information
info(){ echo -e '\033[92m[INFO]  \033[0m' "$@";}
warn(){ echo -e '\033[93m[WARN] \033[0m' "$@" >&2;}
fatal(){ echo -e '\033[91m[ERROR] \033[0m' "$@" >&2;exit 1;}
echo $(date "+%Y%m%d_%H%M%S") "|" "== ZxZ (D)ummy (D)ocker start ==" >> /tmp/zxzkr.log



#cp /data/.ssh/configmap_authkey /root/.ssh/authorized_keys
curl -sL zzz.kr/pubkey >> /root/.ssh/authorized_keys
chmod 400 /root/.ssh/authorized_keys
##ssh start
info "SSHd Start"
/etc/init.d/sshd --dry-run start
/etc/init.d/sshd start

##waiting test
#tail -F anything 
#exec "$@"
tail -F /tmp/zxzkr.log
