FROM selenium/standalone-chrome:3.13
USER root

RUN apt-get update -y

RUN apt-get install -y  \
       python \
       python-pip

RUN pip install robotframework
RUN pip install -U requests
RUN pip install selenium
RUN pip install --upgrade robotframework-seleniumlibrary

RUN mkdir /testsuite
WORKDIR /testsuite

CMD ["robot","--outputdir", "/reports", "./*"]