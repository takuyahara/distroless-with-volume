# distroless-with-volume

![version](https://img.shields.io/badge/version-1.0.0-brightgreen)

Distroless イメージを使う際にアプリへ複雑な（引数では十分に対応できない）設定情報を渡したい場合において、設定情報を Volume のマウントによって共有することで要件を満たせることの実証実験。

```shell
$ docker run --name distroless-with-volume --rm -v somewhere/config.json:/cfg/config.json ghcr.io/takuyahara/distroless-with-volume:latest
Hello world
Hello world
Hello world
$
```

**somewhere/config.json**

```jsonc
{
    "message": "Hello world",
    "repeat": 3
}
```