FROM python:3.9

WORKDIR /work

RUN git clone https://github.com/svc-develop-team/so-vits-svc.git && cd so-vits-svc

RUN pip install --no-cache-dir --upgrade -r /work/requirements.txt

CMD ["uvicorn", "app.main:app", "--host", "0.0.0.0", "--port", "7860"]
