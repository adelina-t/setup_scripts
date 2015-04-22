#!bin/bash

wget http://download.cirros-cloud.net/0.3.3/cirros-0.3.3-x86_64-disk.img -P /tmp/

IMG_PATH=/tmp/cirros-0.3.3-x86_64-disk.img
VHD_PATH=/tmp/cirros.vhd
VHDX_PATH=/tmp/cirros.vhdx

qemu-img convert -f qcow2 -O vpc $IMG_PATH $VHD_PATH
qemu-img convert -f qcow2 -O vhdx $IMG_PATH $VHDX_PATH

glance image-create --disk-format vhd --container-format bare --file $VHD_PATH --name cirros_vhd
glance image-create --disk-format vhd --container-format bare --file $VHDX_PATH --name cirros_vhdx

nova image-list
