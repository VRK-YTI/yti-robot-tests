# syntax=docker/dockerfile:1
FROM debian:bullseye-slim@sha256:cd1bc32f233a49f1b82149c9edb8ef34fb1e6c45f37211445c51a97603468604

VOLUME ["/robot_tests"]

USER root

# Update apt and install apt packages
RUN apt update && apt install -y unzip python3 pip xvfb gnupg wget uuid-runtime curl jq

# install chromium and set it as the "chrome" browser for robot framework
RUN apt install -y chromium chromium-driver
ENV CHROME_BROWSER_PATH /usr/bin/chromium
ENV CHROME_DRIVER_PATH=/usr/bin/chromedriver

# Install python and requirements
COPY requirements.txt requirements.txt
RUN python3 -m pip install -r requirements.txt

# Add virtual monitor for screencapture and allowing non headlessrun
ENV DISPLAY=:0

WORKDIR /robot_tests