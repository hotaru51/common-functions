# common-functions

自宅サーバ用シェルスクリプト共通関数

## Setup

```sh
mkdir <適当なディレクトリ>
cd <適当なディレクトリ>
git init
git submodule add https://github.com/hotaru51/common-functions.git lib
cd lib
./setup.sh
```

## テスト環境

```sh
cd test
docker build . -t common-functions-env
cd ..
docker run --rm -it -v `pwd`:/opt/test_scripts/lib common-functions-env /bin/bash
```
