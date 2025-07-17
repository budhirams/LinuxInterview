bis@kali:~/shellScripting$ sed -n '3,7p' newfile.txt
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync
games:x:5:60:games:/usr/games:/usr/sbin/nologin
man:x:6:12:man:/var/cache/man:/usr/sbin/nologin


-- 40th to last line 
bis@kali:~/shellScripting$ sed -n '40,$p' newfile.txt
cups-browsed:x:115:114::/nonexistent:/usr/sbin/nologin
hplip:x:116:7:HPLIP system user,,,:/run/hplip:/bin/false
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


--last line
bis@kali:~/shellScripting$ sed -n '$p' newfile.txt
prometheus:x:123:125:Prometheus daemon,,,:/var/lib/prometheus:/usr/sbin/nologin

sed with -i very dangerous it replaced original file permanently 

bis@kali:~/shellScripting$ cat demo.sh
#!/bin/bash
echo "I am sed"

-- need to escape using slash 
bis@kali:~/shellScripting$ sed 's/\/bin\/bash/\/usr\/bin\/bash/g' demo.sh                  /bin/bash/ -----  \/bin\/bash/    ||   /usr/bin/bash ---- \/usr\/bin\/bash/
#!/usr/bin/bash
echo "I am sed" 

------------------- OR --------------------------------

bis@kali:~/shellScripting$ sed 's|/bin/bash|/usr/bin/bash|g' demo.sh
#!/usr/bin/bash
echo "I am sed"

bis@kali:~/shellScripting$ sed 's|/usr/bin/bash|/bin/bash|g' demo.sh
#!/bin/bash
echo "I am sed"


bis@kali:~/shellScripting$ cat myData.txt
ram,5000
john,6000
robert,8000
bis@kali:~/shellScripting$ sed '1i Name,salary' myData.txt
Name,salary
ram,5000
john,6000
robert,8000


bis@kali:~/shellScripting$ sed -i.bkp '1i Name,salary' myData.txt
bis@kali:~/shellScripting$ ll
-rw-rw-r--  1 bis bis   43 Jul 14 00:28  myData.txt
-rw-rw-r--  1 bis bis   31 Jul 14 00:25  myData.txt.bkp

bis@kali:~/shellScripting$ cat myData.txt
Name,salary
ram,5000
john,6000
robert,8000
bis@kali:~/shellScripting$ cat myData.txt.bkp
ram,5000
john,6000
robert,8000




after first line add ------------------------

bis@kali:~/shellScripting$ sed -i '1a --------------' myData.txt
bis@kali:~/shellScripting$ cat myData.txt
Name,salary
--------------
ram,5000
john,6000
robert,8000

after last line add -------------------------
bis@kali:~/shellScripting$ sed -i '$a --------------' myData.txt
bis@kali:~/shellScripting$ cat myData.txt
Name,salary
--------------
ram,5000
john,6000
robert,8000
--------------



it delete 1st line 
bis@kali:~/shellScripting$ sed -i '1d' newfile.txt
-i means permanently so take backup also when executing this 



bis@kali:~/shellScripting$ sed -i.bkp '1d' newfile.txt
bis@kali:~/shellScripting$ head -3 newfile.txt
bin:x:2:2:bin:/bin:/usr/sbin/nologin                  so daemon is deleted here
sys:x:3:3:sys:/dev:/usr/sbin/nologin
sync:x:4:65534:sync:/bin:/bin/sync

bis@kali:~/shellScripting$ head -3 newfile.txt.bkp
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin
sys:x:3:3:sys:/dev:/usr/sbin/nologin



bis@kali:~/shellScripting$ sed -i.bkp1 '1,10d' newfile.txt
bis@kali:~/shellScripting$ head -20 newfile.txt

bis@kali:~/shellScripting$ head -20 newfile.txt.bkp
newfile.txt.bkp   newfile.txt.bkp1
bis@kali:~/shellScripting$ head -20 newfile.txt.bkp1


-- 2nd line and 27 more line , delete

bis@kali:~/shellScripting$ cat -n newfile.txt
     1  www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
     2  uuidd:x:103:103::/run/uuidd:/usr/sbin/nologin
     3  usbmux:x:104:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
     4  tss:x:105:105:TPM software stack,,,:/var/lib/tpm:/bin/false
     5  systemd-oom:x:990:990:systemd Userspace OOM Killer:/:/usr/sbin/nologin
     6  kernoops:x:106:65534:Kernel Oops Tracking Daemon,,,:/:/usr/sbin/nologin
     7  whoopsie:x:107:109::/nonexistent:/bin/false
     8  dnsmasq:x:999:65534:dnsmasq:/var/lib/misc:/usr/sbin/nologin
     9  avahi:x:108:111:Avahi mDNS daemon,,,:/run/avahi-daemon:/usr/sbin/nologin
    10  tcpdump:x:109:112::/nonexistent:/usr/sbin/nologin
    11  sssd:x:110:113:SSSD system user,,,:/var/lib/sss:/usr/sbin/nologin
    12  speech-dispatcher:x:111:29:Speech Dispatcher,,,:/run/speech-dispatcher:/bin/false
    13  cups-pk-helper:x:112:114:user for cups-pk-helper service,,,:/nonexistent:/usr/sbin/nologin
    14  fwupd-refresh:x:989:989:Firmware update daemon:/var/lib/fwupd:/usr/sbin/nologin
    15  saned:x:113:116::/var/lib/saned:/usr/sbin/nologin
    16  geoclue:x:114:117::/var/lib/geoclue:/usr/sbin/nologin
    17  cups-browsed:x:115:114::/nonexistent:/usr/sbin/nologin
    18  hplip:x:116:7:HPLIP system user,,,:/run/hplip:/bin/false
    19  gnome-remote-desktop:x:988:988:GNOME Remote Desktop:/var/lib/gnome-remote-desktop:/usr/sbin/nologin
    20  polkitd:x:987:987:User for polkitd:/:/usr/sbin/nologin
    21  rtkit:x:117:119:RealtimeKit,,,:/proc:/usr/sbin/nologin
    22  colord:x:118:120:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
    23  gnome-initial-setup:x:119:65534::/run/gnome-initial-setup/:/bin/false
    24  gdm:x:120:121:Gnome Display Manager:/var/lib/gdm3:/bin/false
    25  nm-openvpn:x:121:122:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
    26  bis:x:1000:1000:bis:/home/bis:/bin/bash
    27  sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
    28  prometheus:x:123:125:Prometheus daemon,,,:/var/lib/prometheus:/usr/sbin/nologin
bis@kali:~/shellScripting$ sed -i '2,+27d' newfile.txt
bis@kali:~/shellScripting$ cat -n newfile.txt
     1  www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin








bis@kali:~/shellScripting$ cat -n newfile.txt
     1  root:x:0:0:root:/root:/bin/bash
     2  daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
     3  bin:x:2:2:bin:/bin:/usr/sbin/nologin
     4  sys:x:3:3:sys:/dev:/usr/sbin/nologin
     5  sync:x:4:65534:sync:/bin:/bin/sync
     6  games:x:5:60:games:/usr/games:/usr/sbin/nologin
     7  man:x:6:12:man:/var/cache/man:/usr/sbin/nologin
     8  lp:x:7:7:lp:/var/spool/lpd:/usr/sbin/nologin
     9  mail:x:8:8:mail:/var/mail:/usr/sbin/nologin
    10  news:x:9:9:news:/var/spool/news:/usr/sbin/nologin
    11  uucp:x:10:10:uucp:/var/spool/uucp:/usr/sbin/nologin
    12  proxy:x:13:13:proxy:/bin:/usr/sbin/nologin
    13  www-data:x:33:33:www-data:/var/www:/usr/sbin/nologin
    14  backup:x:34:34:backup:/var/backups:/usr/sbin/nologin
    15  list:x:38:38:Mailing List Manager:/var/list:/usr/sbin/nologin
    16  irc:x:39:39:ircd:/run/ircd:/usr/sbin/nologin
    17  _apt:x:42:65534::/nonexistent:/usr/sbin/nologin
    18  nobody:x:65534:65534:nobody:/nonexistent:/usr/sbin/nologin
    19  systemd-network:x:998:998:systemd Network Management:/:/usr/sbin/nologin
    20  systemd-timesync:x:996:996:systemd Time Synchronization:/:/usr/sbin/nologin
    21  dhcpcd:x:100:65534:DHCP Client Daemon,,,:/usr/lib/dhcpcd:/bin/false
    22  messagebus:x:101:101::/nonexistent:/usr/sbin/nologin
    23  syslog:x:102:102::/nonexistent:/usr/sbin/nologin
    24  systemd-resolve:x:991:991:systemd Resolver:/:/usr/sbin/nologin
    25  uuidd:x:103:103::/run/uuidd:/usr/sbin/nologin
    26  usbmux:x:104:46:usbmux daemon,,,:/var/lib/usbmux:/usr/sbin/nologin
    27  tss:x:105:105:TPM software stack,,,:/var/lib/tpm:/bin/false
    28  systemd-oom:x:990:990:systemd Userspace OOM Killer:/:/usr/sbin/nologin
    29  kernoops:x:106:65534:Kernel Oops Tracking Daemon,,,:/:/usr/sbin/nologin
    30  whoopsie:x:107:109::/nonexistent:/bin/false
    31  dnsmasq:x:999:65534:dnsmasq:/var/lib/misc:/usr/sbin/nologin
    32  avahi:x:108:111:Avahi mDNS daemon,,,:/run/avahi-daemon:/usr/sbin/nologin
    33  tcpdump:x:109:112::/nonexistent:/usr/sbin/nologin
    34  sssd:x:110:113:SSSD system user,,,:/var/lib/sss:/usr/sbin/nologin
    35  speech-dispatcher:x:111:29:Speech Dispatcher,,,:/run/speech-dispatcher:/bin/false
    36  cups-pk-helper:x:112:114:user for cups-pk-helper service,,,:/nonexistent:/usr/sbin/nologin
    37  fwupd-refresh:x:989:989:Firmware update daemon:/var/lib/fwupd:/usr/sbin/nologin
    38  saned:x:113:116::/var/lib/saned:/usr/sbin/nologin
    39  geoclue:x:114:117::/var/lib/geoclue:/usr/sbin/nologin
    40  cups-browsed:x:115:114::/nonexistent:/usr/sbin/nologin
    41  hplip:x:116:7:HPLIP system user,,,:/run/hplip:/bin/false
    42  gnome-remote-desktop:x:988:988:GNOME Remote Desktop:/var/lib/gnome-remote-desktop:/usr/sbin/nologin
    43  polkitd:x:987:987:User for polkitd:/:/usr/sbin/nologin
    44  rtkit:x:117:119:RealtimeKit,,,:/proc:/usr/sbin/nologin
    45  colord:x:118:120:colord colour management daemon,,,:/var/lib/colord:/usr/sbin/nologin
    46  gnome-initial-setup:x:119:65534::/run/gnome-initial-setup/:/bin/false
    47  gdm:x:120:121:Gnome Display Manager:/var/lib/gdm3:/bin/false
    48  nm-openvpn:x:121:122:NetworkManager OpenVPN,,,:/var/lib/openvpn/chroot:/usr/sbin/nologin
    49  bis:x:1000:1000:bis:/home/bis:/bin/bash
    50  sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
    51  prometheus:x:123:125:Prometheus daemon,,,:/var/lib/prometheus:/usr/sbin/nologin
bis@kali:~/shellScripting$ sed -i '2,+49d' newfile.txt
bis@kali:~/shellScripting$ cat -n newfile.txt
     1  root:x:0:0:root:/root:/bin/bash



delete last line
bis@kali:~/shellScripting$ tail -1  newfile.txt
prometheus:x:123:125:Prometheus daemon,,,:/var/lib/prometheus:/usr/sbin/nologin
bis@kali:~/shellScripting$ sed -i '$d' newfile.txt
bis@kali:~/shellScripting$ tail -1  newfile.txt
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin




delete except last line

bis@kali:~/shellScripting$ tail -1  newfile.txt
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin
bis@kali:~/shellScripting$
bis@kali:~/shellScripting$
bis@kali:~/shellScripting$ sed -i '$!d' newfile.txt
bis@kali:~/shellScripting$ cat newfile.txt
sshd:x:122:65534::/run/sshd:/usr/sbin/nologin


bis@kali:~/shellScripting$ head -2 newfile.txt
root:x:0:0:root:/root:/bin/bash
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bis@kali:~/shellScripting$ sed -i '/root/d' newfile.txt                     search root and delete it 
bis@kali:~/shellScripting$ head -2 newfile.txt
daemon:x:1:1:daemon:/usr/sbin:/usr/sbin/nologin
bin:x:2:2:bin:/bin:/usr/sbin/nologin



s1mahdc01:bis> head -2 /tmp/delete3-times.txt
delete case maj:
delete case civil-nohit-skip-reverse [[elementId:-1

s1mahdc01:bis> sed -i '1,2d' /tmp/delete3-times.txt

