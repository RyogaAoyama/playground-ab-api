
FROM python:3.10

# ファイルをappディレクトリに追加
COPY . /usr/src

# ルートディレクトリ設定
WORKDIR /usr/src

# mysql-clientインストール
RUN apt-get update \
&& apt-get install -y --no-install-recommends default-mysql-client=1.0.7 jq=1.6-2.1 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

# rainインストール
ARG RAIN_VER=1.2.0
ADD https://github.com/aws-cloudformation/rain/releases/download/v${RAIN_VER}/rain-v${RAIN_VER}_linux-amd64.zip /tmp/rain.zip
RUN apt-get install unzip -y \
    && unzip -j /tmp/rain.zip */rain -d /usr/local/bin/ \
    && chmod 755 /usr/local/bin/rain \
    && rm /tmp/rain.zip

# vimインストール
RUN apt-get update
RUN apt-get install vim -y

# pipライブラリインストール
RUN pip install --no-cache-dir -r requirements.txt
