# install openstack hyperv driver using installer

$beta_installer_link = "https://www.cloudbase.it/downloads/HyperVNovaCompute_Beta.msi"

$download_path = "$env:temp\installer.msi"

echo "Downloading Installer"
Invoke-WebRequest -uri $beta_installer_link -outfile $download_path

Unblock-File $download_path
Start-Process $download_path
