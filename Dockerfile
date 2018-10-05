########## How To Use Docker Image ###############
##
##  Image Name: denny/python-selenium:v1
##
##  Start container:
##    mkdir -p /tmp/screenshot && chmod 777 /tmp/screenshot
##    docker run -d -p 4444:4444 -v /tmp/screenshot:/tmp/screenshot -h selenium --name selenium denny/python-selenium:v1
##
##  Run seleinum test
##    docker exec selenium python /home/seluser/selenium_load_page.py --page_url http://devnetstack.com
##
##################################################

# Base image: https://hub.docker.com/r/selenium/standalone-chrome/

FROM selenium/standalone-chrome:latest

USER root

ADD selenium_load_page.py /home/seluser/selenium_load_page.py

# install selenium python sdk
RUN apt-get -y update && apt-get install -y --no-install-recommends curl inetutils-ping && \
    apt-get install -y --no-install-recommends python python-pip && \
    chmod 777 /home/seluser/selenium_load_page.py && \

# Download seleinum page load test scripts
    pip install selenium==3.14.1 && \

# Cleanup to make image small
    apt-get -y remove && apt-get -y autoremove && rm -rf /var/cache/apk/* && \

# Switch back to normal OS user
USER seluser

WORKDIR /home/seluser
