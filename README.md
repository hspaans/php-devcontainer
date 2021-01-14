# Devcontainer for PHP

## Using within you project

Add `.devcontainer/devcontainer.json` to your repository.

```json
{
  "image": "ghcr.io/hspaans/php-devcontainer:latest",
  "name": "PHP",
  "settings": {
    "terminal.integrated.shell.linux": "/bin/bash"
  },
  "appPort": [],
  "postCreateCommand": "",
  "remoteUser": "vscode",
  "extensions": [
    "github.vscode-pull-request-github",
    "redhat.vscode-yaml",
    "yzhang.markdown-all-in-one",
    "felixfbecker.php-pack",
    "ikappas.phpcs",
    "junstyle.php-cs-fixer"
  ]
}
```

## Versions

The container is based on [LTS](https://en.wikipedia.org/wiki/Long-term_support) distribution versions with official support and fall within N and N-1. The *latest*-tag is an experimental tag to test future releases.

| Platform | Version | Image |
|:--------:|:-------:|:-----:|
| PHP      | 7.3     | [hspaans/php-devcontainer:7.3(.x)][php-devcontainer:7.3] |
| PHP      | 7.4     | [hspaans/php-devcontainer:7.4(.x)][php-devcontainer:7.4] |
| PHP      | 8.0     | [hspaans/php-devcontainer:8.0(.x)][php-devcontainer:8.0] |
| PHP      | 8.0     | [hspaans/php-devcontainer:latest][php-devcontainer:latest] |

[php-devcontainer:latest]: ghcr.io/hspaans/php-devcontainer:latest
[php-devcontainer:7.3]: ghcr.io/hspaans/php-devcontainer:7.3
[php-devcontainer:7.4]: ghcr.io/hspaans/php-devcontainer:7.4
[php-devcontainer:8.0]: ghcr.io/hspaans/php-devcontainer:8.0
