FROM python:buster

RUN pip install robotframework
RUN pip install --upgrade robotframework-seleniumlibrary
RUN pip install RoboMachine
RUN mkdir /testsuite
WORKDIR /testsuite


RUN apt-get update -y

# Dependencies
RUN apt-get install -y  \
       apt-utils \
       build-essential \
       fonts-liberation \
       gconf-service \
       libappindicator1 \
       libasound2 \
       libffi-dev \
       libgconf-2-4 \
       libindicator7 \
       libnspr4 \
       libnss3 \
       libpango1.0-0 \
       libssl-dev \
       libxss1 \
       python-dev \
       python-pip \
       python-pyasn1 \
       python-pyasn1-modules \
       unzip \
       wget \
       xdg-utils \
       xvfb \
       libappindicator3-1 \
       libatk-bridge2.0-0 \
       libgtk-3-0 \
       lsb-release

# Install Chrome for Selenium
RUN curl https://dl.google.com/linux/direct/google-chrome-stable_current_amd64.deb -o /chrome.deb
RUN dpkg -i /chrome.deb || apt-get install -yf
RUN rm /chrome.deb

# Install chromedriver for Selenium
RUN curl https://chromedriver.storage.googleapis.com/2.42/chromedriver_linux64.zip -o /usr/local/bin/chromedriver
RUN unzip -o /usr/local/bin/chromedriver -d /usr/local/bin
RUN chmod +x /usr/local/bin/chromedriver


CMD ["robomachine", "--tests-max", "10", "--actions-max", "20", "--to-state", "'Welcome Page'", "--generation-algorithm", "random", "generator.robomachine" ]
