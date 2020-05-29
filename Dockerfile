FROM ubuntu:18.04
LABEL Description="4D v18: The future of modern Business Applications" Vendor="4D" Version="0.18.3" maintainer="abdellatif.miftahi@wakanda.io"
RUN apt-get update && apt-get install -y \
    unixodbc-dev \
    libfreeimage-dev \
    libbsd-dev
RUN apt-get update && apt-get install -y locales && rm -rf /var/lib/apt/lists/* \
    && localedef -i en_US -c -f UTF-8 -A /usr/share/locale/locale.alias en_US.UTF-8
ENV LANG en_US.utf8
COPY Licenses /usr/local/share/4d-server/Licenses
COPY 4d-server /opt/4d-server
COPY start-4d.sh /opt/start-4d.sh 
EXPOSE 80
CMD /opt/start-4d.sh 
