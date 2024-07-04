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

のように実行する。
