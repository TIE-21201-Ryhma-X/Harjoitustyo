FROM python:buster

RUN pip install robotframework
RUN pip install --upgrade robotframework-seleniumlibrary

RUN mkdir /testsuite
WORKDIR /testsuite

CMD [robot ]