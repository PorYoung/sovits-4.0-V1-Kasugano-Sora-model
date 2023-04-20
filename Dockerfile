FROM python:3.9

WORKDIR /work

RUN git clone https://github.com/svc-develop-team/so-vits-svc.git && cd so-vits-svc

RUN ["apt", "update"]
RUN ["apt", "install", "-y", "build-essential", "libpython3.9-dev"]
RUN ["pip", "install", "-U", "pip", "setuptools", "wheel"]

RUN pip install --no-cache-dir --upgrade -r /work/so-vits-svc/requirements.txt

ENV SERVER_NAME="0.0.0.0"
ENV SERVER_PORT=7860

CMD ["python", "webUI.py"]
