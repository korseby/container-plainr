# add cran R backport
sudo apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480
sudo echo "deb http://cran.uni-muenster.de/bin/linux/debian jessie-cran3/" >> /etc/apt/sources.list

# update & upgrade sources
sudo apt-get -y update
sudo apt-get -y dist-upgrade

# install packages
sudo apt-get -y install r-base netcdf-bin libnetcdf-dev libdigest-sha-perl

# install development files needed for xcms
sudo apt-get -y install git xorg-dev libglu1-mesa-dev freeglut3-dev libgomp1 libxml2-dev gcc-4.9 g++-4.9 libgfortran-4.9-dev libcurl4-gnutls-dev
sudo update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50
sudo update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
sudo update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-4.9 50

# clean up
sudo apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*



# Add scripts folder to container
ADD . /scripts

# Define Entry point script
#ENTRYPOINT ["/scripts/runIPO.R"]



