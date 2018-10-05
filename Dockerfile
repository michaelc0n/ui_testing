########## How To Use Docker Image ###############
##
##  Start container:
##    mkdir -p /tmp/screenshot && chmod 777 /tmp/screenshot
##    docker run -d -p 4444:4444 -v /tmp/screenshot:/tmp/screenshot -h selenium --name selenium michaelc0n/python-selenium:1.0
##
##  Run seleinum test
##    docker exec selenium python /home/seluser/selenium_load_page.py --page_url http://devnetstack.com --should_save_screenshot
##
##################################################

# Base image: https://hub.docker.com/r/selenium/standalone-chrome/

FROM selenium/standalone-chrome:latest

USER root

WORKDIR /home/seluser

COPY selenium_load_page.py ./

# install selenium python sdk
RUN apt-get -y update && apt-get install -y --no-install-recommends python3.6 && \
    pip3.6 install --no-cache-dir selenium==3.14.1 && \
#RUN pip3.6 install --no-cache-dir selenium==3.14.1 && \
# Cleanup to make image small
    apt-get -y remove && apt-get -y autoremove && rm -rf /var/cache/apk/* && rm -r /root/.cache

RUN chown -R seluser:seluser ./

USER seluser
