#!bin/bash

wget https://raw.githubusercontent.com/cloudbase/ci-overcloud-init-scripts/master/scripts/devstack_vm/cirros.vhd -P /tmp/

IMG_PATH=/tmp/cirros-0.3.3-x86_64-disk.img
VHD_PATH=/tmp/cirros.vhd
VHDX_PATH=/tmp/cirros.vhdx

qemu-img convert -f qcow2 -O vpc $IMG_PATH $VHD_PATH
qemu-img convert -f qcow2 -O vhdx $IMG_PATH $VHDX_PATH

glance image-create --disk-format vhd --container-format bare --file $VHD_PATH --name cirros_vhd --property hypervisor_type=hyperv
glance image-create --disk-format vhd --container-format bare --file $VHDX_PATH --name cirros_vhdx --property hypervisor_type=hyperv
glance image-create --disk-format vhd --container-format bare --file $VHDX_PATH --name cirros_vhdx_gen2 --property hw_machine_type=hyperv-gen2

nova image-list
