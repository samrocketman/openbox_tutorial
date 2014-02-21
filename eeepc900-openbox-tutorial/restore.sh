#!/bin/sh
#Sams openbox full config restore
backup=/media/disk/minibeast_backup

#copy backup archives
echo "Copying adesklets widgets and settings."
cp $backup/adesklets.tar.gz ~/
echo "Copying settings for openbox, custom scripts, and tint2."
cp $backup/config.tar.gz ~/.config/
echo "Copying wbar settings"
sudo cp $backup/wbar-settings.tar.gz /usr/share/
echo "Copying other programs settings."
cp $backup/home-settings.tar.gz ~/
echo "Copying user data backup."
cp $backup/userdata.tar.gz ~/
echo "Copying modelsim for Linux."
sudo cp $backup/modelsim.tar.gz /opt/
echo "Copying backup scripts."
cp $backup/backup.sh ~/
cp $backup/restore.sh ~/

#restore archives to useable data
cd ~
echo "Restoring adesklets settings and widgets.."
tar -xzf ./adesklets.tar.gz
echo "Restoring other programs settings.."
tar -xzf ./home-settings.tar.gz
echo "Restoring userdata: Desktop, Documents, Downloads, Music, Pictures.."
tar -xzf ./userdata.tar.gz
rm adesklets.tar.gz home-settings.tar.gz userdata.tar.gz
cd ~/.config
echo "Restoring settings for openbox, custom scripts, tint2, and wbar.."
tar -xzf ./config.tar.gz
rm config.tar.gz
cd /usr/share/
echo "Restoring wbar settings..."
sudo tar -xzf ./wbar-settings.tar.gz
sudo rm wbar-settings.tar.gz
cd /opt/
echo "Restoring modelsim for Linux.."
sudo tar -xzf ./modelsim.tar.gz
ln -s /opt/modelsim/vsim.sh /usr/bin/
sudo rm modelsim.tar.gz
echo "done."
echo "When restoring don't forget to edit the sudoers file with:"
echo "%admin ALL=NOPASSWD: /sbin/poweroff, /sbin/reboot, /usr/bin/setpci"
