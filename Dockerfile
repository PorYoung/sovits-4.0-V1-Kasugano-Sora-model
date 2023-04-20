FROM python:3.8

WORKDIR /work

RUN apt update
RUN apt install -y git libsndfile1-dev python3 python3-dev python3-pip ffmpeg
RUN python3 -m pip install --no-cache-dir --upgrade pip

RUN git clone https://github.com/svc-develop-team/so-vits-svc.git && cd so-vits-svc
RUN pip install --no-cache-dir --upgrade -r /work/so-vits-svc/requirements.txt

ENV SERVER_NAME="0.0.0.0"
ENV SERVER_PORT=7860

CMD ["python", "webUI.py"]
