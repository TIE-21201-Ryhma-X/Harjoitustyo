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
RUN pip install RoboMachine

RUN mkdir /testsuite
WORKDIR /testsuite

CMD ["robomachine", "--tests-max", "10", "--actions-max", "20", "--to-state", "'Welcome Page'", "--generation-algorithm", "random", "generator.robomachine" ]
