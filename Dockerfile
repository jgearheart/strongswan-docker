FROM ubuntu

# author
MAINTAINER Jeremiah Gearheart

# extra metadata
LABEL version="1.0"
LABEL description="Ubuntu container strongswan"

# update sources list
RUN apt-get clean
RUN apt-get update
RUN echo Y | apt-get upgrade

# install basic apps, one per line for better caching
RUN apt-get install -qy git
RUN apt-get install -qy locales
RUN apt-get install -qy nano
RUN apt-get install -qy tmux
RUN apt-get install -qy wget
RUN apt-get install -qy curl
RUN apt-get install -qy unzip
RUN apt-get install -qy gsutil
RUN apt-get install -qy net-tools
RUN apt install strongswan -y



#Configure Paths and add shell script to run okta-aws command
COPY strongswan.sh /
RUN chmod +x strongswan.sh && bash strongswan.sh -i

# cleanup
RUN apt-get -qy autoremove

