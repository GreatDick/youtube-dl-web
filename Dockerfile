FROM python:3.6-slim

RUN apt update -y && apt upgrade -y && apt install git ffmpeg -y
RUN pip install youtube-dl flask setuptools
RUN git clone https://github.com/d0u9/youtube-dl-webui.git
RUN cd youtube-dl-webui && python setup.py install
COPY config.json /root/youtube-dl-webui/config.json

EXPOSE 5000

CMD youtube-dl-webui -c /root/youtube-dl-webui/config.json
