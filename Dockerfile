FROM python:3.8

RUN apt update
RUN apt install -y git libsndfile1-dev python3 python3-dev python3-pip ffmpeg
RUN python3 -m pip install --no-cache-dir --upgrade pip

WORKDIR /work
COPY . .
RUN cd /work/so-vits-svc/pretrain && \
  wget -c https://github.com/openvpi/vocoders/releases/download/nsf-hifigan-v1/nsf_hifigan_20221211.zip && \
  unzip -q nsf_hifigan_20221211.zip

RUN pip install --no-cache-dir --upgrade -r /work/so-vits-svc/requirements.txt

ENV SERVER_NAME="0.0.0.0"
ENV SERVER_PORT=7860

WORKDIR /work/so-vits-svc

CMD ["python3", "webUI.py"]