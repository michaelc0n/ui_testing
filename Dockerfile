########## HOW TO ###############
##
##  Start container:
##    mkdir -p /tmp/screenshot && chmod 777 /tmp/screenshot
##    docker run -d -p 4444:4444 -v /tmp/screenshot:/tmp/screenshot -h selenium --name selenium michaelc0n/python-selenium:1.0
##
##  Run seleinum test
##    docker exec selenium python3 selenium_load_page.py --page_url http://devnetstack.com --should_save_screenshot
##
#################################

FROM selenium/standalone-chrome:latest

USER root

WORKDIR /home/seluser

COPY selenium_load_page.py ./

RUN apt-get -y update && apt-get install -y --no-install-recommends python3 python3-pip && \
    pip3 install --no-cache-dir selenium==3.14.1 && \
    apt-get -y remove && apt-get -y autoremove && rm -rf /var/cache/apk/*

RUN chown -R seluser:seluser ./

USER seluser
