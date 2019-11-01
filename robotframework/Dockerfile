FROM python:3.8

RUN pip install robotframework
RUN pip install -U requests
RUN pip install -U robotframework-requests

RUN mkdir /testsuite
WORKDIR /testsuite

CMD ["robot","--outputdir", "/reports", "./*"]