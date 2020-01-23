#!/bin/bash
# Bash script to mount devices for installation server

echo "dev_key" >> /root/.ssh/authorized_keys
sed -i 's/.*ssh-rsa/ssh-rsa/g' /root/.ssh/authorized_keys
sed -i 's/ no$/ yes/g' /etc/ssh/sshd_config
systemctl restart sshd


echo 'for device in $(echo  "/dev/vdb /dev/vdc");do
if [ ! -e $device ]; then
    break;
fi

case "$device" in
    /dev/vda)
    mount_point="/data";;
    /dev/vdb)
    mount_point="/agent";;
    /dev/vdc)
    mount_point="/agent/all_backup";;
esac

echo $mount_point

if [ -e $mount_point ];then
    rm -rf $mount_point
fi

echo -e "n\np\n\n\n\nw\n" | fdisk $device
partprobe
device_name=$(lsblk -r $device| grep "part $" | tail -1 | sed "s/ .*//g")
mkfs -t ext4 /dev/$device_name;sleep 10;mkfs -t ext4 /dev/$device_name;sleep 10;mkfs -t ext4 /dev/$device_name
uuid=$(blkid /dev/$device_name | sed "s/.*\(UUID[^ ]*\) .*/\1/g")
echo "$uuid     $mount_point     ext4    defaults        1       1" >> /etc/fstab;cat /etc/fstab
mkdir -p $mount_point
mount $mount_point
done

ln -s /agent /data;mkdir -p /data /agent
