# It Builds an image to deploy a Rserve

# Dotcloud ubuntu image
FROM ubuntu:14.04
MAINTAINER Felipe Triana, ftrianakast@gmail.com

# Update
RUN apt-get update

# Install wget
RUN apt-get install -y wget
RUN apt-get install -y sudo

# Install latest R
RUN sh -c 'echo "deb http://cran.rstudio.com/bin/linux/ubuntu trusty/" >> /etc/apt/sources.list'
RUN gpg --keyserver keyserver.ubuntu.com --recv-key E084DAB9
RUN gpg -a --export E084DAB9 | sudo apt-key add -
RUN apt-get update
RUN sudo apt-get -y install r-base
RUN sudo apt-get -y install r-cran-rcpp 
# Important additional libraries
RUN apt-get install -y libcurl4-gnutls-dev --fix-missing
RUN apt-get install -y libxml2-dev
RUN apt-get install -y libmime-base64-urlsafe-perl libdigest-hmac-perl libdigest-sha-perl
RUN apt-get install -y libssl-dev

# adding start R script: you can find the RScript on the docker github
ADD start.R start.R
ADD Rserv.conf /etc/Rserv.conf
EXPOSE 6311
CMD Rscript start.R
