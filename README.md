# hello-distroless

Google の distroless の練習。

- [distroless/examples/python3 at main · GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless/tree/main/examples/python3)
- via [distroless/python3/README.md at main · GoogleContainerTools/distroless](https://github.com/GoogleContainerTools/distroless/blob/main/python3/README.md)
- via [GoogleContainerTools/distroless: 🥑 Language focused docker images, minus the operating system.](https://github.com/GoogleContainerTools/distroless/tree/main)

で、一番上のリンクから `Dockerfile` と `hello.py` をコピーしてきたもの。

```sh
docker build . -t hello-distroless
docker run --rm hello-distroless
```

で /etc の下のファイルが再帰的にリストされる。

`hello.py` は shebang が普通でないので、ローカルでは

```sh
python3 hello.py .
```

のように実行する。distroless の Docker 上では shebang は見てない。そもそも shell がない。なので書き換えてもいいかもね。
→ 書き換えました

イメージのサイズは

```console
$ docker images hello-distroless

REPOSITORY         TAG       IMAGE ID       CREATED              SIZE
hello-distroless   latest    17244fa00d1a   About a minute ago   52.8MB
```

なので確かに `python:3-slim` よりは 100MB 以上小さい。

`gcr.io/distroless/python3:nonroot-amd64` では

- Python のバージョン - `3.11.2 (main, Mar 13 2023, 12:18:29) [GCC 12.2.0]`
- Python のフルパス - `/usr/bin/python3.11`
- ライブラリパス - `['/app', '/usr/lib/python311.zip', '/usr/lib/python3.11', '/usr/lib/python3.11/lib-dynload']`

でした(2024-07 現在)。ライブラリパスに cwd が入るらしい。

よくわからないのが
「どうやってこのスクリプトが起動してるのか」。あたかも `python hello.py /etc` みたいに起動してるけど。まあそういうものなのだろう。
