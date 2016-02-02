FROM debian

MAINTAINER Kristian Peters <kpeters@ipb-halle.de>

LABEL Description="Here, Bioconductor is being installed in Docker."

# Add scripts folder to container
ADD https://raw.githubusercontent.com/korseby/docker-plainr/master/rscript.r /scripts/

# add cran R backport
RUN apt-key adv --keyserver keys.gnupg.net --recv-key 381BA480
RUN echo "deb http://cran.uni-muenster.de/bin/linux/debian jessie-cran3/" >> /etc/apt/sources.list

# update & upgrade sources
RUN apt-get -y update
RUN apt-get -y dist-upgrade

# install packages
RUN apt-get -y install r-base netcdf-bin libnetcdf-dev libdigest-sha-perl 

# install development files needed for xcms
RUN apt-get -y install git xorg-dev libglu1-mesa-dev freeglut3-dev libgomp1 libxml2-dev gcc-4.9 g++-4.9 libgfortran-4.9-dev libcurl4-gnutls-dev
RUN update-alternatives --install /usr/bin/g++ g++ /usr/bin/g++-4.9 50
RUN update-alternatives --install /usr/bin/gcc gcc /usr/bin/gcc-4.9 50
RUN update-alternatives --install /usr/bin/cpp cpp /usr/bin/cpp-4.9 50

# clean up
RUN apt-get -y clean && apt-get -y autoremove && rm -rf /var/lib/{cache,log}/ /tmp/* /var/tmp/*

# install Bioconductor
RUN Rscript /scripts/rscript.r



# Define Entry point script
ENTRYPOINT ["R"]

