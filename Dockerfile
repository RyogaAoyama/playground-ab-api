
# PythonのDockerイメージを指定
FROM python:3.10

# ファイルをappディレクトリに追加
COPY . /usr/src/app

# ルートディレクトリ設定
WORKDIR /usr/src/app

# mysql-clientインストール
RUN apt-get update \
&& apt-get install -y --no-install-recommends default-mysql-client=1.0.7 jq=1.6-2.1 \
&& apt-get clean \
&& rm -rf /var/lib/apt/lists/*

#ライブラリインストール
RUN pip install --no-cache-dir -r requirements.txt
