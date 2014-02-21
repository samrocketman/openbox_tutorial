#!/bin/sh
#Sams openbox full config backup
backup=/media/disk/minibeast_backup
mkdir $backup
cd ~
echo "Backup adesklets widgets and settings"
#backup my widgets
tar -cO Widgets .adesklets | gzip > $backup/adesklets.tar.gz
cd .config
echo "Backup settings for openbox, custom scripts, tint2, and wbar"
tar -cO audacious google-chrome openbox scripts tint2 | gzip > $backup/config.tar.gz
#backup wbar settings and icons
cd /usr/share/
tar -cO wbar | gzip > $backup/wbar-settings.tar.gz
cd ~
echo "Backup other programs settings"
tar -cO .bash* .gimp-2.6 .purple .Skype .supertux2 synergy.conf .thunderbird .mozilla .xmoto | gzip > $backup/home-settings.tar.gz
echo "Backup user data: Desktop, Documents, Downloads, Music, Pictures"
#backup documents, pictures, and desktop
tar -cO Desktop Documents Downloads Music Pictures backup.sh | gzip > $backup/userdata.tar.gz
#backup modelsim
echo "Backup modelsim"
cd /opt/
cp /usr/local/share/applications/modelsim.desktop modelsim/
tar -cO modelsim | gzip > $backup/modelsim.tar.gz
cd ~
cp ./backup.sh $backup
echo "done."
echo "When restoring don't forget to edit the sudoers file with:"
echo "%admin ALL=NOPASSWD: /sbin/poweroff, /sbin/reboot, /usr/bin/setpci"
