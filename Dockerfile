# syntax=docker/dockerfile:1
FROM debian:bullseye-20220822-slim@sha256:f21a32253b030826c59cd71de36996e2fd6d820d47f40a6fc1b30d64db677837
VOLUME ["/robot_tests"]

# Update apt and install apt packages
RUN apt update && apt install -y unzip python3 pip xvfb wget

# Install chrome and chromedrive
RUN wget -qP /tmp/ "https://chromedriver.storage.googleapis.com/105.0.5195.52/chromedriver_linux64.zip" \
    && unzip -o /tmp/chromedriver_linux64.zip -d /usr/bin \
    && rm -f /tmp/chromedriver_linux64.zip 

RUN wget -qP /tmp/ "http://dl.google.com/linux/chrome/deb/pool/main/g/google-chrome-stable/google-chrome-stable_105.0.5195.102-1_amd64.deb" \
    && apt install -y /tmp/google-chrome-stable_105.0.5195.102-1_amd64.deb \
    && rm -f /tmp/google-chrome-stable_105.0.5195.102-1_amd64.deb

# Install python and requirements
COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

# Add virtual monitor for screencapture and allowing non headlessrun
ENV DISPLAY=:0

WORKDIR /robot_tests