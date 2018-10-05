# python-selenium
Use Python Selenium For GUI Automation Test

# How To Start Test
```
# Start container
docker run -d -p 4444:4444 -v /tmp/screenshot:/tmp/screenshot -h selenium --name selenium michaelc0n/python-selenium:1.0

# Run A Sample Test. 
docker exec selenium python3 /home/seluser/selenium_load_page.py --page_url http://devnetstack.com --should_save_screenshot

# Check Screenshot
ls -lth /tmp/screenshot
```
