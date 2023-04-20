FROM python:3.8

WORKDIR /work

RUN apt update
RUN apt install -y git libsndfile1-dev python3 python3-dev python3-pip ffmpeg
RUN python3 -m pip install --no-cache-dir --upgrade pip

COPY ./so-vits-svc /work/
RUN cd /work/so-vits/pretrain/
RUN wget -c https://github.com/openvpi/vocoders/releases/download/nsf-hifigan-v1/nsf_hifigan_20221211.zip
RUN unzip -q nsf_hifigan_20221211.zip
RUN cd /work/so-vits-svc/
RUN pip install --no-cache-dir --upgrade -r /work/so-vits-svc/requirements.txt

ENV SERVER_NAME="0.0.0.0"
ENV SERVER_PORT=7860

RUN python webUI.py
