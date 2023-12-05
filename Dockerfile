# syntax=docker/dockerfile:1
FROM debian:bullseye-20220822-slim@sha256:f21a32253b030826c59cd71de36996e2fd6d820d47f40a6fc1b30d64db677837
VOLUME ["/robot_tests"]

# Update apt and install apt packages
RUN apt update && apt install -y unzip python3 pip xvfb wget

# Install chrome and chromedrive
RUN wget -qP /tmp/ "https://edgedl.me.gvt1.com/edgedl/chrome/chrome-for-testing/119.0.6045.105/linux64/chromedriver-linux64.zip" \
    && unzip -o /tmp/chromedriver-linux64.zip -d /usr/bin \
    && rm -f /tmp/chromedriver-linux64.zip \
    && mv /usr/bin/chromedriver-linux64/chromedriver /usr/bin/chromedriver

RUN wget -qP /tmp/ "https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb" \
    && apt install -y /tmp/google-chrome-stable_current_amd64.deb \
    && rm -f /tmp/google-chrome-stable_current_amd64.deb

#COPY google-chrome-stable_current_amd64.deb google-chrome-stable_current_amd64.deb 
#RUN apt install -y ./google-chrome-stable_current_amd64.deb 

# Install firefox and geckodriver
#RUN apt install -y firefox-esr=91.13.0esr-1~deb11u1 
#RUN wget -qP /tmp/ https://github.com/mozilla/geckodriver/releases/download/v0.31.0/geckodriver-v0.31.0-linux64.tar.gz \
#    && tar -xvzf /tmp/geckodriver-v0.31.0-linux64.tar.gz -C /usr/local/bin/ \
#    && rm -f /tmp/geckodriver-v0.31.0-linux64.tar.gz

# Install python and requirements
COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

# Add virtual monitor for screencapture and allowing non headlessrun
ENV DISPLAY=:0

WORKDIR /robot_tests
