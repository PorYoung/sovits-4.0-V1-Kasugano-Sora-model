FROM python:3.9

WORKDIR /work

RUN git clone https://github.com/svc-develop-team/so-vits-svc.git && cd so-vits-svc

RUN ["apt", "update"]
RUN ["apt", "install", "-y", "gcc-9 g++-9", "build-essential", "python3-dev", "libpython3.9-dev"]
RUN ["apt", "install", "-y", "sox", "ffmpeg", "libcairo2", "libcairo2-dev", "libgirepository1.0-dev"]
RUN ["pip", "install", "-U", "pip", "setuptools", "wheel"]

RUN pip install --no-cache-dir --upgrade -r /work/so-vits-svc/requirements.txt

ENV SERVER_NAME="0.0.0.0"
ENV SERVER_PORT=7860

CMD ["python", "webUI.py"]
