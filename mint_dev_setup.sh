#!/bin/bash
# -------------------------------------------------------- #
# Setup script for Linux Mint 17.2
# download and install packages (primarily) for development
# -------------------------------------------------------- #
# Created: 2016-01-28
# -------------------------------------------------------- #

# Some packages are self updating or too out of date in the repos,
# so this is where to list the download URL
arr_downloads=(
    'https://atom.io/download/deb'
    'https://www.dropbox.com/download?dl=packages/debian/dropbox_2015.10.28_amd64.deb'
)

download_dir="~/package_downloads"

# Packages in this list need to be available in the package manager (apt-get)
arr_packages=(
    'gir1.2-gtop-2.0'
    'htop'
    'nmon'
    'dnsutils'
    'git'
    'sublime-text'
    'chromium-browser'
    'mysql-workbench'
)

# ---
# Compile the array as a string and run the install of the Packages
# ---
install=""
for item in ${arr_packages[*]}
do
    install="$install $item "
done
sudo apt-get install $install
# ---


# ---
# Docker specific install
# https://docs.docker.com/linux/step_one/
# ---
if $(hash docker)
then
    echo "docker installed"
else
    echo "docker not installed, grabbing it now..."
    wget -qO- https://get.docker.com/gpg | sudo apt-key add -
    wget -qO- https://get.docker.com/ | sh
fi
# ---

# ---
# Install owncloud
# https://software.opensuse.org/download/package?project=isv:ownCloud:desktop&package=owncloud-client
# ---
if $(hash owncloud)
then
    echo "owncloud installed"
else
    echo "owncloud not installed, grabbing it now..."
    sudo sh -c "echo 'deb http://download.opensuse.org/repositories/isv:/ownCloud:/desktop/Ubuntu_14.04/ /' >> /etc/apt/sources.list.d/owncloud-client.list"
    sudo apt-get update
    sudo apt-get install owncloud-client
# ---

# ---
# Download manual packages and install them
# ---
if [ ! -d $download_dir ]
then
    mkdir -p $download_dir
fi

for item in ${arr_downloads[*]}
do
    wget $item -P $download_dir
done

for i in $download_dir/*.deb
do
    sudo dpkg -i $i
fi
# ---
