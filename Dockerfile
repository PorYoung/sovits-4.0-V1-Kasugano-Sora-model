FROM python:3.8

RUN apt update
RUN apt install -y git libsndfile1-dev python3 python3-dev python3-pip ffmpeg
RUN python3 -m pip install --no-cache-dir --upgrade pip

# Set up a new user named "user" with user ID 1000
RUN useradd -m -u 1000 user

# Switch to the "user" user
USER user

# Set home to the user's home directory
ENV HOME=/home/user \
	PATH=/home/user/.local/bin:$PATH

# Set the working directory to the user's home directory
WORKDIR $HOME/

# Copy the current directory contents into the container at $HOME/app setting the owner to the user
COPY --chown=user . .

RUN cd $HOME/so-vits-svc/pretrain && \
  wget -c https://github.com/openvpi/vocoders/releases/download/nsf-hifigan-v1/nsf_hifigan_20221211.zip && \
  unzip -q nsf_hifigan_20221211.zip

RUN pip install --no-cache-dir --upgrade -r $HOME/so-vits-svc/requirements.txt

ENV SERVER_NAME="0.0.0.0"
ENV SERVER_PORT=7860

WORKDIR $HOME/so-vits-svc

CMD ["python3", "webUI.py"]