FROM openjdk:8

# Set Grails version (default: 3.2.8; min: 3.0.0; max: 3.2.8).
ENV GRAILS_VERSION 2.4.2

# Update
RUN apt-get -qq update && apt-get -qq upgrade -y && apt-get -qq autoremove -y

# Install Grails
WORKDIR /usr/lib/jvm
RUN wget -q  https://github.com/grails/grails-core/releases/download/v$GRAILS_VERSION/grails-$GRAILS_VERSION.zip && \
    unzip -q grails-$GRAILS_VERSION.zip && \
    rm -rf grails-$GRAILS_VERSION.zip && \
    ln -s grails-$GRAILS_VERSION grails

# Setup Grails path
ENV GRAILS_HOME /usr/lib/jvm/grails
ENV PATH $GRAILS_HOME/bin:$PATH

# Create App Directory
RUN mkdir /app

# Set Workdir
WORKDIR /app
