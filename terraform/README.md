## サーバーリソースのセットアップ

基本的にはこのリポジトリを踏襲する形で良い。

https://github.com/stoneream/gha-terraform-poc

ただ、Ansibleの検証を目的としている。
そのため、　バックエンドにS3は使用しない。

## required

- https://github.com/terraform-linters/tflint
- https://github.com/tfutils/tfenv
- https://direnv.net

## development

```bash
cp .envrc.sample .envrc

direnv allow

tfenv install

terraform init

tflint --init
tflint

terraform validate

terraform plan

terraform apply
```

## gha-terraform-pocと違う点について

インスタンスの初期化スクリプトを用意し、Ansible用のユーザーを作成している。
