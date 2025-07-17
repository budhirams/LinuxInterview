bis@kali:~$ id
I want to 2nd field 
------------------------------------
uid=1000(bis) gid=1000(bis) groups=1000(bis),4(adm),24(cdrom),27(sudo),30(dip),46(plugdev),100(users),114(lpadmin),124(docker)
bis@kali:~$ id -u
1000
bis@kali:~$ id | cut -d '=' -f2
1000(bis) gid
bis@kali:~$ id | cut -d '=' -f2 | cut -d '(' -f1
1000

how to do using awk command
------------------------------------
bis@kali:~$ id | awk -F '[=(]' '{print $2}'
1000

bis@kali:~$ java -version | cut -d '"' -f2
openjdk version "21.0.5" 2024-10-15
OpenJDK Runtime Environment (build 21.0.5+11-Ubuntu-1ubuntu124.04)
OpenJDK 64-Bit Server VM (build 21.0.5+11-Ubuntu-1ubuntu124.04, mixed mode, sharing)
bis@kali:~$ java -version 2>&1 | cut -d '"' -f2
21.0.5
OpenJDK Runtime Environment (build 21.0.5+11-Ubuntu-1ubuntu124.04)
OpenJDK 64-Bit Server VM (build 21.0.5+11-Ubuntu-1ubuntu124.04, mixed mode, sharing)
bis@kali:~$ java -version 2>&1 |head -1| cut -d '"' -f2
21.0.5

using grep 
------------------------------------
bis@kali:~$ java -version 2>&1 |grep version
openjdk version "21.0.5" 2024-10-15
bis@kali:~$ java -version 2>&1 |grep version| cut -d '"' -f2
21.0.5


using awk you can easily find out
-----------------------------------
bis@kali:~$ java -version 2>&1| awk -F '"' 'NR==1{print $2}'
21.0.5

or another way 
bis@kali:~$ java -version 2>&1| awk -F '"' '/version/{print $2}'                               //    write in between 
21.0.5


$0 - entry row / line
$NF - last field
NR - number of record ( line number ) can get using NR


bis@kali:~$ awk '' svc.yaml
bis@kali:~$ awk '{print}' svc.yaml                           work like cat 
apiVersion: v1
kind: Service
metadata:
  name: mongo-svc
spec:
  ports:
    - port: 27017
      protocol: TCP
      targetPort: 27017
      nodePort: 32000
  selector:
    app: mongo
  type: NodePort

bis@kali:~$ awk '{print $0}' svc.yaml
apiVersion: v1
kind: Service
metadata:
  name: mongo-svc
spec:
  ports:
    - port: 27017
      protocol: TCP
      targetPort: 27017
      nodePort: 32000
  selector:
    app: mongo
  type: NodePort





bis@kali:~$ awk '{print $NF}' svc.yaml
v1
Service
metadata:
mongo-svc
spec:
ports:
27017
TCP
27017
32000
selector:
mongo
NodePort

bis@kali:~$ cat /etc/passwd | tail
gnome-remote-desktop:x:988:988:GNOME Remote Desktop:/var/lib/gnome-remote-desktop:/usr/sbin/nologin
polkitd:x:987:987:User for polkitd:/:/usr/sbin/nologin
rtkit:x:117:119:RealtimeKit,,,:/proc:/usr/sbin/nologin
colord:x:118:120:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
gnome-initial-setup:x:119:65534::/run/gnome-initial-setup/:/bin/false
gdm:x:120:121:Gnome Display Manager:/var/lib/gdm3:/bin/false
nm-openvpn:x:121:122:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
bis:x:1000:1000:bis:/home/bis:/bin/bash
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
prometheus:x:123:125:Prometheus daemon,,,:/var/lib/prometheus:/usr/sbin/nologin


bis@kali:~$ cat /etc/passwd | tail | awk -F ':' '{print $1}'
gnome-remote-desktop
polkitd
rtkit
colord
gnome-initial-setup
gdm
nm-openvpn
bis
sshd
prometheus




bis@kali:~$ cat /etc/passwd  | awk '/root/'
root:x:0:0:root:/root:/bin/bash
nm-openvpn:x:121:122:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin


bis@kali:~$ cat /etc/passwd  | awk -F ':' '/root/ {print $1}'
root
nm-openvpn


bis@kali:~$ cat /etc/passwd  | awk -F ':' 'NR==1'
root:x:0:0:root:/root:/bin/bash
bis@kali:~$ cat /etc/passwd  | awk -F ':' 'NR==1 {print $1}'
root

suppose I have below output:
5028208 185586
5028214 185586
5028218 185586
5028230 185586
5028252 185586
5028261 185586
5028283 185586
5028284 185586
5028293 185586
5028545 184966
5028558 184969
5028560 184969
5028562 184969
5028580 184966
5032387 185586
5032425 185071
5032554 185338
I want to add "delete case" in begining
awk '{print "delete case", $0}'






