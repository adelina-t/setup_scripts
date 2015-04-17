# clean up environment
# stop nova, stop neutron
# uninstall nova-compute

$nova_service = "nova-compute"
$neutorn_service = "neutron-hyperv-agent"
$nova_product_name = "OpenStack Hyper-V Nova Compute Beta"

$default_openstack_dir = "C:\OpenStack"
$default_install_dir = "C:\Program Files (x86)\Cloudbase Solutions"

net stop $nova_service
net stop $neutron_service

$openstack_product = Get-WmiObject win32_product | ?{$_.Name -like $nova_product_name}

echo "Uninstalling $openstack_product"
$openstack_product.Uninstall()

# clean virtual machine folders and log folder
# (to do check in nova conf for the folder location)

echo "removing $default_openstack_dir $default_install_dir"
Remove-Item -recurse -force $default_openstack_dir
Remove-Item -recurse -force $default_install_dir
