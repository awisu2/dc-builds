# dc-builds

色々と開発時に必要となるコマンドや環境をdockerでビルドする  
dockerが動作していれば自前で環境を用意しなくてもよいように

## build

```bash
docker-compose build
```

## run

mac/linux

```bash
docker run -it --rm -v $PWD:/local -w /local {image} {command} {args...}
```

windows

```cmd
docker run -it --rm -v %CD%:/local -w /local {image} {command} {args...}
```

## サポートコマンド

### windows

PATHにこのディレクトリのbinを追加するとdob.cmdが利用できるようになります。

- `dob.cmd {command}[ {options}]`
  - ex: `dob.cmd webpack --version`
